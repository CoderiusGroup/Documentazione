#set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Norme di Progetto],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )

#set text(font: "Libertinus Serif",size: 12pt,lang: "it")

#set heading(numbering: "1.1.")
#show figure: set figure(supplement: none)

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Norme di Progetto]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
  #v(3em)
]

#pagebreak()

#heading(numbering: none, outlined: false)[Tabella di versionamento]
#v(0.5cm)
#align(center)[
  #table(
    columns: (auto, auto, auto, auto, 1fr),
    align: (center, center, center, center, left),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 4 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    [*Versione*], [*Data*], [*Autore*], [*Verificatore*], [*Descrizione*],
    [0.1.0], [2026/04/23], [Lorenzin Leonardo], [],[Prima stesura del documento]
  )
]
#pagebreak()

#show outline.entry.where(level: 1): it => {
  v(1.2em, weak: true)
  strong(it)
}

#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 5, indent: 1.5em)

#text(size: 18pt, weight: "bold")[Elenco delle Figure]
#outline( title: none, target: figure.where(kind: image), indent: 1.5em,)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)
#show link: set text(fill: blue)
#show link: underline
#let nota(corpo) = text(size: 8pt, [#corpo])
#set list(spacing: 1.5em)

= Introduzione
== Scopo del Documento
#v(0.5em)
Il presente documento ha l'obiettivo di definire il _Way of Working_ , ovvero l'insieme di regole, convenzioni e standard che il gruppo si impegna a rispettare durante l'intero ciclo di vita del progetto. \
Questo documento verrà redatto contestualmente all'avanzamento delle attività; potrà quindi subire variazioni, integrazioni o rimozioni sulla base delle conoscenze apprese durante il corso del progetto.
  
== Scopo del prodotto
#v(0.5em)
Il prodotto finale è un'applicazione _web-based_ sviluppata per automatizzare la verifica della conformità alla norma *EN 18031*, ossia lo standard tecnico europeo che stabilisce i requisiti di sicurezza dei dispositivi radio wireless.
Lo scopo dell'applicazione è quello di guidare l'utente attraverso un'analisi strutturata basata su *Decision Tree*, che consentono di percorrere i flussi logici della normativa in modo sistematico. Questo approccio non solo velocizza l'intero processo di valutazione, ma ne aumenta l'affidabilità riducendo il rischio di sviste manuali. Infine, il sistema è in grado di produrre automaticamente i report e la documentazione tecnica necessaria per attestare l'esito dell'analisi svolta.

== Glossario
#v(0.5em)
All'interno delle *Norme di Progetto*, così come negli altri documenti formali, i termini che trovano una definizione specifica nel relativo documento _Glossario_ verranno contrassegnati da una lettera "*G*" maiuscola a pedice (es. Termine#sub[G]). 

Questa convenzione permette al lettore di individuare immediatamente i vocaboli che possiedono un significato particolare nel contesto del progetto, invitandolo a consultarne la definizione per evitare ambiguità riguardo al linguaggio tecnico utilizzato e garantire così una migliore comprensione dei contenuti.

== Riferimenti

=== Riferimenti Normativi
#v(0.5em)
I documenti elencati di seguito rappresentano i vincoli diretti e le norme da rispettare per lo sviluppo del progetto:

- #link("https://www.math.unipd.it/~tullio/IS-1/2024/Progetto/C1.pdf")[*Capitolato C1 — Automated EN18031 Compliance Verification*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[*Regolamento del Progetto Didattico*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://www.iso.org/standard/63712.html")[*Standard ISO/IEC 12207:2017*] #nota[(ultimo accesso: 2026-04-04)]

- #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.
pdf")[*Standard ISO/IEC 12207:1995*] #nota[(ultimo accesso: 2026-04-24)]

- *Standard EN 18031* #nota[(Consultato tramite copia fornita dal proponente)]
\
=== Riferimenti Informativi
#v(0.5em)
#list(
  marker: [•],
  indent: 0.5em,
  [Dispense del corso di Ingegneria del Software 2025/2026:
    #set list(marker: [-], indent: 1em)
    
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T01.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T02.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T03.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T06.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T07.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T08.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T09.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T10.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T11.pdf") #nota[(ultimo accesso: 2026-04-24)]
  ]
)
  

