#!/usr/bin/env python3
"""
Conta gli errori ortografici nei documenti .typ in src/ usando aspell
con dizionario italiano. Rigenera da zero src/metrics/ortografia.json con i
risultati del commit corrente (sovrascrivendo lo storico). 
Scrive un riepilogo in $GITHUB_STEP_SUMMARY.

Richiede: aspell + aspell-it  (sudo apt-get install aspell aspell-it)
"""

import json
import os
import re
import subprocess
from datetime import date
from pathlib import Path

SCRIPT_DIR    = Path(__file__).resolve().parent          # .github/scripts/
REPO_ROOT     = SCRIPT_DIR.parent.parent                 # root del repo
METRICS_FILE  = REPO_ROOT / "src" / "metrics" / "ortografia.json"
WORDLIST_FILE = SCRIPT_DIR / "wordlist.txt"
GLOSSARY_FILE = REPO_ROOT / "src" / "RTB" / "Documenti" / "Interni" / "definizioni.typ"

# Glossario.typ è auto-generato (solo termini): lo spell-check non è significativo.
EXCLUDE_NAME_PATTERNS = ["definizioni.typ", "__glossary_tmp__", "Glossario.typ"]
EXCLUDE_DIRS = {"templates"}
MIN_WORDS = 50           # ignora file troppo brevi

SOGLIA_ACCETTABILE = 1   # ≤ 1 errore per documento (come nelle NdP)


# ---------------------------------------------------------------------------
# Git helpers
# ---------------------------------------------------------------------------

def get_current_commit() -> str:
    r = subprocess.run(["git", "rev-parse", "--short", "HEAD"],
                       capture_output=True, text=True, cwd=REPO_ROOT)
    return r.stdout.strip() or "unknown"


# ---------------------------------------------------------------------------
# Ricerca file
# ---------------------------------------------------------------------------

def find_typ_files() -> list[Path]:
    files = []
    for path in sorted((REPO_ROOT / "src").rglob("*.typ")):
        rel = path.relative_to(REPO_ROOT)
        if any(pat in path.name for pat in EXCLUDE_NAME_PATTERNS):
            continue
        if EXCLUDE_DIRS.intersection(rel.parts):
            continue
        files.append(path)
    return files


# ---------------------------------------------------------------------------
# Elaborazione testo
# ---------------------------------------------------------------------------

# Parole chiave che introducono uno statement di codice (#let, #set, #show…):
# dopo di esse il codice prosegue oltre l'identificatore (es. "#show: f.with(")
# fino al primo blocco aperto o a fine riga.
STMT_KW = {"let", "set", "show", "if", "else", "for", "while",
           "context", "import", "include", "return"}
_IDENT_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_-]*")
_CLOSER = {"[": "]", "{": "}", "(": ")"}


def _skip_string(text: str, i: int) -> int:
    """text[i] == '\"': salta la stringa (gestendo gli escape) e ritorna
    l'indice del carattere successivo."""
    n = len(text)
    i += 1
    while i < n:
        if text[i] == "\\":
            i += 2
            continue
        if text[i] == '"':
            return i + 1
        i += 1
    return i


def _skip_code_expr(text: str, i: int, stack: list) -> int:
    """Consuma un'espressione di codice introdotta da '#' (i punta al
    carattere dopo '#'). Quando incontra un delimitatore di apertura lo
    mette sullo stack e restituisce il controllo allo scanner principale,
    così i blocchi multilinea ( … ), { … } e i content block [ … ] vengono
    gestiti in modo bilanciato."""
    n = len(text)
    m = _IDENT_RE.match(text, i)
    if not m:
        return i                                          # '#' isolato: ignora
    word = m.group(0)
    i = m.end()

    if word in STMT_KW:
        # Statement: salta fino al primo blocco/delimitatore o a fine riga.
        while i < n:
            c = text[i]
            if c in "([{":
                stack.append((c, c == "["))       # '[' -> markup, altri -> codice
                return i + 1
            if c == "\n":
                return i
            if c == '"':
                i = _skip_string(text, i)
                continue
            i += 1
        return i

    # Chiamata/accesso: gestisci la catena .campo e il primo gruppo ( o [.
    while i < n:
        c = text[i]
        if c == ".":
            i += 1
            m2 = _IDENT_RE.match(text, i)
            if m2:
                i = m2.end()
            continue
        if c == "(":
            stack.append(("(", False))
            return i + 1
        if c == "[":
            stack.append(("[", True))
            return i + 1
        break
    return i


