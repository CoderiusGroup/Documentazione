#!/usr/bin/env python3
"""
Rigenera i grafici del cruscotto di valutazione dei Piani di Qualifica.

Per ogni `Piano_di_Qualifica.typ` presente in `src/` legge le tabelle del
cruscotto e ne ricava i grafici:

  Figura 1 -> pv_ev_ac.png         da "Andamento di PV, EV e AC per sprint (valori cumulativi)"
  Figura 2 -> cpi_spi.png          da "Andamento di SPI e CPI per sprint"
  Figura 3 -> eac.png              da "Andamento di EAC per sprint"
  Figura 4 -> rsi.png              da "Andamento di RSI per sprint"
  Figura 7 -> qms.png              da "Andamento di Quality Metrics Satisfied per sprint"
  Figura 8 -> time_efficiency.png  da "Andamento di Time Efficiency per sprint"

I valori (sprint, misure, soglie di accettabilita') vengono dalle tabelle del
Piano di Qualifica; le date che compaiono sotto le etichette dell'asse x
vengono invece dal Piano di Progetto della stessa revisione, che ne e' la
fonte di verita' -- sezioni `== Sprint N` -> `=== Periodo` -> `Fine reale`.
Nulla e' scritto a mano nello script: aggiungendo uno sprint ai due documenti
i grafici si aggiornano da soli.

Ogni revisione (RTB, PB, ...) ha i suoi grafici in una sottocartella dedicata
di `src/images/cruscotto/`, cosi' i documenti gia' consegnati restano congelati
sui propri dati mentre le revisioni successive proseguono.

Uso:

    python3 .github/scripts/grafici_cruscotto.py            # tutte le revisioni
    python3 .github/scripts/grafici_cruscotto.py RTB        # solo la revisione RTB
    python3 .github/scripts/grafici_cruscotto.py --verifica # non scrive: dice se sono aggiornati

Richiede matplotlib (`pip install -r .github/scripts/requirements.txt`).
"""

from __future__ import annotations

import argparse
import os
import re
import sys
from pathlib import Path

# --------------------------------------------------------------------------- #
# Posizione dei file
# --------------------------------------------------------------------------- #

SCRIPT_DIR = Path(__file__).resolve().parent            # .github/scripts/
REPO_ROOT = SCRIPT_DIR.parent.parent                    # root del repo
CARTELLA_SRC = REPO_ROOT / "src"
CARTELLA_IMMAGINI = CARTELLA_SRC / "images" / "cruscotto"

NOME_QUALIFICA = "Piano_di_Qualifica.typ"
NOME_PROGETTO = "Piano_di_Progetto.typ"

# Palette campionata dai grafici storici del documento, per coerenza visiva.
BLU = "#1f5c9e"
VERDE = "#4a9d6a"
ARANCIONE = "#d4881f"
ROSSO = "#c0392b"
GRIGIO = "#7f7f7f"
GRIGLIA = "#d6d6d6"

DIMENSIONE_FIGURA = (8.9, 5.3)
DPI = 150


# --------------------------------------------------------------------------- #
# Individuazione dei documenti
# --------------------------------------------------------------------------- #

class Revisione:
    """Una revisione del progetto (RTB, PB, ...) con i suoi due piani."""

    def __init__(self, nome: str, qualifica: Path, progetto: Path | None):
        self.nome = nome
        self.qualifica = qualifica
        self.progetto = progetto

    @property
    def cartella_grafici(self) -> Path:
        """Dove il documento cerca i suoi grafici, letto dai suoi `image(...)`.

        Si scrive dove il Piano di Qualifica punta, invece di imporgli un
        percorso: cosi' un documento appena mergiato ottiene i grafici al
        posto giusto senza doverlo modificare prima, e non c'e' un ordine
        obbligato tra il merge del documento e quello di questo script.
        Se non referenzia ancora nessun grafico si usa una sottocartella
        dedicata alla revisione.
        """
        testo = self.qualifica.read_text(encoding="utf-8")
        cartelle = {
            (self.qualifica.parent / riferimento).resolve().parent
            for nome in NOMI_GRAFICI
            for riferimento in re.findall(rf'image\("([^"]*{re.escape(nome)})"', testo)
        }
        if not cartelle:
            return CARTELLA_IMMAGINI / self.nome
        if len(cartelle) > 1:
            raise ValueError(
                f"il Piano di Qualifica di {self.nome} cerca i grafici in piu' cartelle: "
                + ", ".join(sorted(str(c) for c in cartelle))
            )
        return cartelle.pop()

    def __str__(self) -> str:
        return self.nome