- #link("https://typst.app/docs/")[*Documentazione ufficiale di Typst*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://docs.github.com/en")[*Guida a Git e GitHub*] #nota[(ultimo accesso: 2026-04-24)]

= Processi Primari
== Introduzione ai processi primari
#v(0.5em)
Per realizzare un software funzionante e di qualità, il prodotto finale deve poter essere *robusto* e *mantenibile* nel tempo. \
A tal fine è necessario adottare un modello di lavoro basato su *procedure chiare*, capaci di guidare ogni attività in modo ordinato.

Seguendo lo standard *ISO/IEC 12207*, i processi primari principali si suddividono in:

- *Fornitura*: riguarda tutto ciò che serve per gestire il rapporto con il proponente esterno;

- *Sviluppo*: riguarda le attività pratiche per costruire il software vero e proprio.

== Processo di Fornitura
#v(0.5em)
Il processo di fornitura definisce le procedure che il gruppo *Coderius*, in qualità di fornitore, si impegna a seguire per gestire il rapporto con la proponente *BlueWind S.r.l.* durante tutto il ciclo di vita del progetto al fine di garantire la corretta fruizione del prodotto finale.

=== Attività principali
#v(0.5em)
Di seguito le principali attività comprese nel processo di fornitura:

- *Analisi del capitolato*: esame critico del documento di proposta per identificare requisiti e vincoli tecnici;
- *Studio di fattibilità*: valutazione della sostenibilità del progetto in termini di risorse, tempi e competenze tecniche;
- *Pianificazione*: organizzazione temporale delle attività e delle risorse, formalizzata nel *Piano di Progetto*;
- *Monitoraggio e Controllo*: verifica costante dell'avanzamento dei lavori e della qualità dei prodotti intermedi, anche a seguito di eventuali feedback da parte del proponente;
- *Rilascio e Accettazione*: procedure di consegna del software e della documentazione, con successiva validazione da parte della proponente.

=== Documentazione coinvolta
#v(0.5em)
Le attività legate al processo di fornitura si concretizzano nella redazione e nel continuo aggiornamento dei seguenti documenti:

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Norme di progetto*],
    ),
    [*Redattore*], [Amministratore],
    [*Tipo di documento*], [Interno],
    [*Scopo*], [
      Definisce le regole operative, le convenzioni e gli standard tecnici che il gruppo deve adottare per garantire l'uniformità dei processi;
    ],
  ),
  caption: [Descrizione del documento "Norme di progetto"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Piano di progetto*],
    ),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [
      Stabilisce la pianificazione delle attività, la gestione delle risorse, l'analisi dei rischi e la ripartizione dei costi;
    ],
  ),
  caption: [Descrizione del documento "Piano di progetto"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Piano di Qualifica*],
    ),
    [*Redattore*], [Amministratore],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [
      Specifica gli obiettivi di qualità, le metriche di misurazione e i test necessari a validare il software e i documenti prodotti;
    ],
  ),
  caption: [Descrizione del documento "Piano di qualifica"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Analisi dei Requisiti*],
    ),
    [*Redattore*], [Analisti],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [
      Formalizza le necessità della proponente in una lista strutturata di requisiti funzionali, qualitativi e di vincolo;
    ],
  ),
  caption: [Descrizione del documento "Analisi dei requisiti"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Glossario*],
    ),
    [*Redattore*], [Analisti],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [
      Raccoglie la terminologia tecnica e i termini potenzialmente ambigui per assicurare una comprensione univoca di tutta la documentazione;
    ],
  ),
  caption: [Descrizione del documento "Glossario"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Verbali*],
    ),
    [*Redattore*], [Amministratore],
    [*Tipo di documento*], [Esterno/Interno],
    [*Scopo*], [
      Documenti di coordinamento che registrano l'esito delle riunioni, l'assegnazione dei compiti interni e dei ruoli assegnati. Possono essere sia interni che esterni, nel caso dei verbali esterni, hanno anche lo scopo di tracciare decisioni, risposte e vincoli concordati.
    ],
  ),
  caption: [Descrizione del documento "Verbali"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Lettera di candidatura*],
    ),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [
      Documento per la richiesta formale da parte del gruppo di poter partecipare al capitolato scelto tramite la Validazione dei capitolati.
    ],
  ),
  caption: [Descrizione del documento "Lettera di candidatura"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Valutazione dei Capitolati*],
    ),
    [*Redattore*], [Analisti],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [
      Descrive l'analisi comparativa effettuata sulle diverse proposte per giustificare la scelta del capitolato finale;
    ],
  ),
  caption: [Descrizione del documento "Valutazione dei Capitolati"],
  supplement: [Tabella],
  numbering: "1",
)

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(
      table.cell(colspan: 2, fill:rgb("#99d6ff"), align: center)[*Dichiarazione degli Impegni*],
    ),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [
      Documento formale in cui il gruppo presenta una stima dei costi del progetto e delle ore che verranno impiegate per essere completato. Inoltre vengono dichiarate le responsabilità assunte e la data di consegna prevista per il progetto. 
    ],
  ),
  caption: [Descrizione del documento "Dichiarazione degli Impegni"],
  supplement: [Tabella],
  numbering: "1",
)