def strip_typst(text: str) -> str:
    """Estrae la sola prosa (testo in markup) da un sorgente Typst,
    scartando il codice. A differenza di un semplice replace con regex,
    gestisce i blocchi multilinea: definizioni `#let f(…) = { … }`,
    chiamate con argomenti su più righe `#table( … )`, `#context { … }`,
    ecc. Il testo dei content block `[ … ]` viene mantenuto (anche quando
    annidato negli argomenti, es. le celle di tabella `[*Codice*]`)."""
    # Rimuove i commenti prima dello scanning.
    text = re.sub(r'/\*.*?\*/', ' ', text, flags=re.DOTALL)
    text = re.sub(r'//[^\n]*', ' ', text)

    out: list[str] = []
    stack: list[tuple[str, bool]] = []   # frame: (delimitatore, emit)
    i, n = 0, len(text)

    def emitting() -> bool:
        # Radice del file e content block [ … ] sono markup (emit=True);
        # i blocchi di codice { … } e gli argomenti ( … ) no (emit=False).
        return stack[-1][1] if stack else True

    while i < n:
        c = text[i]

        if c == "#" and emitting():
            out.append(" ")
            i = _skip_code_expr(text, i + 1, stack)
            continue

        if c == '"' and not emitting():
            i = _skip_string(text, i)
            continue

        if c == "[":
            out.append(" ")
            stack.append(("[", True))
            i += 1
            continue
        if c == "{":
            stack.append(("{", False))
            i += 1
            continue
        if c == "(":
            if emitting():
                out.append(c)            # parentesi letterale nella prosa
            else:
                stack.append(("(", False))
            i += 1
            continue

        if c in ")]}":
            if stack and _CLOSER[stack[-1][0]] == c:
                stack.pop()
            elif emitting():
                out.append(c)            # carattere letterale nella prosa
            out.append(" ")
            i += 1
            continue

        if emitting():
            out.append(c)
        i += 1

    text = "".join(out)
    # Pulizia residua: simboli di markup, numeri e spazi multipli.
    text = re.sub(r'[*_=~`@<>#|\\]', ' ', text)
    text = re.sub(r'\b\d+[,./]?\d*\b', ' ', text)
    text = re.sub(r'\s+', ' ', text)
    return text.strip()


def preprocess_for_spellcheck(text: str) -> str:
    """
    Rimuove categorie di token che causerebbero falsi positivi in aspell:
    - parole tutte maiuscole (acronimi: EN, MPC, UC, RTB, PDF…)
    - parole contenenti cifre (UC-1, v2.0, MPC-01…)
    - parole con trattino o punto interni (già coperte in parte)
    - URL e path
    """
    text = re.sub(r'https?://\S+', ' ', text)
    text = re.sub(r'\b[A-Z]{2,}\b', ' ', text)          # acronimi maiuscoli
    text = re.sub(r'\b\w*\d+\w*\b', ' ', text)          # parole con cifre
    text = re.sub(r'\b\w+[-./]\w+\b', ' ', text)        # codici con separatori
    text = re.sub(r'[^\w\s]', ' ', text)                 # simboli residui
    text = re.sub(r'\s+', ' ', text)
    return text.strip()


# ---------------------------------------------------------------------------
# Wordlist personalizzata
# ---------------------------------------------------------------------------