def trova_revisioni() -> list[Revisione]:
    """Le revisioni che contengono un Piano di Qualifica, in ordine alfabetico.

    Il nome della revisione e' la prima cartella sotto `src/` (RTB, PB, ...);
    il Piano di Progetto viene cercato accanto al Piano di Qualifica e, se
    non c'e', altrove nella stessa revisione.
    """
    revisioni = []
    for qualifica in sorted(CARTELLA_SRC.rglob(NOME_QUALIFICA)):
        relativo = qualifica.relative_to(CARTELLA_SRC)
        if len(relativo.parts) < 2:
            continue                                    # direttamente in src/: non ha revisione
        nome = relativo.parts[0]

        progetto = qualifica.with_name(NOME_PROGETTO)
        if not progetto.is_file():
            vicini = sorted((CARTELLA_SRC / nome).rglob(NOME_PROGETTO))
            progetto = vicini[0] if vicini else None

        revisioni.append(Revisione(nome, qualifica, progetto))
    return revisioni


# --------------------------------------------------------------------------- #
# Date degli sprint (dal Piano di Progetto)
# --------------------------------------------------------------------------- #

# `== Sprint 3` ... fino all'intestazione successiva di pari livello
_SEZIONE_SPRINT = re.compile(r"^==\s*Sprint\s+(\d+)\s*$(.*?)(?=^==\s|\Z)", re.MULTILINE | re.DOTALL)
_VOCE_PERIODO = re.compile(r"\*(Inizio|Fine prevista|Fine reale):\*\s*\]\s*,\s*\[([^\]]*)\]")


def leggi_date_sprint(progetto: Path) -> dict[int, str]:
    """Data di fine di ogni sprint, letta dalle sezioni `== Sprint N` del Piano di Progetto.

    Viene usata la fine reale; se lo sprint e' ancora in corso e la fine reale
    non e' compilata, si ripiega sulla fine prevista.
    """
    testo = _rimuovi_commenti(progetto.read_text(encoding="utf-8"))
    date: dict[int, str] = {}

    for sezione in _SEZIONE_SPRINT.finditer(testo):
        numero = int(sezione.group(1))
        voci = {etichetta: valore.strip() for etichetta, valore in _VOCE_PERIODO.findall(sezione.group(2))}
        fine = voci.get("Fine reale") or voci.get("Fine prevista")
        if fine:
            date[numero] = fine
    return date


def formato_data(data: str) -> str:
    """`2026/04/21` -> `21/04/26`; se il formato e' inatteso il testo resta com'e'."""
    parti = re.split(r"[/\-.]", data.strip())
    if len(parti) == 3 and all(p.isdigit() for p in parti):
        anno, mese, giorno = parti
        return f"{giorno.zfill(2)}/{mese.zfill(2)}/{anno[-2:]}"
    return data.strip()


def etichette_con_date(tabella: "Tabella", date: dict[int, str], contesto: str = "") -> list[str]:
    """Etichette dell'asse x: numero di sprint e, sotto, la data di fine.

    Gli sprint senza data nel Piano di Progetto restano con la sola etichetta
    testuale e vengono segnalati, perche' indicano che i due documenti non
    sono allineati.
    """
    etichette = []
    for riga in tabella.righe:
        indicatore = ripulisci(riga[0])
        etichetta = f"Sprint {indicatore}"
        data = date.get(int(indicatore)) if indicatore.isdigit() else None
        if data:
            etichetta += f"\n{formato_data(data)}"
        elif date:
            _segnala(
                f"lo sprint {indicatore} non ha una data nel {NOME_PROGETTO}: "
                f"l'etichetta resta senza data" + (f" ({contesto})." if contesto else ".")
            )
        etichette.append(etichetta)
    return etichette


# --------------------------------------------------------------------------- #
# Lettura delle tabelle Typst
# --------------------------------------------------------------------------- #

class Tabella:
    """Una tabella `#cruscotto-table(...)` letta dal documento."""

    def __init__(self, didascalia: str, intestazioni: list[str], righe: list[list[str]]):
        self.didascalia = didascalia
        self.intestazioni = intestazioni
        self.righe = righe
        self.date: dict[int, str] = {}      # fine sprint, dal Piano di Progetto

    def indice_colonna(self, *chiavi: str) -> int:
        """Indice della prima colonna la cui intestazione contiene tutte le chiavi."""
        for i, intestazione in enumerate(self.intestazioni):
            testo = intestazione.lower()
            if all(chiave.lower() in testo for chiave in chiavi):
                return i
        raise KeyError(
            f"Nella tabella «{self.didascalia}» manca una colonna per {chiavi}. "
            f"Intestazioni presenti: {self.intestazioni}"
        )

    def colonna(self, *chiavi: str) -> list[str]:
        i = self.indice_colonna(*chiavi)
        return [riga[i] for riga in self.righe]

    def numeri(self, *chiavi: str) -> list[float]:
        i = self.indice_colonna(*chiavi)
        return numeri_colonna(
            [riga[i] for riga in self.righe],
            f"{self.didascalia} → colonna «{self.intestazioni[i]}»",
        )

    def etichette_sprint(self) -> list[str]:
        return etichette_con_date(self, self.date, self.didascalia)

    def soglia(self) -> float | None:
        """Valore numerico letto dalla prima cella «Accettabile» della tabella."""
        for i, intestazione in enumerate(self.intestazioni):
            if "accettabil" in intestazione.lower():
                for riga in self.righe:
                    valore = numero_matematico(riga[i])
                    if valore is not None:
                        return valore
        return None


