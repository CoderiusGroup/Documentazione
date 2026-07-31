#!/usr/bin/env python3
"""
Tiene lo storico per sprint di Gulpease e correttezza ortografica, e ne
disegna i grafici del Piano di Qualifica.

  grafico_gulpease.png            andamento dell'Indice di Gulpease per documento
  grafico_errori_ortografici.png  andamento degli errori ortografici per documento

Lo storico e' *append-only*: sta in `src/metrics/storico_gulpease.json` e
`src/metrics/storico_ortografia.json`, e ogni esecuzione riscrive soltanto la
voce dello sprint in corso. Gli sprint gia' chiusi non vengono piu' toccati.

E' questo che rende il dato storico davvero storico: se lo sprint 4 si e'
chiuso con tre errori nei verbali, quel 3 resta li' per sempre. Correggendo
oggi quei refusi il grafico scende sullo sprint corrente -- che e' quando la
correzione e' effettivamente avvenuta -- e non riscrive il passato.

Lo sprint in corso e le date vengono dal Piano di Progetto (sezioni
`== Sprint N` -> `=== Periodo`), la stessa fonte usata da grafici_cruscotto.py.
Le misure usano gulpease.py e ortografia.py, cosi' i numeri coincidono con
quelli di `src/metrics/gulpease.json` e `ortografia.json`.

Uso:

    python3 .github/scripts/storico_metriche.py             # aggiorna storico e grafici
    python3 .github/scripts/storico_metriche.py --solo-grafici   # ridisegna e basta
    python3 .github/scripts/storico_metriche.py --verifica       # non scrive nulla

Richiede matplotlib e, per l'ortografia, aspell con dizionario italiano.
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from datetime import date
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))                 # per importare gli script vicini

import gulpease                                     # noqa: E402
import ortografia                                   # noqa: E402
from grafici_cruscotto import (                     # noqa: E402
    GRIGIO,
    GRIGLIA,
    NOME_PROGETTO,
    Revisione,
    formato_data,
    leggi_date_sprint,
    leggi_tabelle,
    ripulisci,
    trova_revisioni,
)

REPO_ROOT = SCRIPT_DIR.parent.parent
CARTELLA_METRICHE = REPO_ROOT / "src" / "metrics"

STORICO_GULPEASE = CARTELLA_METRICHE / "storico_gulpease.json"
STORICO_ORTOGRAFIA = CARTELLA_METRICHE / "storico_ortografia.json"

NOME_GRAFICO_GULPEASE = "grafico_gulpease.png"
NOME_GRAFICO_ORTOGRAFIA = "grafico_errori_ortografici.png"

SOGLIA_GULPEASE = 40                                # sotto questo valore il testo e' ostico
OTTIMO_GULPEASE = 60

DIMENSIONE_FIGURA = (8.9, 5.3)
DPI = 150

# Un colore per documento, stabile tra un'esecuzione e l'altra.
COLORI = {
    "Analisi dei requisiti": "#4a9d6a",
    "Norme di progetto": "#1f5c9e",
    "Piano di progetto": "#c0392b",
    "Piano di qualifica": "#d4881f",
    "Verbali": "#7d5ba6",
}
COLORE_RESIDUO = "#7f7f7f"


# --------------------------------------------------------------------------- #
# Classificazione dei documenti
# --------------------------------------------------------------------------- #

def categoria(percorso: Path | str) -> str | None:
    """Il documento a cui appartiene un file, o None se non va conteggiato."""
    nome = Path(percorso).name.lower()
    if "verbale" in nome:
        return "Verbali"
    if "norme" in nome and "progetto" in nome:
        return "Norme di progetto"
    if "qualifica" in nome:
        return "Piano di qualifica"
    if "analisi" in nome and "requisiti" in nome:
        return "Analisi dei requisiti"
    if "piano" in nome and "progetto" in nome:
        return "Piano di progetto"
    return None


# Le revisioni in ordine cronologico: serve a scegliere la copia piu' recente
# di un documento che esiste in piu' baseline.
ORDINE_REVISIONI = ("Candidatura", "RTB", "PB")


def _eta_revisione(percorso: Path | str) -> int:
    parti = Path(percorso).parts
    for posizione, nome in enumerate(ORDINE_REVISIONI):
        if nome in parti:
            return posizione
    return -1


def file_da_contare(percorsi) -> list[Path]:
    """Un file per documento, per non contare due volte lo stesso testo.

    Lo stesso documento vive in piu' baseline (`src/RTB/...` e `src/PB/...`) e
    a volte sopravvive una copia con il vecchio nome: sommarle gonfierebbe la
    misura. Si tiene la copia della baseline piu' recente. I verbali fanno
    eccezione, sono documenti distinti e vanno sommati tutti.
    """
    scelti: dict[tuple, Path] = {}
    for percorso in percorsi:
        cat = categoria(percorso)
        if cat is None:
            continue
        chiave = (cat, Path(percorso).name) if cat == "Verbali" else (cat,)
        precedente = scelti.get(chiave)
        if precedente is None or _eta_revisione(percorso) > _eta_revisione(precedente):
            scelti[chiave] = Path(percorso)
    return sorted(scelti.values())


# --------------------------------------------------------------------------- #
# Misura sullo stato attuale del repository
# --------------------------------------------------------------------------- #

def misura_gulpease() -> dict[str, dict[str, int]]:
    """Parole, lettere e frasi di ogni documento, sommate per categoria."""
    totali: dict[str, dict[str, int]] = {}
    for percorso in file_da_contare(gulpease.find_typ_files()):
        cat = categoria(percorso)
        testo = gulpease.strip_typst(percorso.read_text(encoding="utf-8", errors="ignore"))
        punteggio, parole, lettere, frasi = gulpease.gulpease(testo)
        if punteggio is None:                       # documento troppo corto
            continue
        voce = totali.setdefault(cat, {"parole": 0, "lettere": 0, "frasi": 0})
        voce["parole"] += parole
        voce["lettere"] += lettere
        voce["frasi"] += frasi
    return dict(sorted(totali.items()))


def misura_ortografia() -> dict[str, dict]:
    """Errori ortografici di ogni documento, sommati per categoria."""
    parole_note = ortografia.load_wordlist() | ortografia.load_glossary_words()
    totali: dict[str, dict] = {}
    for percorso in file_da_contare(ortografia.find_typ_files()):
        cat = categoria(percorso)
        testo = ortografia.strip_typst(percorso.read_text(encoding="utf-8", errors="ignore"))
        quanti, parole = ortografia.check_spelling(
            ortografia.preprocess_for_spellcheck(testo), parole_note
        )
        if quanti is None:                          # aspell non disponibile
            raise SystemExit(
                "Errore: aspell non e' disponibile, impossibile misurare l'ortografia.\n"
                "Installalo con:  sudo apt-get install -y aspell aspell-it"
            )
        voce = totali.setdefault(cat, {"errori": 0, "parole_segnalate": []})
        voce["errori"] += quanti
        voce["parole_segnalate"].extend(parole)
    for voce in totali.values():
        voce["parole_segnalate"] = sorted(set(voce["parole_segnalate"]))
    return dict(sorted(totali.items()))


# --------------------------------------------------------------------------- #
# Storico append-only
# --------------------------------------------------------------------------- #

def carica_storico(percorso: Path) -> dict:
    if not percorso.is_file():
        return {"sprint": []}
    return json.loads(percorso.read_text(encoding="utf-8"))


def sprint_corrente(date_sprint: dict[int, str], oggi: str) -> int | None:
    """Lo sprint in cui ricade oggi: il primo che non si e' ancora chiuso.

    Se sono tutti chiusi si aggiorna l'ultimo, cosi' le correzioni fatte dopo
    la fine del progetto restano comunque visibili sull'ultimo punto.
    """
    if not date_sprint:
        return None
    aperti = [n for n, fine in sorted(date_sprint.items()) if _iso(fine) >= oggi]
    return aperti[0] if aperti else max(date_sprint)


def _iso(data: str) -> str:
    """`2026/04/21` -> `2026-04-21`, per poter confrontare le date come stringhe."""
    return data.strip().replace("/", "-")


def aggiorna_storico(percorso: Path, numero: int, fine: str,
                     documenti: dict, oggi: str) -> tuple[dict, bool]:
    """Scrive la voce dello sprint indicato, lasciando intatte tutte le altre."""
    storico = carica_storico(percorso)
    voci = storico.setdefault("sprint", [])

    nuova = {"numero": numero, "fine": _iso(fine), "aggiornato": oggi, "documenti": documenti}
    for i, voce in enumerate(voci):
        if voce.get("numero") == numero:
            cambiata = voce.get("documenti") != documenti
            voci[i] = nuova
            break
    else:
        cambiata = True
        voci.append(nuova)

    voci.sort(key=lambda v: v.get("numero", 0))
    return storico, cambiata


def salva_storico(percorso: Path, storico: dict) -> None:
    percorso.parent.mkdir(parents=True, exist_ok=True)
    percorso.write_text(json.dumps(storico, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


# --------------------------------------------------------------------------- #
# Grafici
# --------------------------------------------------------------------------- #

def _importa_matplotlib() -> None:
    global plt
    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt            # noqa: F811
    except ImportError:
        raise SystemExit(
            "Errore: matplotlib non e' installato.\n"
            "Installalo con:  python3 -m pip install -r .github/scripts/requirements.txt"
        )


def _nuova_figura(titolo: str, etichette: list[str], etichetta_y: str):
    fig, ax = plt.subplots(figsize=DIMENSIONE_FIGURA)
    ax.set_title(titolo, fontsize=15, fontweight="bold", pad=16)
    ax.set_ylabel(etichetta_y, fontsize=11)
    ax.set_xticks(range(len(etichette)))
    ax.set_xticklabels(etichette, fontsize=11)
    ax.set_xlim(-0.35, len(etichette) - 0.65)
    ax.yaxis.grid(True, linestyle="--", linewidth=0.8, color=GRIGLIA)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.tick_params(axis="y", length=0, labelsize=11)
    ax.tick_params(axis="x", direction="out", length=4, color=GRIGIO)
    return fig, ax


def _salva(fig, cartella: Path, nome: str) -> Path:
    cartella.mkdir(parents=True, exist_ok=True)
    destinazione = cartella / nome
    fig.tight_layout()
    fig.savefig(destinazione, dpi=DPI, facecolor="white", metadata={"Software": None})
    plt.close(fig)
    return destinazione


def _serie(voci: list[dict], estrai) -> dict[str, list[float | None]]:
    """Per ogni documento, il valore in ciascuno sprint (None dove non esisteva)."""
    documenti = sorted({d for voce in voci for d in voce.get("documenti", {})})
    return {
        documento: [estrai(voce["documenti"].get(documento)) for voce in voci]
        for documento in documenti
    }


def _traccia(ax, serie: dict[str, list[float | None]]) -> None:
    for documento, valori in serie.items():
        x = [i for i, v in enumerate(valori) if v is not None]
        y = [v for v in valori if v is not None]
        if not x:
            continue
        ax.plot(x, y, marker="o", markersize=6, linewidth=2.2,
                color=COLORI.get(documento, COLORE_RESIDUO), label=documento)


def _indice_gulpease(voce: dict | None) -> float | None:
    if not voce or voce.get("parole", 0) < gulpease.MIN_WORDS:
        return None
    return round(89 + (300 * voce["frasi"] - 10 * voce["lettere"]) / voce["parole"], 1)


def grafico_gulpease(voci: list[dict], etichette: list[str], cartella: Path) -> Path:
    serie = _serie(voci, _indice_gulpease)
    fig, ax = _nuova_figura(
        "MPC-09 — Indice di Gulpease per documento", etichette, "Indice di Gulpease"
    )
    ax.axhline(OTTIMO_GULPEASE, color=GRIGIO, linestyle=":", linewidth=1.4,
               label=f"Valore ottimo ({OTTIMO_GULPEASE})")
    ax.axhline(SOGLIA_GULPEASE, color="#c0392b", linestyle=":", linewidth=1.4,
               label=f"Soglia accettabile ({SOGLIA_GULPEASE})")
    _traccia(ax, serie)

    valori = [v for lista in serie.values() for v in lista if v is not None]
    basso = min([SOGLIA_GULPEASE, *valori]) - 6 if valori else 0
    alto = max([OTTIMO_GULPEASE, *valori]) + 10 if valori else 100
    ax.set_ylim(basso, alto)
    ax.legend(fontsize=9, ncol=2, framealpha=0.95, edgecolor=GRIGLIA, loc="upper left")
    return _salva(fig, cartella, NOME_GRAFICO_GULPEASE)


def grafico_ortografia(voci: list[dict], etichette: list[str], cartella: Path) -> Path:
    serie = _serie(voci, lambda v: float(v["errori"]) if v else None)
    fig, ax = _nuova_figura(
        "MPC-10 — Errori ortografici per documento", etichette, "Numero di errori"
    )
    _traccia(ax, serie)

    massimo = max([v for lista in serie.values() for v in lista if v is not None] or [0])
    ax.set_ylim(-0.4, max(massimo + 1.5, 5))
    ax.set_yticks(range(0, int(max(massimo, 4)) + 2))
    ax.legend(fontsize=9, ncol=2, framealpha=0.95, edgecolor=GRIGLIA, loc="upper left")
    return _salva(fig, cartella, NOME_GRAFICO_ORTOGRAFIA)


def sprint_della_revisione(revisione: Revisione) -> list[int]:
    """Gli sprint commentati dal Piano di Qualifica di quella revisione.

    I due grafici si fermano dove si fermano gli altri sei del cruscotto, cosi'
    tutte le figure del documento hanno lo stesso asse x.
    """
    for tabella in leggi_tabelle(revisione.qualifica).values():
        numeri = [int(ripulisci(r[0])) for r in tabella.righe if ripulisci(r[0]).isdigit()]
        if numeri:
            return sorted(numeri)
    return []


# --------------------------------------------------------------------------- #
# Avvio
# --------------------------------------------------------------------------- #

def _riepilogo_azioni(blocco: str) -> None:
    percorso = os.environ.get("GITHUB_STEP_SUMMARY")
    if percorso:
        with open(percorso, "a", encoding="utf-8") as riepilogo:
            riepilogo.write(blocco)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Aggiorna lo storico per sprint di Gulpease e ortografia e ne disegna i grafici.",
    )
    parser.add_argument("--solo-grafici", action="store_true",
                        help="Ridisegna i grafici dallo storico gia' salvato, senza rimisurare.")
    parser.add_argument("--verifica", action="store_true",
                        help="Non scrive niente: dice solo quale sprint verrebbe aggiornato.")
    argomenti = parser.parse_args(argv)

    revisioni = trova_revisioni()
    if not revisioni:
        print("Errore: nessun Piano di Qualifica sotto src/", file=sys.stderr)
        return 1

    # Le date valgono per tutto il progetto: prendo il Piano di Progetto piu'
    # aggiornato, anche di una revisione che non ha ancora un Piano di Qualifica.
    date_sprint: dict[int, str] = {}
    for progetto in sorted((REPO_ROOT / "src").rglob(NOME_PROGETTO)):
        trovate = leggi_date_sprint(progetto)
        if len(trovate) > len(date_sprint):
            date_sprint = trovate
    if not date_sprint:
        print(f"Errore: nessuna data di sprint nei {NOME_PROGETTO}", file=sys.stderr)
        return 1

    oggi = date.today().isoformat()
    corrente = sprint_corrente(date_sprint, oggi)
    print(f"Sprint in corso: {corrente} (fine {date_sprint[corrente]}) — oggi {oggi}")

    righe = [f"\n## Storico metriche documentazione\n\nSprint aggiornato: **{corrente}**\n"]

    if not (argomenti.solo_grafici or argomenti.verifica):
        misure = (
            (STORICO_GULPEASE, "Gulpease", misura_gulpease()),
            (STORICO_ORTOGRAFIA, "Ortografia", misura_ortografia()),
        )
        for percorso, nome, documenti in misure:
            storico, cambiata = aggiorna_storico(
                percorso, corrente, date_sprint[corrente], documenti, oggi
            )
            salva_storico(percorso, storico)
            stato = "aggiornato" if cambiata else "invariato"
            print(f"  {nome}: sprint {corrente} {stato} ({len(documenti)} documenti)")
            righe.append(f"- {nome}: sprint {corrente} {stato}\n")
            congelati = [v["numero"] for v in storico["sprint"] if v["numero"] != corrente]
            if congelati:
                print(f"    sprint congelati, non toccati: {congelati}")

    if argomenti.verifica:
        print("  (verifica: nessun file scritto)")
        return 0

    _importa_matplotlib()

    storici = {
        "gulpease": carica_storico(STORICO_GULPEASE)["sprint"],
        "ortografia": carica_storico(STORICO_ORTOGRAFIA)["sprint"],
    }

    for revisione in revisioni:
        numeri = sprint_della_revisione(revisione)
        if not numeri:
            print(f"\nRevisione {revisione}: nessuno sprint nelle tabelle, salto", file=sys.stderr)
            continue

        etichette = [
            f"Sprint {n}" + (f"\n{formato_data(date_sprint[n])}" if n in date_sprint else "")
            for n in numeri
        ]
        print(f"\nRevisione {revisione} — sprint {numeri[0]}..{numeri[-1]}")
        righe.append(f"\n### {revisione}\n")

        for nome, disegna in (("gulpease", grafico_gulpease), ("ortografia", grafico_ortografia)):
            voci = [v for v in storici[nome] if v["numero"] in numeri]
            if not voci:
                print(f"  ! nessun dato storico di {nome}", file=sys.stderr)
                continue
            destinazione = disegna(voci, etichette[:len(voci)], revisione.cartella_grafici)
            print(f"  ✓ {destinazione.name} ({len(voci)} sprint)")
            righe.append(f"- ✅ {destinazione.name} ({len(voci)} sprint)\n")

    _riepilogo_azioni("".join(righe))
    return 0


if __name__ == "__main__":
    sys.exit(main())
