#!/usr/bin/env python3
"""
Conta gli errori ortografici nei documenti .typ in src/ usando aspell
con dizionario italiano. Aggiorna src/metrics/ortografia.json con i
risultati del commit corrente. Scrive un riepilogo in $GITHUB_STEP_SUMMARY.

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

EXCLUDE_NAME_PATTERNS = ["definizioni.typ", "__glossary_tmp__"]
EXCLUDE_DIRS = {"templates"}
MIN_WORDS = 100          # ignora file troppo brevi

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

def strip_typst(text: str) -> str:
    """Rimuove il markup Typst, mantiene la prosa italiana."""
    text = re.sub(r'/\*.*?\*/', ' ', text, flags=re.DOTALL)
    text = re.sub(r'//[^\n]*', ' ', text)
    text = re.sub(r'#[a-zA-Z_]+[^[\n]*', ' ', text)
    text = re.sub(r'\[([^\[\]]{0,500})\]', r' \1 ', text)
    text = re.sub(r'[\[\]{}()]', ' ', text)
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
    Carica la lista di parole da ignorare (termini tecnici, anglicismi, nomi
    propri). File: .github/scripts/wordlist.txt, una parola per riga.
    Le righe che iniziano con # sono commenti.
    """
    if not WORDLIST_FILE.exists():
        return set()
    words = set()
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

def load_existing() -> list[dict]:
    if METRICS_FILE.exists():
        with open(METRICS_FILE, encoding="utf-8") as f:
            return json.load(f)
    return []


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

    records = load_existing()
    if commit in {r["commit"] for r in records}:
        print(f"Commit {commit} già presente in ortografia.json — nessun aggiornamento.")
        return

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

    records.extend(new_records)
    save(records)
    print(f"\n✓ Salvati {len(new_records)} record in {METRICS_FILE.relative_to(REPO_ROOT)}")

    write_summary(results, commit, today)


if __name__ == "__main__":
    main()
