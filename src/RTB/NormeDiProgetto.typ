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
  #image("../images/logoCoderius.jpg", width: 60%)
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
    [0.3.0], [2026/04/30], [Giovanni Bronte], [],[Aggiunta della sezione 3.2],
    [0.2.0], [2026/04/27], [Lorenzin Leonardo], [],[Aggiunta delle sezioni 3.1 e 3.3],
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
= Processi di Supporto
#v(0.5em)
La seguente sezione descrive i processi di supporto secondo lo standard ISO/IEC 12207, che hanno lo scopo di garantire l'efficace gestione, controllo e qualità delle attività del ciclo di vita del progetto.\
I processi di supporto che verranno descritti in questa sezione sono i seguenti:
- *Documentazione*
- *Gestione delle configurazioni*
- *Accertamento della qualità*
- *Verifica*
- *Validazione*

#v(1em)

== Documentazione
#v(0.5em)
Il processo di documentazione ha lo scopo di raccogliere, organizzare e gestire l'insieme dei documenti prodotti durante l'intero ciclo di vita del progetto. Non rappresenta una semplice attività di archiviazione, ma costituisce il fondamento per garantire la trasparenza, la manutenibilità e la continuità del lavoro tra i membri del gruppo.

Ogni attività, decisione tecnica o organizzativa deve essere formalizzata per permettere:
- *Tracciabilità*: ricostruire l'evoluzione del progetto e le motivazioni dietro ogni scelta architetturale o normativa;
- *Qualità*: assicurare che ogni documento prodotto rispetti gli standard definiti e sia sottoposto a verifica prima del rilascio;
- *Comunicazione*: facilitare lo scambio di informazioni tra i componenti del team e verso la proponente e i committenti.

=== Tipologie di documenti
#v(0.5em)
Il gruppo ha definito dei template specifici per garantire l'uniformità e la professionalità della documentazione. I documenti che dispongono di una struttura predefinita sono:

- *Verbale interno*: resoconto delle riunioni di coordinamento del team;
- *Verbale esterno*: documentazione degli incontri con il proponente (BlueWind S.r.l.) o il committente;
- *Diario di bordo*: documento informativo periodico sullo stato di avanzamento del progetto.

==== Verbali
#v(0.5em)
I verbali del gruppo Coderius seguono una struttura fissa per facilitare la reperibilità delle informazioni:

