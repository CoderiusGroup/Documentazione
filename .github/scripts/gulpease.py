#!/usr/bin/env python3
"""
Calcola l'Indice di Gulpease per tutti i documenti .typ narrativi in src/.
Rigenera da zero src/metrics/gulpease.json con i risultati del commit corrente 
(sovrascrivendo lo storico).
Scrive un riepilogo in $GITHUB_STEP_SUMMARY (visibile nell'Actions UI).

Formula: Gulpease = 89 + (300*F - 10*L) / P
  F = numero di frasi  (. ! ?)
  L = numero di lettere
  P = numero di parole
"""

import json
import os
import re
import subprocess
import sys
from datetime import date
from pathlib import Path

# Posizione dei file
SCRIPT_DIR   = Path(__file__).resolve().parent          # .github/scripts/
REPO_ROOT    = SCRIPT_DIR.parent.parent                 # root del repo
METRICS_FILE = REPO_ROOT / "src" / "metrics" / "gulpease.json"

# Pattern da escludere (nome file)
EXCLUDE_NAME_PATTERNS = [
    "definizioni.typ",
    "__glossary_tmp__",
]
# Directory da escludere (qualunque livello)
EXCLUDE_DIRS = {"templates"}

# Soglia minima di parole per considerare il documento
MIN_WORDS = 100


# ---------------------------------------------------------------------------
# Git helpers
# ---------------------------------------------------------------------------

def get_current_commit() -> str:
    r = subprocess.run(
        ["git", "rev-parse", "--short", "HEAD"],
        capture_output=True, text=True, cwd=REPO_ROOT,
    )
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
    # Commenti blocco /* ... */
    text = re.sub(r'/\*.*?\*/', ' ', text, flags=re.DOTALL)
    # Commenti riga // ...
    text = re.sub(r'//[^\n]*', ' ', text)
    # Direttive # (let, set, show, import, ecc.)
    text = re.sub(r'#[a-zA-Z_]+[^[\n]*', ' ', text)
    # Estrae contenuto da blocchi [...] (un livello)
    text = re.sub(r'\[([^\[\]]{0,500})\]', r' \1 ', text)
    # Rimuove parentesi e simboli residui
    text = re.sub(r'[\[\]{}()]', ' ', text)
    text = re.sub(r'[*_=~`@<>#|\\]', ' ', text)
    # Rimuove numeri isolati (valori tabella, codici)
    text = re.sub(r'\b\d+[,./]?\d*\b', ' ', text)
    # Comprime spazi
    text = re.sub(r'\s+', ' ', text)
    return text.strip()


def gulpease(text: str) -> tuple[float | None, int, int, int]:
    """
    Ritorna (score, parole, lettere, frasi).
    score è None se il documento è troppo breve.
    """
    words = [
        w for w in re.split(r'\s+', text)
        if len(w) >= 2 and re.search(r'[a-zA-ZàèéìòùÀÈÉÌÒÙ]{2,}', w)
    ]
    P = len(words)
    if P < MIN_WORDS:
        return None, P, 0, 0
    L = sum(len(re.findall(r'[a-zA-ZàèéìòùÀÈÉÌÒÙ]', w)) for w in words)
    F = max(1, len(re.findall(r'[.!?]+', text)))
    score = 89 + (300 * F - 10 * L) / P
    return round(score, 1), P, L, F


def doc_name(path: Path) -> str:
    """Nome leggibile del documento ricavato dal path."""
    return path.stem.replace("_", " ").replace("-", " ")


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

def write_summary(
    results: list[tuple],
    commit: str,
    today: str,
) -> None:
    summary_path = os.environ.get("GITHUB_STEP_SUMMARY")
    if not summary_path:
        return

    lines = [
        f"## 📐 Indice di Gulpease — `{commit}` ({today})\n",
        "| Documento | Punteggio | Parole | Stato |",
        "|:----------|----------:|-------:|:------|",
    ]

    for nome, score, P, *_ in results:
        if score is None:
            lines.append(f"| {nome} | — | {P} | ⚪ troppo breve (< {MIN_WORDS} parole) |")
        else:
            if score >= 40:
                stato = "🟢 accettabile"
            elif score >= 30:
                stato = "🟡 sotto soglia"
            else:
                stato = "🔴 critico"
            lines.append(f"| {nome} | **{score}** | {P} | {stato} |")

    lines.append("")
    lines.append(
        "> **Soglia di accettazione:** ≥ 60. "
        "Valori inferiori sono attesi per documentazione tecnica specialistica "
        "(terminologia EN 18031, acronimi, locuzioni straniere)."
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

    print(f"Calcolo Gulpease per commit {commit} ({today})\n")
    print(f"  {'Documento':<40} {'Score':>6}   dettaglio")
    print(f"  {'-'*40} {'-'*6}   {'-'*30}")

    results: list[tuple] = []
    new_records: list[dict] = []

    for path in typ_files:
        text  = path.read_text(encoding="utf-8", errors="ignore")
        clean = strip_typst(text)
        score, P, L, F = gulpease(clean)
        nome  = doc_name(path)
        results.append((nome, score, P, L, F))

        if score is not None:
            print(f"  {nome:<40} {score:>6.1f}   P={P} L={L} F={F}")
            new_records.append({
                "date":      today,
                "commit":    commit,
                "document":  nome,
                "score":     score,
                "words":     P,
                "letters":   L,
                "sentences": F,
            })
        else:
            print(f"  {nome:<40}    n/d   troppo breve ({P} parole)")

    # Salvataggio diretto (sovrascrittura)
    save(new_records)

    print(f"\n✓ Salvati {len(new_records)} record in {METRICS_FILE.relative_to(REPO_ROOT)}")

    write_summary(results, commit, today)


if __name__ == "__main__":
    main()