def _rimuovi_commenti(testo: str) -> str:
    return re.sub(r"/\*.*?\*/", "", testo, flags=re.DOTALL)


def _blocchi_chiamata(testo: str, funzione: str) -> list[str]:
    """Contenuto (parentesi escluse) di ogni chiamata a `funzione`."""
    apertura = funzione + "("
    blocchi, cursore = [], 0
    while True:
        inizio = testo.find(apertura, cursore)
        if inizio == -1:
            return blocchi
        i = inizio + len(apertura)
        profondita, dentro_stringa = 1, False
        while i < len(testo) and profondita:
            carattere = testo[i]
            if dentro_stringa:
                if carattere == "\\":
                    i += 2
                    continue
                if carattere == '"':
                    dentro_stringa = False
            elif carattere == '"':
                dentro_stringa = True
            elif carattere in "([{":
                profondita += 1
            elif carattere in ")]}":
                profondita -= 1
            i += 1
        blocchi.append(testo[inizio + len(apertura): i - 1])
        cursore = i


def _argomenti(blocco: str) -> list[str]:
    """Argomenti di primo livello, separati dalle virgole non annidate."""
    argomenti, corrente = [], []
    profondita, dentro_stringa = 0, False
    precedente = ""
    for carattere in blocco:
        if dentro_stringa:
            corrente.append(carattere)
            if carattere == '"' and precedente != "\\":
                dentro_stringa = False
            precedente = carattere
            continue
        if carattere == '"':
            dentro_stringa = True
            corrente.append(carattere)
        elif carattere in "([{":
            profondita += 1
            corrente.append(carattere)
        elif carattere in ")]}":
            profondita -= 1
            corrente.append(carattere)
        elif carattere == "," and profondita == 0:
            argomenti.append("".join(corrente))
            corrente = []
        else:
            corrente.append(carattere)
        precedente = carattere
    argomenti.append("".join(corrente))
    return [a.strip() for a in argomenti if a.strip()]


def _contenuto(argomento: str) -> str:
    """Toglie le parentesi quadre di un blocco di contenuto Typst."""
    argomento = argomento.strip()
    if argomento.startswith("[") and argomento.endswith("]"):
        argomento = argomento[1:-1]
    return argomento.strip()


def leggi_tabelle(percorso: Path, date: dict[int, str] | None = None) -> dict[str, Tabella]:
    """Tutte le tabelle del cruscotto, indicizzate per didascalia normalizzata.

    `date` sono le date di fine sprint lette dal Piano di Progetto: vengono
    agganciate a ogni tabella per comparire sotto le etichette dell'asse x.
    """
    testo = _rimuovi_commenti(percorso.read_text(encoding="utf-8"))
    tabelle: dict[str, Tabella] = {}

    for blocco in _blocchi_chiamata(testo, "#cruscotto-table"):
        argomenti = _argomenti(blocco)
        if len(argomenti) < 3:
            continue

        didascalia = ripulisci(_contenuto(argomenti[0]))
        intestazioni = re.findall(r'"([^"]*)"', argomenti[1])
        if not intestazioni:
            continue

        celle = [_contenuto(a) for a in argomenti[2:]]
        numero_colonne = len(intestazioni)
        righe = [
            celle[i: i + numero_colonne]
            for i in range(0, len(celle) - numero_colonne + 1, numero_colonne)
        ]
        if righe:
            tabella = Tabella(didascalia, intestazioni, righe)
            tabella.date = date or {}
            tabelle[normalizza(didascalia)] = tabella

    return tabelle


# --------------------------------------------------------------------------- #
# Conversione dei valori
# --------------------------------------------------------------------------- #

# Anomalie nei dati riscontrate durante la lettura, riepilogate a fine esecuzione.
AVVISI: list[str] = []


def _segnala(messaggio: str) -> None:
    """Registra un'anomalia nei dati, senza ripetizioni."""
    if messaggio not in AVVISI:
        AVVISI.append(messaggio)