- *Norme di Progetto*: definisce le regole operative, le convenzioni e gli standard tecnici che il gruppo deve adottare per garantire l'uniformità dei processi;
- *Piano di Progetto*: stabilisce la pianificazione delle attività, la gestione delle risorse, l'analisi dei rischi e la ripartizione dei costi;
- *Piano di Qualifica*: specifica gli obiettivi di qualità, le metriche di misurazione e i test necessari a validare il software e i documenti prodotti;
- *Analisi dei Requisiti*: formalizza le necessità della proponente in una lista strutturata di requisiti funzionali, qualitativi e di vincolo;
- *Glossario*: raccoglie la terminologia tecnica e i termini potenzialmente ambigui per assicurare una comprensione univoca di tutta la documentazione;
- *Verbali Interni*: documenti di coordinamento che registrano l'esito delle riunioni del team e l'assegnazione dei compiti interni;
- *Verbali Esterni*: resoconti ufficiali dei meeting con *BlueWind S.r.l.* che tracciano decisioni, risposte e vincoli concordati;
- *Lettera di Presentazione*: documento formale per la presentazione del gruppo;
- *Valutazione dei Capitolati*: descrive l'analisi comparativa effettuata sulle diverse proposte per giustificare la scelta del progetto finale;
- *Dichiarazione degli Impegni*: atto formale in cui il gruppo dichiara le responsabilità assunte e la data di consegna prevista per i prodotti.

=== Gestione delle comunicazioni
#v(0.5em)
Per mantenere una comunicazione trasparente e tracciabile, a seconda della tipologia di incontro, il gruppo adotta le seguenti regole:
==== Comunicazioni con la proponente
#v(0.5em)
Riguardano tutti i contatti ufficiali tra il gruppo *Coderius* e *BlueWind S.r.l.* .

- *Incontri (Meeting)*: ogni incontro con la proponente deve essere documentato in un *Verbale Esterno*, che riporti decisioni prese e chiarimenti ottenuti;
- *Comunicazioni formali*: per l'invio di documenti e comunicazioni ufficiali si utilizza esclusivamente la posta elettronica;
- *Canali rapidi*: per chiarimenti immediati e coordinamento si utilizzano strumenti di messaggistica istantanea (Telegram);

==== Comunicazioni interne
#v(0.5em)
Riguardano il coordinamento tra i membri del gruppo *Coderius*.

- *Incontri (Meeting)*: ogni incontro tra i componenti del gruppo deve essere documentato in un *Verbale Interno*, che riporti decisioni prese e compiti da svolgere;
- *Canali rapidi*: per coordinamento e aggiornamenti si utilizzano strumenti di messaggistica istantanea (WhatsApp, Discord);

