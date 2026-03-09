import os
import re
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent.parent
INDEX_FILE = BASE_DIR / "website" / "index.html"

def genera_card_html(file_path):
    rel_to_root = file_path.relative_to(BASE_DIR).as_posix()
    percorso_html = f"../{rel_to_root}"
    nome_pulito = file_path.stem.replace('_', ' ')
    
    icona = "📝" if "verbali" in rel_to_root.lower() else "📄"
    if any(parola in rel_to_root.lower() for parola in ["glossario", "norme", "piano", "analisi"]):
        icona = "📘"
        
    return f'''
                    <a href="{percorso_html}" class="doc-card" target="_blank">
                        <div class="doc-info">
                            <h3>{nome_pulito}</h3>
                            <p>Clicca per visualizzare</p>
                        </div>
                        <div class="doc-icon">{icona}</div>
                    </a>'''

def aggiorna_html():
    if not INDEX_FILE.exists():
        print(f"Errore: {INDEX_FILE} non trovato.")
        return

    html_content = INDEX_FILE.read_text(encoding="utf-8")
    
    categorie = {
        "CANDIDATURA_PRINCIPALI": [],
        "CANDIDATURA_INTERNI": [],
        "CANDIDATURA_ESTERNI": [],
        "RTB_PRINCIPALI": [],
        "RTB_INTERNI": [],
        "RTB_ESTERNI": [],
        "PB": []
    }

    # Scansiona la root ignorando le cartelle di sistema e il sito
    for file_path in BASE_DIR.rglob("*.pdf"):
        percorso_str = file_path.as_posix().lower()
        
        if "website" in percorso_str or ".github" in percorso_str:
            continue

        card_html = genera_card_html(file_path)
        if "candidatura" in percorso_str:
            if "verbali/interni" in percorso_str:
                categorie["CANDIDATURA_INTERNI"].append(card_html)
            elif "verbali/esterni" in percorso_str:
                categorie["CANDIDATURA_ESTERNI"].append(card_html)
            elif "documenti" in percorso_str:
                categorie["CANDIDATURA_PRINCIPALI"].append(card_html)
                
        elif "rtb" in percorso_str:
            if "verbali/interni" in percorso_str:
                categorie["RTB_INTERNI"].append(card_html)
            elif "verbali/esterni" in percorso_str:
                categorie["RTB_ESTERNI"].append(card_html)
            elif "documenti" in percorso_str:
                categorie["RTB_PRINCIPALI"].append(card_html)
                
        elif "pb" in percorso_str:
            categorie["PB"].append(card_html)

    # Ordina in modo decrescente (i file più recenti o con lettera più alta in cima)
    for cat in categorie:
        categorie[cat].sort(reverse=True)

    for categoria, cards in categorie.items():
        if cards:
            blocco_html = "\n".join(cards)
        else:
            blocco_html = '<p style="color: var(--text-secondary); font-style: italic;">Nessun documento presente in questa sezione.</p>'
        
        pattern = f"()(.*?)()"
        sostituzione = f"\\1\n{blocco_html}\n                    \\3"
        html_content = re.sub(pattern, sostituzione, html_content, flags=re.DOTALL)

    INDEX_FILE.write_text(html_content, encoding="utf-8")
    print("Sito aggiornato! I link sono stati inseriti in website/index.html")

if __name__ == "__main__":
    aggiorna_html()