_SOSTITUZIONI = str.maketrans({"−": "-", "–": "-", "—": "-", " ": " "})


def ripulisci(cella: str) -> str:
    """Toglie la formattazione Typst lasciando il testo leggibile."""
    testo = re.sub(r"#link\([^)]*\)", " ", cella)
    testo = testo.replace("*", "").replace("_", "")
    testo = testo.translate(_SOSTITUZIONI)
    return " ".join(testo.split())


def normalizza(testo: str) -> str:
    """Chiave di confronto per le didascalie: minuscole, senza punteggiatura."""
    return re.sub(r"[^a-z0-9]+", " ", ripulisci(testo).lower()).strip()


def _in_float(token: str) -> float:
    token = token.replace(" ", "")
    if "," in token:                                        # 1.680,50 -> 1680.50
        token = token.replace(".", "").replace(",", ".")
    elif re.fullmatch(r"-?\d{1,3}(\.\d{3})+", token):       # 10.680 -> 10680
        token = token.replace(".", "")
    return float(token)


def _token_numerico(cella: str) -> str:
    """Il primo numero della cella, ancora come testo."""
    testo = re.sub(r"\$[^$]*\$", " ", ripulisci(cella))     # via le formule (soglie)
    trovato = re.search(r"-?\d+(?:[.,]\d{3})*(?:,\d+)?", testo)
    if not trovato:
        raise ValueError(f"Nessun valore numerico nella cella «{cella}»")
    return trovato.group(0)


def numero_italiano(cella: str) -> float:
    """Primo numero della cella, in notazione italiana (. migliaia, , decimali)."""
    return _in_float(_token_numerico(cella))


# Gruppi da tre cifre: `10.680` (corretto) e `10,142` (virgola usata per le migliaia).
_MIGLIAIA_PUNTO = re.compile(r"-?\d{1,3}(?:\.\d{3})+$")
_MIGLIAIA_VIRGOLA = re.compile(r"-?\d{1,3}(?:,\d{3})+$")


def numeri_colonna(celle: list[str], contesto: str = "") -> list[float]:
    """Converte una colonna di celle, risolvendo il separatore in base al contesto.

    In italiano `9,834` sono nove virgola 834; ma se nella stessa colonna
    compaiono valori come `10.502`, dove il punto separa le migliaia, allora
    quella virgola e' quasi certamente un refuso per il punto. In quel caso il
    valore viene letto come 9834 e viene segnalato, perche' resta un errore da
    correggere nel documento (la tabella stampata mostra comunque `9,834`).
    """
    token = [_token_numerico(cella) for cella in celle]
    migliaia_col_punto = any(_MIGLIAIA_PUNTO.fullmatch(t) for t in token)

    valori = []
    for t in token:
        if migliaia_col_punto and _MIGLIAIA_VIRGOLA.fullmatch(t):
            corretto = t.replace(",", ".")
            _segnala(
                f"«{t}» usa la virgola come separatore delle migliaia, "
                f"mentre nella stessa colonna si usa il punto: lo interpreto come «{corretto}». "
                f"Da correggere nel documento" + (f" ({contesto})." if contesto else ".")
            )
            valori.append(_in_float(corretto))
        else:
            valori.append(_in_float(t))
    return valori


def numero_matematico(cella: str) -> float | None:
    """Primo numero dentro una formula `$...$`, in notazione ASCII (. decimali)."""
    formula = re.search(r"\$([^$]*)\$", ripulisci(cella))
    if not formula:
        return None
    trovato = re.search(r"-?\d+(?:[.,]\d+)?", formula.group(1))
    return float(trovato.group(0).replace(",", ".")) if trovato else None


def formato_italiano(valore: float, decimali: int = 0) -> str:
    """1234.5 -> '1.234,5'"""
    testo = f"{valore:,.{decimali}f}"
    return testo.replace(",", "\x00").replace(".", ",").replace("\x00", ".")


# --------------------------------------------------------------------------- #
# Impostazioni comuni dei grafici
# --------------------------------------------------------------------------- #

def _nuova_figura(titolo: str, etichette_x: list[str], etichetta_y: str | None = None):
    fig, ax = plt.subplots(figsize=DIMENSIONE_FIGURA)

    ax.set_title(titolo, fontsize=15, fontweight="bold", pad=16)
    if etichetta_y:
        ax.set_ylabel(etichetta_y, fontsize=11)

    ax.set_xticks(range(len(etichette_x)))
    ax.set_xticklabels(etichette_x, fontsize=11)
    ax.set_xlim(-0.35, len(etichette_x) - 0.65)

    ax.yaxis.grid(True, linestyle="--", linewidth=0.8, color=GRIGLIA)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.tick_params(axis="y", length=0, labelsize=11)
    ax.tick_params(axis="x", direction="out", length=4, color=GRIGIO)

    return fig, ax