- *Frontespizio*: include il logo del gruppo, i dati di contatto (#link("mailto:coderius01@gmail.com")), la tipologia di documento e i riferimenti temporali (data, ora di inizio e fine) e logici (luogo o canale di comunicazione) della riunione;
- *Tabella di versionamento*: riporta lo storico delle modifiche, indicando versione, data, autore, verificatore e descrizione dell'aggiornamento;
- *Indice*: elenco numerato delle sezioni per una navigazione rapida del documento;
- *Partecipanti*: lista dei membri del team presenti all'incontro;
- *Ordine del Giorno*: elenco sintetico dei punti che si intendono affrontare durante la seduta;
- *Svolgimento della Riunione*: trattazione dettagliata di ogni punto dell'ordine del giorno e discussioni su varie altre decisoni prese per l'avanzamento del progetto;
- *Conclusioni e Decisioni prese*: riassunto di quanto è stato discusso durante la riunione, tramite una tabella.
- *Ordine del giorno prossimo incontro*: elenco degli argomenti principali di cui discutere durante il successivo incontro. 
- *TODO (Attività da svolgere)*: tabella riassuntiva che elenca i compiti assegnati in vista dell'incontro successivo.
#v(0.5em)
*Convenzioni di nomenclatura e codifica*
#v(0.5em)
Per garantire la tracciabilità tra discussioni e azioni, il gruppo adotta i seguenti formati:

- *Attività (TODO)*: identificate dal codice *TD-x.y* (dove $x$ è il numero progressivo del verbale e $y$ l'identificativo dell'attività);
- *Decisioni di riferimento*: collegate alle attività tramite il codice $V I_G - x.y$ per i verbali interni (dove $G$ a pedice indica il riferimento al Glossario);
- *Date*: espresse nel formato *AAAA/MM/GG* per uniformità con il registro delle modifiche e gli standard internazionali.

==== Diario di bordo
#v(0.5em)
Questa tipologia di documento ha la funzione di monitorare periodicamente lo stato di avanzamento del gruppo e possiede una finalità prettamente informativa. La struttura dei Diari di Bordo si articola in tre punti chiave:

- *Risultati raggiunti*: elenco dettagliato delle attività portate a termine nel periodo di riferimento ;
- *Attività successive*: pianificazione dei task previsti per il periodo successivo;
- *Difficoltà riscontrate*: analisi di eventuali criticità o ostacoli emersi durante lo svolgimento del lavoro.

==== Denominazione dei documenti
#v(0.5em)
Al fine di garantire un ordinamento cronologico intuitivo e una gestione efficiente dei file nel repository, il gruppo ha stabilito una nomenclatura standard basata sul formato *NomeDocumento-AAAA-MM-GG*. Nello specifico:

- *Verbali interni*: `VerbaleInterno-AAAA-MM-GG`;
- *Verbali esterni*: `VerbaleEsterno-AAAA-MM-GG`;
- *Diari di bordo*: `DiarioDiBordo-AAAA-MM-GG`.

=== Strumenti per la documentazione
#v(0.5em)
Per la redazione e la gestione della documentazione, il gruppo ha deciso di utilizzare i seguenti strumenti:

- *Typst*: è il principale linguaggio di markup utilizzato per l'intera documentazione di progetto. A differenza di sistemi più datati come LaTeX, Typst offre una compilazione istantanea e una sintassi più moderna e leggibile. Questo permette al gruppo di mantenere un alto standard qualitativo dei documenti, garantendo al contempo una maggiore velocità nella revisione dei contenuti e nella gestione dei template personalizzati;

- *GitHub*: rappresenta il fulcro del sistema di conservazione e controllo dei documenti. L'utilizzo di repository dedicate permette di tracciare ogni singola modifica tramite il versionamento del codice sorgente dei file `.typ`. Il gruppo sfrutta inoltre le seguenti funzionalità:
  - *Pull Request*: per gestire i processi di verifica e approvazione in modo strutturato prima dell'integrazione definitiva;
  - *GitHub Actions*: per automatizzare la generazione dei PDF a partire dai sorgenti Typst, garantendo che l'ultima versione prodotta sia sempre disponibile e correttamente formattata;
  - *Issue e Projects*: per la pianificazione dei task documentali e il monitoraggio delle scadenze.

=== Produzione 
#v(0.5em)
Per la produzione di un documento il nostro gruppo opera nel seguente modo:
- *Creazione Issue e Branch dedicato*: Inizialmente viene creata una issue su Github dal responsabile assegnato in quello sprint. Successivamente, se il documento ha una certa importanza, viene creato un branch di feature a parte per poter effetuare modifiche senza modificare il main. Se il documento da creare è invece di minore importanza, come un verbale, questo viene creato nel branch apposito: feature/verbali.
- *Stesura del documento*: Il documento viene assegnato ad uno dei membri del team che ricopre il ruolo adatto per la stesura del documento per quello sprint e inizia a lavorare sulla stesura del documento. 
- *Verifica del documento*: Ogni volta che il documento viene aggiornato, quest'ultimo deve essere verificato dal chi copre il ruolo verificatore e aggiornare la tabella di versionamento di conseguenza con il nome di chi ha effetuato la verifica.
- *Approvazione e Merge*: Una volta che il documento è concluso viene aperta una pull request su github, la quale viene in seguito approvata dal responsabile che esegue il merge del branch dedicato al main. Una volta che il documento è caricato sul main branch viene considerato concluso e grazie all'automazione di Github, viene generato il pdf in automatico.  

=== Manutenzione
#v(0.5em)
Nel caso in cui i documenti necessitino di modifiche a causa di eventuali errori presenti all'interno del loro contenuto, il gruppo segue i seguenti passaggi:

+ Creare un nuovo branch di lavoro dedicato per la correzione degli errori (es.feature/norme-progetto-fix).

+ Apportare le modifiche necessarie in locale;

+ Integrare la tabella di versionamento dello specifico documento inserendo una nuova riga che spiega quanto fatto;

+ Effettuare il push sul branch di lavoro;

+ Aprire una Pull Request in modo che tale che il documento aggiornato possa essere verificato dal membro del gruppo assegnato a tale attività;

+ Aggiungere il documento revisionato nel branch dedicato a quest'ultimo (es. feature/norme-progetto).


== Gestione della configurazione
#v(0.5em)
Questa sezione ha l'obiettivo di descrivere come il gruppo Coderius gestisce le componenti software nel progetto, al fine di garantire tracciabilità, coerenza e controllo delle modifiche.

=== Attività previste
#v(0.5em)
La gestione delle attività previste avviene nel seguente ordine:
+ *Identificazione della configurazione*
+ *Controllo della configurazione*
+ *Rendicontazione dello stato della configurazione*
+ *Valutazione della configurazione*

=== Identificazione della configurazione
#v(0.5em)
Secondo lo standard ISO/IEC 12207:1995 l'attività di identificazione della configurazione consiste nell'individuazione di tutte le componenti, questo include tutti i componenti composti da codice ma anche la parte documentale.\
Questa attività sarà effettuata durante la fase di progettazione e schematizza l'architettura del software, la quale verrà in seguito implementata dagli sviluppatori.
=== Controllo della configurazione
#v(0.5em)
Per poter svolgere al meglio questa attività, il gruppo Coderius ha deciso di usare i seguenti strumenti: 
- *Pull Request*: la pull request permette al nostro team di revisionare il lavoro fatto e approvarlo tramite una merge prima di poterlo integrare nel main branch, questo viene fatto per ridurre al minimo gli errori prima di caricare un documento considerato concluso.
- *Issue*: le issue permettono di tracciare, gestire e pianificare le attività per un progetto. Nel nostro caso vengono usate prima di creare un nuovo documento e per assegnare il lavoro alla persona con il ruolo più adatto per quello sprint.
- *Project Board*: è una tavola digitale utilizzata per tracciare il lavoro che sta venendo svolto al momento. È suddivisa in backlog, Ready, In progress, In review, Done.
Questi strumenti sono forniti gratuitamente dalla piattaforma Github.

=== Rendicontazione dello stato della configurazione
#v(0.5em)
La rendicontazione dello stato della configurazione consiste nel definire come viene versionato un documento, il nostro gruppo ha adottato il seguente metodo: *MAJOR.MINOR.PATCH*.\
- *MAJOR*: viene incrementata solo in caso di approvazione ufficiale  e indica che il file in questione è concluso.
- *MINOR*: viene incrememtata in caso di modifiche sostanziali che alterano la struttura complessiva del file.
- *PATCH*: viene incrementata in caso di modifiche minori, come errori ortografici. 


=== Valutazione della configurazione
#v(0.5em)
Questa attività serve a controllare che il software prodotto sia funzionale e completo rispetto ai requisiti rilevati. Quest'ultima è impostata grazie ad un tracciamento dei requisiti, definito all'interno del documento "Analisi dei requisiti".

=== Strumenti utilizzati
#v(0.5em)
Gli strumenti per la gestione della configurazione che il gruppo ha deciso di adottare sono i seguenti:
- *GitHub*: principale strumento per creare, modificare e gestire tutti i documenti legati al progetto. Permette inoltre di poter creare delle milestone, assegnare ruoli e tracciare il lavoro.
- *Github Pages*: strumento di Github utilizzato per la realizzazione del sito web, sempre attivo e direttamente connesso con la nostra repository di GitHub. Il suo scopo principale è quello di consentire la visualizzazione al gruppo, al proponente e ai committenti di tutta la documentazione prodotta in formato PDF.



== Garanzia della qualità
#v(0.5em)
Il gruppo implementa il processo di Garanzia della Qualità (Quality Assurance) con l'obiettivo di fornire evidenze concrete e verificabili che il prodotto software, i processi di sviluppo e tutta la documentazione prodotta siano conformi ai requisiti definiti, agli standard adottati e alle pianificazioni stabilite.

=== Attività previste
#v(0.5em)
Il processo di garanzia della qualità prevede le seguenti attività:

- *Implementazione del processo*: definizione e adozione delle metriche e delle procedure di qualità che verranno applicate durante l'intero ciclo di vita del progetto.
- *Controllo di processo*: verifica periodica che le attività svolte dai membri del gruppo siano aderenti alle procedure e agli standard stabiliti
- *Accertamento del prodotto*: verifica costante che il prodotto software e la relativa documentazione rispettino i requisiti specificati e le convenzioni stabilite dal gruppo;
- *Valutazione oggettiva*: la verifica e garanzia della qualità, quando possibile, viene affidata a membri del team che non hanno partecipato attivamente alla stesura del documento o porzione di codice in questione.