=== Strumenti a supporto
#v(0.5em)
Per il corretto svolgimento delle attività del processo di fornitura, il gruppo adotta i seguenti strumenti, distinguendoli in base all'ambito di utilizzo:

#set list(spacing: 1.5em)

==== Strumenti per la proponente
#v(0.5em)

- *Gmail*:utilizzato per comunicazioni formali, convocazione dei meeting;

- *Telegram*: utilizzato per chiarimenti immediati;

- *Zoom*: utilizzato per lo svolgimento dei meeting.

==== Strumenti per il gruppo
#v(0.5em)

- *GitHub*: utilizzato per il versionamento e la conservazione di tutto il materiale prodotto (codice e documentazione), garantendo la tracciabilità delle modifiche;

- *Discord / WhatsApp*: utilizzati per il coordinamento quotidiano e incontri tra i componenti del gruppo;

- *Google Drive*: utilizzato per la condivisione di bozze, materiali di supporto .

== Processo di Sviluppo
#v(0.5em)
Il processo di sviluppo comprende l'insieme delle attività tecniche e metodologiche necessarie alla realizzazione del prodotto software,a cominciare dall'analisi dei requisiti fino alla consegna e verifica finale. L'obiettivo principale è garantire un ciclo di vita del software controllato, dove ogni fase contribuisce alla creazione di un sistema *robusto, sicuro, mantenibile nel tempo e conforme* alle specifiche della proponente.

=== Attività principali
#v(0.5em)
Di seguito le principali attività comprese nel processo di sviluppo:

- *Analisi dei Requisiti*: processo di individuazione, classificazione e formalizzazione delle necessità della proponente e dei vincoli normativi;

- *Progettazione dell'architettura*: definizione della struttura ad alto livello del sistema, individuando i componenti principali e le loro interazioni;  

- *Progettazione di dettaglio*: definizione specifica dei singoli componenti e delle logiche interne, propedeutica alla scrittura del codice;

- *Codifica*: implementazione del codice sorgente seguendo le convenzioni e gli standard di stile stabiliti dal gruppo in fase di progettazione;

- *Test e Integrazione*: attività volta a verificare il corretto funzionamento dei singoli componente la loro successiva combinazione, assicurando la coerenza e l'interoperabilità dell'intero sistema.

=== Analisi dei Requisiti
#v(0.5em)
Questa fase mira a definire con precisione cosa il software debba fare. Il gruppo adotta le seguenti procedure:

- *Analisi delle fonti*: studio del capitolato e della documentazione messa a disposizione dal proponente al fine di estrarre i vincoli tecnici e normativi;
- *Individuazione dei Casi d'Uso*: descrizione delle interazioni tra gli attori e il software tramite diagrammi e scenari (principali o alternativi);
- *Classificazione dei requisiti*: ogni requisito viene catalogato come funzionale, di qualità, di vincolo o prestazionali;
- *Attribuzione della priorità*: a ogni requisito viene assegnata una priorità (obbligatorio, desiderabile o opzionale) e un identificativo univoco secondo una specifica nomenclatura;
- *Tracciamento*: associazione costante tra requisiti e casi d'uso per garantire che ogni necessità richiesta dal capitolato sia soddisfatta e che ogni caso d'uso non sia superfluo.

==== Nomenclatura Casi D'uso
Per i casi d'uso viene usata la seguente nomenclatura:
#align(center, text(1.2em)[*'UC-[IndiceRadice].[IndiceAnnidato]-Titolo'*])

il quale significa:\ 
*UC*: Acronimo di use case, che tradotto dall'inglese sta per caso d'uso.\
*IndiceRadice*: Numero crescente e identificativo  per ogni use case.\
*IndiceAnnidato*: Numero crescente che indica la sottosezione di un particolare use case, può essere annidato più volte in caso di multiple sottosezioni per lo stesso use case.\
*Titolo*: Nome per ogni use case per differenziarlo e riassumere il suo scopo al fine di essere più leggibile.\
IndiceRadice e IndiceAnnidato insieme formano una chiave univoca che non può essere duplicata.\
*Esempio*: \ UC-4 : Aggiunta nuova dispositivo manuale;\ UC-4.1: Inserimento nome dispositivo;\ UC-4.2: Inserimento sistema operativo del dispositivo.