def _formatta_asse_y(ax, funzione) -> None:
    ax.yaxis.set_major_formatter(FuncFormatter(lambda valore, _: funzione(valore)))


def _limiti(valori: list[float], *riferimenti: float, margine: float = 0.12) -> tuple[float, float]:
    """Estremi dell'asse y che comprendono valori e linee di riferimento."""
    tutti = list(valori) + [r for r in riferimenti if r is not None]
    minimo, massimo = min(tutti), max(tutti)
    respiro = (massimo - minimo) * margine or max(abs(massimo) * 0.05, 1.0)
    return minimo - respiro, massimo + respiro


def _legenda(ax, **extra):
    return ax.legend(fontsize=11, framealpha=0.95, edgecolor=GRIGLIA, **extra)


def _spazio_per_legenda(fig, ax, legenda, serie: list[list[float]], in_alto: bool = True) -> None:
    """Allarga l'asse y finche' la legenda non si sovrappone alle serie.

    Serve a mantenere il grafico leggibile anche quando cambiano i dati:
    con l'aggiunta di nuovi sprint la legenda potrebbe finire sopra la curva.
    """
    for _ in range(8):
        fig.canvas.draw()
        riquadro = legenda.get_window_extent().transformed(ax.transData.inverted())
        coperti = [
            valore
            for valori in serie
            for i, valore in enumerate(valori)
            if riquadro.x0 - 0.5 <= i <= riquadro.x1 + 0.5
        ]
        if not coperti:
            return

        basso, alto = ax.get_ylim()
        respiro = (alto - basso) * 0.04
        if in_alto:
            necessario = max(coperti) + respiro
            if riquadro.y0 >= necessario:
                return
            ax.set_ylim(basso, alto + (necessario - riquadro.y0) * 1.15)
        else:
            necessario = min(coperti) - respiro
            if riquadro.y1 <= necessario:
                return
            ax.set_ylim(basso - (riquadro.y1 - necessario) * 1.15, alto)


def _salva(fig, cartella: Path, nome: str) -> Path:
    cartella.mkdir(parents=True, exist_ok=True)
    destinazione = cartella / nome
    fig.tight_layout()
    # Senza `Software` il PNG non contiene la versione di matplotlib: a parita'
    # di dati il file e' identico byte per byte, e la CI non committa a vuoto.
    fig.savefig(destinazione, dpi=DPI, facecolor="white", metadata={"Software": None})
    plt.close(fig)
    return destinazione


# --------------------------------------------------------------------------- #
# I sei grafici
# --------------------------------------------------------------------------- #

def grafico_pv_ev_ac(tabella: Tabella, cartella: Path) -> Path:
    """Figura 1 - PV, EV e AC cumulativi."""
    sprint = tabella.etichette_sprint()
    pv = tabella.numeri("PV")
    ev = tabella.numeri("EV")
    ac = tabella.numeri("AC")

    fig, ax = _nuova_figura(
        "MPC-01, MPC-02, MPC-03 — PV, EV e AC cumulativi", sprint, "Valore cumulativo (€)"
    )
    ax.plot(sprint, pv, color=BLU, marker="o", markersize=7, linewidth=2.2, label="PV (Planned Value)")
    ax.plot(sprint, ev, color=VERDE, marker="s", markersize=7, linewidth=2.2, label="EV (Earned Value)")
    ax.plot(sprint, ac, color=ARANCIONE, marker="^", markersize=7, linewidth=2.2, label="AC (Actual Cost)")

    ax.set_ylim(*_limiti(pv + ev + ac, margine=0.08))
    _formatta_asse_y(ax, lambda v: f"€{formato_italiano(v)}")
    _spazio_per_legenda(fig, ax, _legenda(ax, loc="upper left"), [pv, ev, ac])
    return _salva(fig, cartella, "pv_ev_ac.png")