def load_wordlist() -> set[str]:
    """
    Carica la lista di parole da ignorare (termini tecnici, anglicismi, nomi propri). 
    Inizializza con un set di nomi propri e termini di progetto hardcoded,
    ed estende con eventuali termini dal file .github/scripts/wordlist.txt.
    """
    # Whitelist di base aggiornata (incluso l'ultimo set di cognomi trovati)
    words = {
        # Team, Professori e Nomi
        "edis", "hodja", "bronte", "zonta", "filippo", "giovanni", "leonardo",
        "vardanega", "cardin", "fiorese", "rocha", "lorenzin", "iadadi",
        
        # Aziende, Enti e Brand
        "coderius", "coderiusgroup", "bluewind", "athesys", "monokee", "nexum", 
        "eggon", "amazon", "google", "srl",
        
        # Tecnologie e Strumenti
        "comprehend", "excel", "telegram", "discord", "react", "vue", "flask", 
        "fastapi", "plantuml", "figma", "meet", "typ", "src",
        
        # Acronimi di Progetto
        "poc", "adr", "pdp", "ob",
        
        # Parole troncate dagli apostrofi (causa regex)
        "sull", "dall", "all", "nell", "dell", "quest",
        
        # Inglesismi, Codice e Gergo Tecnico
        "versionamento", "group", "block", "above", "update", "automated", 
        "verification", "pass", "fail", "not", "applicable", "layout", "mapping", 
        "access", "control", "mechanism", "authentication", "proof", "concept", 
        "tracking", "system", "template", "fix", "new", "report", "it", "text", 
        "size", "wireless", "interface", "local", "form", "security", "financial", 
        "function", "undo", "have", "mockup", "call", "stack", "step", "gulpease", 
        "wordlist", "effort",
        
        # Termini italiani non riconosciuti dal dizionario base
        "tracciabilità", "recuperabilità", "apprendibilità"
    }

    if not WORDLIST_FILE.exists():
        return words

    with open(WORDLIST_FILE, encoding="utf-8") as f:
        for line in f:
            word = line.strip()
            if word and not word.startswith("#"):
                words.add(word.lower())
    return words


def load_glossary_words() -> set[str]:
    """
    Estrae le singole parole dalle chiavi del glossario (definizioni.typ).
    Il formato atteso è:  "Termine o Frase": [definizione],
    Ogni parola della chiave (≥2 caratteri) viene aggiunta all'insieme
    delle parole da ignorare, così i termini tecnici del progetto non
    vengono segnalati come errori ortografici.
    """
    if not GLOSSARY_FILE.exists():
        return set()

    words: set[str] = set()
    # Cattura il testo tra i primi apici di ogni riga con la struttura "...":
    key_pattern = re.compile(r'^\s*"([^"]+)"\s*:', re.MULTILINE)

    text = GLOSSARY_FILE.read_text(encoding="utf-8", errors="ignore")
    for match in key_pattern.finditer(text):
        term = match.group(1)
        # Divide la chiave in token (lettere e apostrofi) e aggiunge
        # ogni parola di almeno 2 caratteri in minuscolo
        for token in re.findall(r"[a-zA-ZàèéìòùÀÈÉÌÒÙ']{2,}", term):
            words.add(token.lower())

    return words


# ---------------------------------------------------------------------------
# Controllo ortografico
# ---------------------------------------------------------------------------

def check_spelling(text: str, custom_words: set[str]) -> tuple[int | None, list[str]]:
    """
    Esegue aspell in modalità lista: restituisce (n_errori, lista_parole).
    Ritorna (None, []) se aspell non è disponibile.
    """
    try:
        result = subprocess.run(
            ["aspell", "list", "--lang=it", "--encoding=utf-8"],
            input=text,
            capture_output=True,
            text=True,
            timeout=60,
        )
    except FileNotFoundError:
        return None, []
    except subprocess.TimeoutExpired:
        return None, []

    if result.returncode != 0:
        return None, []

    raw = [w.strip() for w in result.stdout.splitlines() if w.strip()]
    # Filtra parole nella wordlist personalizzata (case-insensitive)
    errors = [w for w in raw if w.lower() not in custom_words]

    return len(errors), errors


