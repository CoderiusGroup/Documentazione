import os
import re
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent.parent
INDEX_FILE = BASE_DIR / "website" / "index.html"
GLOSSARIO_HTML = BASE_DIR / "website" / "glossario.html"
GLOSSARIO_TYP = BASE_DIR / "src" / "RTB" / "Documenti" / "Interni" / "definizioni.typ"

def genera_card_html(file_path):
    rel_to_root = file_path.relative_to(BASE_DIR).as_posix()
    percorso_html = f"docs/{rel_to_root}"
    nome_completo = file_path.stem
    
    return f'''
                    <a href="{percorso_html}" class="doc-card" target="_blank">
                        <div class="doc-info">
                            <h5>{nome_completo}</h5>
                            <p>Apri in nuova scheda ↗</p>
                        </div>
                    </a>'''

def aggiorna_glossario():
    if not GLOSSARIO_TYP.exists() or not GLOSSARIO_HTML.exists():
        print("Avviso: file non trovati.")
        return

    content_typ = GLOSSARIO_TYP.read_text(encoding="utf-8")

    pattern_typ = r'termine:\s*"(.*?)",\s*definizione:\s*"(.*?)"'
    matches = sorted(re.findall(pattern_typ, content_typ, re.DOTALL), key=lambda x: x[0].upper())
    
    valore_conteggio = str(len(matches))

    #Generazione HTML Indice A-Z
    present_letters = {m[0][0].upper() for m in matches}
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    index_html = ""
    for letter in alphabet:
        if letter in present_letters:
            index_html += f'<a href="#letter-{letter}">{letter}</a>\n'
        else:
            index_html += f'<a class="disabled">{letter}</a>\n'

    #Generazione HTML Lista Termini
    list_html = ""
    last_letter = ""
    for term, desc in matches:
        desc_clean = " ".join(desc.split())
        term_clean = term.strip()
        
        current_letter = term_clean[0].upper()
        if current_letter != last_letter:
            last_letter = current_letter
            list_html += f'<div class="glossary-letter" id="letter-{last_letter}">{last_letter}</div>\n'
        
        list_html += f'<div class="glossary-term"><h3>{term_clean}</h3><p>{desc_clean}</p></div>\n'

    html_content = GLOSSARIO_HTML.read_text(encoding="utf-8")

    pattern_index = r"<!--\s*GLOSSARIO_INDEX_START\s*-->.*?<!--\s*GLOSSARIO_INDEX_END\s*-->"
    repl_index = f"<!-- GLOSSARIO_INDEX_START -->\n{index_html}<!-- GLOSSARIO_INDEX_END -->"
    html_content = re.sub(pattern_index, repl_index, html_content, flags=re.DOTALL)

    pattern_list = r"<!--\s*GLOSSARIO_LIST_START\s*-->.*?<!--\s*GLOSSARIO_LIST_END\s*-->"
    repl_list = f"<!-- GLOSSARIO_LIST_START -->\n{list_html}<!-- GLOSSARIO_LIST_END -->"
    html_content = re.sub(pattern_list, repl_list, html_content, flags=re.DOTALL)

    html_content = re.sub(r'(id="found-count">).*?(</span>)', rf'\g<1>{valore_conteggio}\g<2>', html_content)
    html_content = re.sub(r'(id="total-count">).*?(</span>)', rf'\g<1>{valore_conteggio}\g<2>', html_content)

    GLOSSARIO_HTML.write_text(html_content, encoding="utf-8")
    print(f"Aggiornamento completato: {valore_conteggio} termini inseriti.")

def aggiorna_html():
    if not INDEX_FILE.exists():
        print(f"Errore: {INDEX_FILE} non trovato.")
        return

    html_content = INDEX_FILE.read_text(encoding="utf-8")
    
    categorie = {
        "CANDIDATURA_PRINCIPALI": [],
        "CANDIDATURA_INTERNI": [],
        "CANDIDATURA_ESTERNI": [],
        "RTB_ESTERNI": [],
        "RTB_VERBALI_ESTERNI": [],
        "RTB_INTERNI": [],
        "RTB_VERBALI_INTERNI": [],
        "PB_PRINCIPALI": []
    }

    for file_path in BASE_DIR.rglob("*.pdf"):
        percorso_str = file_path.as_posix()
        
        if "website" in percorso_str or ".github" in percorso_str:
            continue
        if "Verbali/Esterni" in percorso_str and not file_path.stem.endswith("_firmato"):
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
                categorie["RTB_VERBALI_INTERNI"].append(card_html)
            elif "Verbali/Esterni" in percorso_str:
                categorie["RTB_VERBALI_ESTERNI"].append(card_html)
            elif "Documenti/Interni" in percorso_str:
                categorie["RTB_INTERNI"].append(card_html)
            else:
                categorie["RTB_ESTERNI"].append(card_html)
                
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
    aggiorna_glossario()

if __name__ == "__main__":
    aggiorna_html()