def grafico_cpi_spi(tabella: Tabella, cartella: Path) -> Path:
    """Figura 2 - CPI e SPI."""
    sprint = tabella.etichette_sprint()
    cpi = tabella.numeri("CPI")
    spi = tabella.numeri("SPI")
    soglia = tabella.soglia()

    fig, ax = _nuova_figura("MPC-04, MPC-05 — CPI e SPI", sprint)
    ax.plot(sprint, cpi, color=BLU, marker="o", markersize=7, linewidth=2.2, label="CPI")
    ax.plot(sprint, spi, color=VERDE, marker="s", markersize=7, linewidth=2.2, label="SPI")
    if soglia is not None:
        ax.axhline(soglia, color=ROSSO, linestyle=":", linewidth=1.4,
                   label=f"Soglia accettabile ({formato_italiano(soglia, 2)})")
    ax.axhline(1.0, color=GRIGIO, linestyle=":", linewidth=1.4,
               label=f"Valore ottimo ({formato_italiano(1, 2)})")

    basso, alto = _limiti(cpi + spi, soglia, 1.0, margine=0.25)
    ax.set_ylim(min(basso, (soglia or 1.0) - 0.05), alto)
    _formatta_asse_y(ax, lambda v: formato_italiano(v, 3))
    _spazio_per_legenda(fig, ax, _legenda(ax, loc="upper left"), [cpi, spi])
    return _salva(fig, cartella, "cpi_spi.png")


def grafico_eac(tabella: Tabella, cartella: Path) -> Path:
    """Figura 3 - EAC rispetto al BAC."""
    sprint = tabella.etichette_sprint()
    eac = tabella.numeri("EAC")
    bac = tabella.numeri("BAC")[0]
    moltiplicatore = tabella.soglia() or 1.1
    soglia_massima = bac * moltiplicatore
    percentuale = round((moltiplicatore - 1) * 100)

    fig, ax = _nuova_figura("MPC-06 — Estimate at Completion (EAC)", sprint, "Valore (€)")
    ax.plot(sprint, eac, color=BLU, marker="o", markersize=7, linewidth=2.2, label="EAC")
    ax.axhline(bac, color=GRIGIO, linestyle=":", linewidth=1.6,
               label=f"BAC (€{formato_italiano(bac)})")
    ax.axhline(soglia_massima, color=ROSSO, linestyle="--", linewidth=1.4,
               label=f"Soglia max (+{percentuale}%)")

    ax.set_ylim(*_limiti(eac, bac, soglia_massima, margine=0.15))
    _formatta_asse_y(ax, lambda v: f"€{formato_italiano(v)}")
    _spazio_per_legenda(fig, ax, _legenda(ax, loc="upper right"), [eac])
    return _salva(fig, cartella, "eac.png")


def grafico_rsi(tabella: Tabella, cartella: Path) -> Path:
    """Figura 4 - Requirements Stability Index."""
    sprint = tabella.etichette_sprint()
    rsi = tabella.numeri("RSI")
    soglia = tabella.soglia()

    fig, ax = _nuova_figura("MPC-08 — Requirements Stability Index (RSI)", sprint)
    ax.plot(sprint, rsi, color=BLU, marker="o", markersize=7, linewidth=2.2, label="RSI")
    if soglia is not None:
        ax.axhline(soglia, color=ROSSO, linestyle=":", linewidth=1.4,
                   label=f"Soglia accettabile ({formato_italiano(soglia, 2)})")
    ax.axhline(1.0, color=GRIGIO, linestyle=":", linewidth=1.4,
               label=f"Valore ottimo ({formato_italiano(1, 2)})")

    basso, alto = _limiti(rsi, soglia, 1.0, margine=0.12)
    ax.set_ylim(basso, min(alto, 1.03))
    _formatta_asse_y(ax, lambda v: formato_italiano(v, 3))
    _spazio_per_legenda(fig, ax, _legenda(ax, loc="lower right"), [rsi], in_alto=False)
    return _salva(fig, cartella, "rsi.png")


def grafico_qms(tabella: Tabella, cartella: Path) -> Path:
    """Figura 7 - Quality Metrics Satisfied."""
    sprint = tabella.etichette_sprint()
    qms = tabella.numeri("QMS")

    fig, ax = _nuova_figura("MPC-13 — Quality Metrics Satisfied (QMS)", sprint)
    ax.bar(sprint, qms, width=0.6, color=VERDE, alpha=0.85, label="QMS")
    ax.axhline(100, color=GRIGIO, linestyle=":", linewidth=1.4, label="Valore ottimo (100%)")

    ax.set_ylim(0, max(105, max(qms) * 1.05))
    ax.set_yticks(range(0, 101, 20))
    _formatta_asse_y(ax, lambda v: f"{formato_italiano(v)}%")
    _legenda(ax, loc="lower left")
    return _salva(fig, cartella, "qms.png")