# ---------------------------------------------------------------------------
# Persistenza
# ---------------------------------------------------------------------------

def save(records: list[dict]) -> None:
    METRICS_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(METRICS_FILE, "w", encoding="utf-8") as f:
        json.dump(records, f, indent=2, ensure_ascii=False)
        f.write("\n")


# ---------------------------------------------------------------------------
# GitHub Actions Job Summary
# ---------------------------------------------------------------------------

def write_summary(results: list[tuple], commit: str, today: str) -> None:
    summary_path = os.environ.get("GITHUB_STEP_SUMMARY")
    if not summary_path:
        return

    lines = [
        f"## 🔤 Correttezza Ortografica — `{commit}` ({today})\n",
        "| Documento | Errori | Stato |",
        "|:----------|-------:|:------|",
    ]

    for nome, count, errors in results:
        if count is None:
            lines.append(f"| {nome} | — | ⚪ aspell non disponibile |")
        elif count == 0:
            lines.append(f"| {nome} | **0** | 🟢 ottimo |")
        elif count <= SOGLIA_ACCETTABILE:
            lines.append(f"| {nome} | **{count}** | 🟡 accettabile |")
        else:
            sample = ", ".join(f"`{w}`" for w in errors[:5])
            lines.append(f"| {nome} | **{count}** | 🔴 da correggere — es: {sample} |")

    lines.append(
        f"\n> **Soglia di accettazione:** ≤ {SOGLIA_ACCETTABILE} errore per documento."
    )

    with open(summary_path, "a", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main() -> None:
    commit = get_current_commit()
    today  = str(date.today())

    typ_files = find_typ_files()
    if not typ_files:
        print("Nessun file .typ trovato in src/.")
        return

    # [RIMOZIONE STORICO] Lo script ora rigenera sempre le metriche da zero.
    custom_words   = load_wordlist()
    glossary_words = load_glossary_words()
    custom_words  |= glossary_words

    print(f"Controllo ortografico per commit {commit} ({today})")
    print(f"Wordlist personalizzata: {len(load_wordlist())} termini + "
          f"{len(glossary_words)} dal glossario = {len(custom_words)} totale ignorati\n")
    print(f"  {'Documento':<40} {'Errori':>7}")
    print(f"  {'-'*40} {'-'*7}")

    results: list[tuple] = []
    new_records: list[dict] = []

    for path in typ_files:
        text  = path.read_text(encoding="utf-8", errors="ignore")
        clean = strip_typst(text)

        # Salta file troppo brevi
        word_count = len([w for w in clean.split() if re.search(r'[a-zA-ZàèéìòùÀÈÉÌÒÙ]{2,}', w)])
        if word_count < MIN_WORDS:
            continue

        processed      = preprocess_for_spellcheck(clean)
        count, errors  = check_spelling(processed, custom_words)
        nome           = path.stem.replace("_", " ").replace("-", " ")
        results.append((nome, count, errors))

        if count is None:
            print(f"  {nome:<40} {'n/d':>7}  (aspell non disponibile)")
            continue

        flag = "✓" if count <= SOGLIA_ACCETTABILE else "✗"
        print(f"  {nome:<40} {count:>7}  {flag}")
        if errors:
            print(f"    → es: {', '.join(errors[:8])}")

        new_records.append({
            "date":     today,
            "commit":   commit,
            "document": nome,
            "errors":   count,
            "sample":   errors[:10],
        })

    # Sovrascrive direttamente il file json con il nuovo set di record puliti
    save(new_records)
    print(f"\n✓ Salvati {len(new_records)} record in {METRICS_FILE.relative_to(REPO_ROOT)}")

    write_summary(results, commit, today)


if __name__ == "__main__":
    main()