==== Nomenclatura Requisiti
Per i requisiti la nomenclatura che viene usata è la seguente:



=== Codifica del codice sorgente
#v(0.5em)

=== Documentazione coinvolta
#v(0.5em)

Le attività coinvolte durante la fase del processo di sviluppo sono assistite dalla documentazione definita in precedenza, ovvero *Analisi dei Requisiti, Piano di Progetto, Piano di Qualifica e Norme di Progetto*, integrata con specifiche riguardanti la codifica e le procedure di verifica. 

=== Strumenti a supporto
#v(0.5em)
Per lo sviluppo, il gruppo utilizza strumenti mirati a garantire qualità, tracciabilità e collaborazione:

- *Linguaggio e Ambiente*: come linguaggio principale per lo sviluppo delle componenti software e delle logiche della normativa viene utilizzato Python 3.x;
- *Versionamento*: Git e GitHub per la gestione della repository, branch, commit, issue e pull request;
- *Automazione*: utilizzo di pipeline CI (Continuous Integration) tramite GitHub Actions per la generazione automatica e successiva pubblicazione della documentazione di progetto;

==== Strumenti per la proponente
#v(0.5em)

- *Gmail*: utilizzato per comunicazioni formali, convocazione dei meeting;

- *Telegram*: utilizzato per chiarimenti immediati;

- *Zoom*: utilizzato per lo svolgimento dei meeting.

==== Strumenti per il gruppo
#v(0.5em)

- *Discord / WhatsApp*: utilizzati per il coordinamento quotidiano e incontri tra i componenti del gruppo;

- *Draw.io/PlantUML*: utilizzati per la realizzazione dei diagrammi UML che sono essenziali per l'analisi dei requisiti.

=== Rapporti con la proponente
#v(0.5em)

La proponente *BlueWind S.r.l.* mette a disposizione del gruppo strumenti e momenti di confronto per agevolare lo sviluppo del progetto:

- *Canali di comunicazione*: un canale Telegram per comunicazioni rapide e informali, e l'invio di email tramite l'indirizzo del gruppo per chiarimenti tecnici e condivisione di documentazione ufficiale;

- *Incontri remoti*: la possibilità di organizzare meeting sulla piattaforma Zoom, a seguito dei quali il gruppo redigerà un *Verbale Esterno* per tracciare le decisioni prese;

- *Materiale di supporto*: la fornitura della documentazione tecnica relativa alla norma *EN 18031* e indicazioni sulle logiche dei *Decision Tree* da implementare.

Il gruppo *Coderius* si impegna a recepire i feedback ricevuti e a presentare un prodotto conforme ai requisiti concordati entro le scadenze prefissate.

=== Rapporti con il committente
#v(0.5em)
Il committente mette a disposizione strumenti di supporto e momenti di valutazione per monitorare la qualità dei processi e dei prodotti:

- *Ricevimenti e comunicazioni*: possibilità di richiedere incontri o inviare email istituzionali per chiarire dubbi metodologici o riguardanti la gestione del progetto;

- *Diari di Bordo*: incontri periodici in cui il gruppo espone l'avanzamento dei lavori, le difficoltà riscontrate e le soluzioni adottate.

Il gruppo si impegna a partecipare alle milestone di avanzamento previste:

- *RTB (Requirements and Technology Baseline)*: momento di revisione che prevede la consegna della documentazione (AdR, NdP, PdP, PdQ, Glossario) e la presentazione di un *PoC* (Proof of Concept) per dimostrare la fattibilità tecnica della soluzione scelta;

- *PB (Product Baseline)*: fase finale che prevede la consegna della documentazione tecnica completa e la presentazione dell'applicazione funzionante per la verifica della conformità allo standard* EN 18031*.