def grafico_time_efficiency(tabella: Tabella, cartella: Path) -> Path:
    """Figura 8 - Time Efficiency."""
    sprint = tabella.etichette_sprint()
    te = tabella.numeri("TE")
    soglia = tabella.soglia()

    fig, ax = _nuova_figura("MPC-14 — Time Efficiency (TE)", sprint)
    ax.plot(sprint, te, color=BLU, marker="o", markersize=7, linewidth=2.2, label="Time Efficiency")
    if soglia is not None:
        ax.axhline(soglia, color=ROSSO, linestyle=":", linewidth=1.4,
                   label=f"Soglia accettabile ({formato_italiano(soglia)}%)")
    ax.axhline(100, color=GRIGIO, linestyle=":", linewidth=1.4, label="Valore ottimo (100%)")

    basso, alto = _limiti(te, soglia, 100.0, margine=0.2)
    ax.set_ylim(basso, alto)
    _formatta_asse_y(ax, lambda v: f"{formato_italiano(v, 1)}%")
    _spazio_per_legenda(fig, ax, _legenda(ax, loc="upper right"), [te])
    return _salva(fig, cartella, "time_efficiency.png")


# I PNG per revisione: si controlla che il documento punti alla propria sottocartella.
NOMI_GRAFICI = (
    "pv_ev_ac.png",
    "cpi_spi.png",
    "eac.png",
    "rsi.png",
    "qms.png",
    "time_efficiency.png",
    # prodotti da storico_metriche.py, ma anch'essi specifici della revisione
    "grafico_gulpease.png",
    "grafico_errori_ortografici.png",
)

# Didascalia della tabella (come compare nel documento) -> funzione che la disegna.
GRAFICI = [
    ("Figura 1", "Andamento di PV, EV e AC per sprint (valori cumulativi)", grafico_pv_ev_ac),
    ("Figura 2", "Andamento di SPI e CPI per sprint", grafico_cpi_spi),
    ("Figura 3", "Andamento di EAC per sprint", grafico_eac),
    ("Figura 4", "Andamento di RSI per sprint", grafico_rsi),
    ("Figura 7", "Andamento di Quality Metrics Satisfied per sprint", grafico_qms),
    ("Figura 8", "Andamento di Time Efficiency per sprint", grafico_time_efficiency),
]



# --------------------------------------------------------------------------- #
# Generazione di una revisione
# --------------------------------------------------------------------------- #

def _importa_matplotlib() -> None:
    """Import ritardato, per poter dare un messaggio d'errore comprensibile."""
    global plt, FuncFormatter
    try:
        import matplotlib
        matplotlib.use("Agg")                 # nessuna finestra: solo file PNG
        import matplotlib.pyplot as plt       # noqa: F811
        from matplotlib.ticker import FuncFormatter  # noqa: F811
    except ImportError:
        raise SystemExit(
            "Errore: matplotlib non e' installato.\n"
            "Installalo con:  python3 -m pip install -r .github/scripts/requirements.txt"
        )


def verifica_collisioni(revisioni: list[Revisione]) -> list[str]:
    """Due revisioni non possono scrivere gli stessi PNG.

    Ogni revisione ha il suo numero di sprint: se due Piani di Qualifica
    puntassero alla stessa cartella, l'ultimo generato sovrascriverebbe i
    grafici dell'altro e un documento mostrerebbe dati non suoi.
    """
    per_cartella: dict[Path, list[str]] = {}
    problemi = []
    for revisione in revisioni:
        try:
            cartella = revisione.cartella_grafici
        except ValueError as errore:
            problemi.append(str(errore))
            continue
        per_cartella.setdefault(cartella, []).append(revisione.nome)

    for cartella, nomi in per_cartella.items():
        if len(nomi) > 1:
            try:
                dove = cartella.relative_to(REPO_ROOT)
            except ValueError:
                dove = cartella
            problemi.append(
                f"le revisioni {', '.join(nomi)} cercano i grafici nella stessa cartella "
                f"«{dove}»: si sovrascriverebbero a vicenda. Dai a una delle due una "
                f"sottocartella propria (es. images/cruscotto/{nomi[-1]}/) nei suoi «image(...)»."
            )
    return problemi


