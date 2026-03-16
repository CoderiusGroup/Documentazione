import os
import re
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent.parent
INDEX_FILE = BASE_DIR / "website" / "index.html"

def genera_card_html(file_path):
    rel_to_root = file_path.relative_to(BASE_DIR).as_posix()
    percorso_html = f"docs/{rel_to_root}"
    nome_pulito = file_path.stem.replace('_', ' ').replace('-', ' ')
    
    return f'''
                    <a href="{percorso_html}" class="doc-card" target="_blank">
                        <div class="doc-info">
                            <h3>{nome_pulito}</h3>
                            <p>Clicca per visualizzare</p>
                        </div>
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
        "PB_PRINCIPALI": []
    }

    for file_path in BASE_DIR.rglob("*.pdf"):
        percorso_str = file_path.as_posix()
        
        if "website" in percorso_str or ".github" in percorso_str:
            continue

        card_html = genera_card_html(file_path)
        if "Candidatura" in percorso_str:
            if "Verbali/Interni" in percorso_str:
                categorie["CANDIDATURA_INTERNI"].append(card_html)
            elif "Verbali/Esterni" in percorso_str:
                categorie["CANDIDATURA_ESTERNI"].append(card_html)
            else:
                categorie["CANDIDATURA_PRINCIPALI"].append(card_html)
                
        elif "RTB" in percorso_str:
            if "Verbali/Interni" in percorso_str:
                categorie["RTB_INTERNI"].append(card_html)
            elif "Verbali/Esterni" in percorso_str:
                categorie["RTB_ESTERNI"].append(card_html)
            else:
                categorie["RTB_PRINCIPALI"].append(card_html)
                
        elif "PB" in percorso_str:
            categorie["PB_PRINCIPALI"].append(card_html)

    # ordina in modo decrescente
    for cat in categorie:
        categorie[cat].sort(reverse=True)

    for categoria, cards in categorie.items():
        if cards:
            blocco_html = "\n".join(cards)
        else:
            blocco_html = '<p style="color: var(--text-secondary); font-style: italic; grid-column: 1 / -1;">Nessun documento presente in questa sezione.</p>'
        
        pattern = rf"<!--\s*{categoria}_START\s*-->(.*?)<!--\s*{categoria}_END\s*-->"
        sostituzione = f"<!-- {categoria}_START -->\n{blocco_html}\n<!-- {categoria}_END -->"
        html_content = re.sub(pattern, sostituzione, html_content, flags=re.DOTALL)

    INDEX_FILE.write_text(html_content, encoding="utf-8")
    print("Sito aggiornato! I link sono stati inseriti in website/index.html")

if __name__ == "__main__":
    aggiorna_html()