def genera_revisione(revisione: Revisione, solo_verifica: bool = False) -> tuple[list[str], list[str]]:
    """Rigenera i grafici di una revisione. Restituisce (righe di esito, problemi)."""
    esiti: list[str] = []
    problemi: list[str] = []

    date: dict[int, str] = {}
    if revisione.progetto is None:
        problemi.append(f"revisione {revisione}: manca il {NOME_PROGETTO}, niente date sull'asse x")
    else:
        date = leggi_date_sprint(revisione.progetto)
        if not date:
            problemi.append(
                f"revisione {revisione}: nessuna sezione «== Sprint N» con «Periodo» "
                f"in {revisione.progetto.relative_to(REPO_ROOT)}"
            )

    tabelle = leggi_tabelle(revisione.qualifica, date)
    if not tabelle:
        problemi.append(
            f"revisione {revisione}: nessuna tabella #cruscotto-table "
            f"in {revisione.qualifica.relative_to(REPO_ROOT)}"
        )
        return esiti, problemi

    for figura, didascalia, disegna in GRAFICI:
        tabella = tabelle.get(normalizza(didascalia))
        if tabella is None:
            problemi.append(f"revisione {revisione}, {figura}: manca la tabella «{didascalia}»")
            continue
        try:
            if solo_verifica:
                esiti.append(f"{figura} — {len(tabella.righe)} sprint (non scritto)")
                continue
            destinazione = disegna(tabella, revisione.cartella_grafici)
        except (KeyError, ValueError) as errore:
            problemi.append(f"revisione {revisione}, {figura}: {errore}")
            continue
        esiti.append(f"{figura} — {destinazione.name} ({len(tabella.righe)} sprint)")

    return esiti, problemi


# --------------------------------------------------------------------------- #
# Avvio
# --------------------------------------------------------------------------- #

def _riepilogo_azioni(blocco: str) -> None:
    """Aggiunge il riepilogo alla pagina della run, quando si gira su GitHub Actions."""
    percorso = os.environ.get("GITHUB_STEP_SUMMARY")
    if not percorso:
        return
    with open(percorso, "a", encoding="utf-8") as riepilogo:
        riepilogo.write(blocco)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Rigenera i grafici del cruscotto dei Piani di Qualifica presenti in src/.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "revisioni", nargs="*", metavar="REVISIONE",
        help="Revisioni da elaborare (es. RTB PB). Se omesse, tutte quelle trovate.",
    )
    parser.add_argument(
        "-v", "--verifica", action="store_true",
        help="Non scrive i PNG: controlla solo che documenti e tabelle siano a posto.",
    )
    argomenti = parser.parse_args(argv)

    trovate = trova_revisioni()
    if not trovate:
        print(f"Errore: nessun {NOME_QUALIFICA} sotto {CARTELLA_SRC.relative_to(REPO_ROOT)}/",
              file=sys.stderr)
        return 1

    if argomenti.revisioni:
        richieste = {r.upper() for r in argomenti.revisioni}
        selezionate = [r for r in trovate if r.nome.upper() in richieste]
        sconosciute = richieste - {r.nome.upper() for r in trovate}
        if sconosciute:
            print(f"Errore: revisioni inesistenti: {', '.join(sorted(sconosciute))}. "
                  f"Disponibili: {', '.join(r.nome for r in trovate)}", file=sys.stderr)
            return 1
    else:
        selezionate = trovate

    if not argomenti.verifica:
        _importa_matplotlib()

    righe_riepilogo = ["## Grafici del cruscotto\n"]
    # Il controllo guarda tutte le revisioni, non solo quelle selezionate:
    # una collisione riguarda per definizione una coppia.
    problemi: list[str] = verifica_collisioni(trovate)

    for revisione in selezionate:
        print(f"\nRevisione {revisione}")
        print(f"  qualifica: {revisione.qualifica.relative_to(REPO_ROOT)}")
        if revisione.progetto:
            print(f"  progetto:  {revisione.progetto.relative_to(REPO_ROOT)}")
        try:
            print(f"  grafici:   {revisione.cartella_grafici.relative_to(REPO_ROOT)}")
        except ValueError:
            pass

        esiti, guai = genera_revisione(revisione, argomenti.verifica)
        problemi.extend(guai)

        righe_riepilogo.append(f"\n### {revisione}\n")
        for esito in esiti:
            print(f"  ✓ {esito}")
            righe_riepilogo.append(f"- ✅ {esito}\n")
        if not esiti:
            righe_riepilogo.append("- nessun grafico generato\n")

    sys.stdout.flush()          # nei log della CI stdout e stderr restano in ordine

    if AVVISI:
        print("\nAnomalie nei dati dei documenti:", file=sys.stderr)
        righe_riepilogo.append("\n### Anomalie nei dati\n")
        for avviso in AVVISI:
            print(f"  ! {avviso}", file=sys.stderr)
            righe_riepilogo.append(f"- ⚠️ {avviso}\n")

    if problemi:
        sys.stderr.flush()
        print("\nProblemi:", file=sys.stderr)
        righe_riepilogo.append("\n### Problemi\n")
        for problema in problemi:
            print(f"  ✗ {problema}", file=sys.stderr)
            righe_riepilogo.append(f"- ❌ {problema}\n")

    _riepilogo_azioni("".join(righe_riepilogo))

    if problemi:
        return 1
    azione = "verificate" if argomenti.verifica else "aggiornate"
    print(f"\nFatto: {len(selezionate)} revisioni {azione}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
