#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Norme di Progetto], align(right)[Coderius Group],
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  },
)

#set text(font: "Libertinus Serif", size: 12pt, lang: "it")

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
  #v(4em)
  #text(size: 20pt)[*Versione 0.7.0*]
]

#pagebreak()

#heading(numbering: none, outlined: false)[Tabella di versionamento]
#v(0.5cm)
#align(center)[
  #table(
    columns: (0.4fr, auto, auto, auto, 1fr),
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
    [0.7.0], [2026/05/11], [Edis Hodja], [], [Aggiunta delle seguenti sezioni: 4.1, 4.2],
    [0.6.0], [2026/05/08], [Edis Hodja], [], [Aggiunta della sezione 3.5],
    [0.5.0],
    [2026/05/05],
    [Edis Hodja],
    [],
    [Aggiornamento delle seguenti sezioni: 2.2.2, 2.2.3, 2.2.4, 2.3.2, 2.3.5, 3.2.3, 3.3],

    [0.4.0], [2026/05/04], [Giovanni Bronte], [Alberto Canavese], [Aggiunta della sezione 3.4],
    [0.3.0], [2026/04/30], [Giovanni Bronte], [Alberto Canavese], [Aggiunta della sezione 3.2],
    [0.2.0], [2026/04/27], [Lorenzin Leonardo], [Alberto Canavese], [Aggiunta delle sezioni 3.1 e 3.3],
    [0.1.0], [2026/04/23], [Lorenzin Leonardo], [Alberto Canavese], [Prima stesura del documento],
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
#outline(title: none, target: figure.where(kind: image), indent: 1.5em)

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
Lo scopo dell'applicazione è quello di guidare l'utente attraverso un'analisi strutturata basata su *decision tree*, che consentono di percorrere i flussi logici della normativa in modo sistematico. Questo approccio non solo velocizza l'intero processo di valutazione, ma ne aumenta l'affidabilità riducendo il rischio di sviste manuali. Infine, il sistema è in grado di produrre automaticamente i report e la documentazione tecnica necessaria per attestare l'esito dell'analisi svolta.

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

- *Standard EN 18031* #nota[(Consultato tramite copia fornita dalla proponente)]
\
=== Riferimenti Informativi
#v(0.5em)
#list(
  marker: [•],
  indent: 0.5em,
  [Dispense del corso di Ingegneria del Software 2025/2026:
    #set list(marker: [-], indent: 1em)
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T01.pdf")[*T01 - Introduzione*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T02.pdf")[*T02 - I processi di ciclo di vita del software*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T03.pdf")[*T03 - Modelli di sviluppo software*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf")[*T04 - Gestione di progetto*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf")[*T05 - Analisi dei requisiti*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T06.pdf")[*T06 - Progettazione software*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T07.pdf")[*T07 - Qualità di prodotto*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T08.pdf")[*T08 - Qualità di processo*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T09.pdf")[*T09 - Verifica e validazione: introduzione*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T10.pdf")[*T10 - Verifica e validazione: analisi statica*] #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T11.pdf")[*T11 - Verifica e validazione: analisi dinamica*] #nota[(ultimo accesso: 2026-04-24)]
  ]
)
- #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf")[*Standard ISO/IEC 12207:1995*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://typst.app/docs/")[*Documentazione ufficiale di Typst*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://docs.github.com/en")[*Guida a Git e GitHub*] #nota[(ultimo accesso: 2026-04-24)]

= Processi Primari
== Introduzione ai processi primari
#v(0.5em)
Per realizzare un software funzionante e di qualità, il prodotto finale deve poter essere *robusto* e *mantenibile* nel tempo. \
A tal fine è necessario adottare un modello di lavoro basato su *procedure chiare*, capaci di guidare ogni attività in modo ordinato.

Seguendo lo standard *ISO/IEC 12207*, i processi primari principali si suddividono in:

- *Fornitura*: riguarda tutto ciò che serve per gestire il rapporto con la proponente esterno;

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
- *Monitoraggio e Controllo*: verifica costante dell'avanzamento dei lavori e della qualità dei prodotti intermedi, anche a seguito di eventuali feedback da parte della proponente;
- *Rilascio e Accettazione*: procedure di consegna del software e della documentazione, con successiva validazione da parte della proponente.

=== Documentazione coinvolta
#v(0.5em)
Le attività legate al processo di fornitura si concretizzano nella redazione e nel continuo aggiornamento dei seguenti documenti:

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Norme di progetto*]),
    [*Redattore*], [Amministratore],
    [*Tipo di documento*], [Interno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Piano di progetto*]),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Piano di Qualifica*]),
    [*Redattore*], [Amministratore],
    [*Tipo di documento*], [Esterno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Analisi dei Requisiti*]),
    [*Redattore*], [Analista],
    [*Tipo di documento*], [Esterno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Glossario*]),
    [*Redattore*], [Analista],
    [*Tipo di documento*], [Esterno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Verbali*]),
    [*Redattore*], [Team (assegnazione dinamica)],
    [*Tipo di documento*], [Esterno/Interno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Lettera di candidatura*]),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Valutazione dei Capitolati*]),
    [*Redattore*], [Analisti],
    [*Tipo di documento*], [Esterno],
    [*Scopo*],
    [
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
    table.header(table.cell(colspan: 2, fill: rgb("#99d6ff"), align: center)[*Dichiarazione degli Impegni*]),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*],
    [
      Documento formale in cui il gruppo presenta una stima dei costi del progetto e delle ore che verranno impiegate per essere completato. Inoltre vengono dichiarate le responsabilità assunte e la data di consegna prevista per il progetto.
    ],
  ),
  caption: [Descrizione del documento "Dichiarazione degli Impegni"],
  supplement: [Tabella],
  numbering: "1",
)

=== Gestione delle comunicazioni
#v(0.5em)
Per mantenere una comunicazione trasparente e tracciabile, a seconda della tipologia di incontro, il gruppo adotta le seguenti regole:
==== Comunicazioni con la proponente
#v(0.5em)
Riguardano tutti i contatti ufficiali tra il gruppo *Coderius* e *BlueWind S.r.l.* .

- *Incontri (meeting)*: ogni incontro con la proponente deve essere documentato in un *verbale esterno* , denominato secondo il formato _VerbaleEsterno-AAAA-MM-GG_, che riporti decisioni prese e chiarimenti ottenuti;
- *Comunicazioni formali*: per l'invio di documenti e comunicazioni ufficiali si utilizza esclusivamente la posta elettronica;
- *Canali rapidi*: per chiarimenti immediati e coordinamento si utilizzano strumenti di messaggistica istantanea (Telegram), attraverso i quali la proponente condivide risorse tecniche di riferimento;

==== Comunicazioni interne
#v(0.5em)
Riguardano il coordinamento tra i membri del gruppo *Coderius*.

- *Incontri (meeting)*: ogni incontro tra i componenti del gruppo deve essere documentato in un *verbale interno*, denominato secondo il formato _VerbaleInterno-AAAA-MM-GG_, che riporti decisioni prese e compiti da svolgere;
- *Canali rapidi*: per coordinamento e aggiornamenti si utilizzano strumenti di messaggistica istantanea (WhatsApp, Discord);

=== Strumenti a supporto
#v(0.5em)
Per il corretto svolgimento delle attività del processo di fornitura, il gruppo adotta i seguenti strumenti, distinguendoli in base all'ambito di utilizzo:

#set list(spacing: 1.5em)

==== Strumenti di comunicazione con la proponente
#v(0.5em)

- *Gmail*: utilizzato per comunicazioni formali, convocazione dei meeting;

- *Telegram*: utilizzato per chiarimenti immediati;

- *Zoom*: utilizzato per lo svolgimento dei meeting programmati per tempo.

==== Strumenti per il gruppo
#v(0.5em)

- *GitHub*: utilizzato per il versionamento e la conservazione di tutto il materiale prodotto (codice e documentazione), garantendo la tracciabilità delle versioni e delle modifiche;

- *Discord / WhatsApp*: utilizzati per il coordinamento quotidiano e incontri tra i componenti del gruppo;

- *Google Docs*: utilizzato per la collaborazione in tempo reale, in particolare per attività di brainstorming e redazione condivisa (es. definizione delle domande per gli incontri con la proponente).

== Processo di Sviluppo
#v(0.5em)
Il processo di sviluppo comprende l'insieme delle attività tecniche e metodologiche necessarie alla realizzazione del prodotto software, a cominciare dall'analisi dei requisiti fino alla consegna e verifica finale. L'obiettivo principale è garantire un ciclo di vita del software controllato, dove ogni fase contribuisce alla creazione di un sistema *robusto, sicuro, mantenibile nel tempo e conforme* alle specifiche della proponente.

=== Attività principali
#v(0.5em)
Di seguito le principali attività comprese nel processo di sviluppo:

- *Analisi dei Requisiti*: processo di individuazione, classificazione e formalizzazione delle necessità della proponente e dei vincoli normativi, comprensivo della definizione dei casi d'uso del sistema;

- *Progettazione dell'architettura*: definizione della struttura ad alto livello del sistema, individuando i componenti principali e le loro interazioni;

- *Progettazione di dettaglio*: definizione specifica dei singoli componenti e delle logiche interne, propedeutica alla scrittura del codice;

- *Codifica*: implementazione del codice sorgente seguendo le convenzioni e gli standard di stile stabiliti dal gruppo in fase di progettazione;

- *Test e Integrazione*: attività volta a verificare il corretto funzionamento dei singoli componenti e la loro successiva combinazione, assicurando la coerenza e l'interoperabilità dell'intero sistema realizzato.

=== Analisi dei Requisiti
#v(0.5em)
Questa fase mira a definire con precisione cosa il software debba fare. Il gruppo adotta le seguenti procedure:

- *Analisi delle fonti*: studio del capitolato e della documentazione messa a disposizione dalla proponente al fine di estrarre i vincoli tecnici e normativi;
- *Individuazione dei casi d'uso (UC)*: descrizione delle interazioni tra gli attori e il software tramite diagrammi UML e scenari (principali o alternativi);
- *Classificazione dei requisiti*: ogni requisito viene catalogato come funzionale, di qualità, di vincolo o prestazionale;
- *Attribuzione della priorità*: a ogni requisito viene assegnata una priorità (obbligatorio, desiderabile o opzionale) e un identificativo univoco secondo una specifica nomenclatura;
- *Tracciamento*: associazione costante tra requisiti e casi d'uso per garantire che ogni necessità richiesta dal capitolato sia soddisfatta e che ogni caso d'uso non sia superfluo.

==== Nomenclatura Casi D'uso
I casi d'uso sono identificati mediante la seguente convenzione:
#align(center, text(1.2em)[
  *UC-[IndiceRadice].[IndiceAnnidato]: Titolo*
])

Dove:\
- *UC*: acronimo di *Use Case* (caso d'uso);\
- *IndiceRadice*: numero progressivo che identifica un caso d'uso principale;\
- *IndiceAnnidato*: numero crescente che indica la sottosezione di un particolare use case, può essere ulteriormente annidato per rappresentare livelli successivo;\
- *Titolo*: nome per ogni use case per differenziarlo e riassumere il suo scopo al fine di essere più leggibile.\
La combinazione tra *IndiceRadice* e *IndiceAnnidato* costituisce un identificativo univoco e non duplicabile.\

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

- *Draw.io/PlantUML*: utilizzato per la realizzazione dei diagrammi UML che sono essenziali per l'analisi dei requisiti, in particolar modo per l'interpretazione dei casi d'uso.

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
- *Verbale esterno*: documentazione degli incontri con la proponente (BlueWind S.r.l.) o il committente;
- *Diario di bordo*: documento informativo periodico sullo stato di avanzamento del progetto.

==== Verbali
#v(0.5em)
I verbali del gruppo Coderius seguono una struttura fissa per facilitare la reperibilità delle informazioni:

- *Frontespizio*: include il logo del gruppo, i dati di contatto (#link("mailto:coderius01@gmail.com")), la tipologia di documento e i riferimenti temporali (data, ora di inizio e fine) e logici (luogo o canale di comunicazione) della riunione, la versione più recente reperita dalla tabella di versionamento;
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
La gestione delle attività previste avviene nel seguente ordine:\

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
- *Issue*: le issue permettono di tracciare, gestire e pianificare le attività per un progetto. Nel nostro caso vengono usate prima di creare un nuovo documento e per assegnare il lavoro alla persona con il ruolo più adatto per quello sprint. Ciascuna issue:
  - è identificata all’interno di GitHub tramite la notazione `#NUMERO`, dove `NUMERO` rappresenta un identificativo univoco del repository;
  - descrive l’attività da svolgere o la modifica richiesta;
  - può essere assegnata a uno o più membri del team;
  - viene aggiornata durante l’avanzamento dei lavori fino alla sua chiusura.

- *Project Board*: è una tavola digitale utilizzata per tracciare il lavoro che sta venendo svolto al momento. Le colonne principali utilizzate sono:
  - *Backlog*: attività da pianificare e non ancora avviata;
  - *Ready*: attività pronte per essere sviluppate;
  - *In Progress*: attività attualmente in sviluppo;
  - *In Review*: attività in fase di revisione;
  - *Done*: attività completate;

=== Rendicontazione dello stato della configurazione
#v(0.5em)
La rendicontazione dello stato della configurazione consiste nel definire come viene versionato un documento, il nostro gruppo ha adottato il seguente metodo: *MAJOR.MINOR.PATCH*.\
- *MAJOR*: viene incrementata solo in caso di approvazione ufficiale  e indica che il file in questione è concluso.
- *MINOR*: viene incrememtata in caso di modifiche sostanziali che alterano la struttura complessiva del file.
- *PATCH*: viene incrementata in caso di modifiche minori, come errori ortografici.


=== Valutazione della configurazione
#v(0.5em)
Questa attività serve a controllare che il software prodotto sia funzionale e completo rispetto ai requisiti rilevati. Quest'ultima è impostata grazie ad un tracciamento dei requisiti, definito all'interno del documento _Analisi dei requisiti_.

=== Strumenti utilizzati
#v(0.5em)
Gli strumenti per la gestione della configurazione che il gruppo ha deciso di adottare sono i seguenti:
- *GitHub*: principale strumento per creare, modificare e gestire tutti i documenti legati al progetto. Permette inoltre di poter creare delle milestone, assegnare ruoli e tracciare il lavoro.
- *GitHub Pages*: strumento di GitHub utilizzato per la realizzazione del sito web, sempre attivo e direttamente connesso con la nostra repository di GitHub. Il suo scopo principale è quello di consentire la visualizzazione al gruppo, alla proponente e ai committenti di tutta la documentazione prodotta in formato PDF consultabile dal sito.



== Garanzia della qualità
#v(0.5em)
Il gruppo implementa il processo di garanzia della qualità (_Quality Assurance_) con l'obiettivo di fornire evidenze concrete e verificabili che il prodotto software, i processi di sviluppo e tutta la documentazione prodotta siano conformi ai requisiti definiti, agli standard adottati e alle pianificazioni stabilite.

=== Attività previste
#v(0.5em)
Il processo di garanzia della qualità prevede le seguenti attività:

- *Implementazione del processo*: definizione e adozione delle metriche e delle procedure di qualità che verranno applicate durante l'intero ciclo di vita del progetto.
- *Controllo di processo*: verifica periodica che le attività svolte dai membri del gruppo siano aderenti alle procedure e agli standard stabiliti
- *Accertamento del prodotto*: verifica costante che il prodotto software e la relativa documentazione rispettino i requisiti specificati e le convenzioni stabilite dal gruppo;
- *Valutazione oggettiva*: la verifica e garanzia della qualità, quando possibile, viene affidata a membri del team che non hanno partecipato attivamente alla stesura del documento o porzione di codice in questione.

=== Linee guida
#v(0.5em)

Il processo di garanzia della qualità segue le seguenti linee guida:

- *Prevenzione prima della correzione*: il gruppo privilegia pratiche preventive, come revisioni e verifiche periodiche, rispetto alla correzione a posteriori delle anomalie;
- *Tracciabilità*: modifiche, verifiche e anomalie vengono documentate e tracciate tramite gli strumenti adottati dal team;
- *Miglioramento continuo*: procedure e modalità operative vengono periodicamente rivalutate per migliorarne efficacia ed efficienza;
- *Responsabilità condivisa*: la qualità del prodotto e della documentazione è responsabilità condivisa da tutti i membri del gruppo;
- *Conformità agli standard*: ogni artefatto prodotto deve rispettare convenzioni, requisiti e standard definiti dal gruppo.

=== Ruoli
#v(0.5em)
Nella seguente tabella sono riportati i ruoli principali ed essenziali per garantire la qualità del prodotto e della documentazione riguardante:
#v(0.5em)

#align(center, table(
  columns: (30%, 70%),

  [*Ruolo*], [*Specifica*],

  [Responsabile], [Supervisiona le attività di garanzia della qualità e il rispetto degli standard definiti.],

  [Verificatori], [Eseguono verifiche su documentazione, codice e artefatti prodotti.],

  [Amministratore], [Gestisce gli strumenti di automazione e supporto alle verifiche.],

  [Membri del gruppo], [Contribuiscono al mantenimento della qualità seguendo procedure e convenzioni condivise.],
))


== Verifica
Il processo di verifica è tecnico e oggettivo; ha lo scopo di valutare e determinare se il lavoro svolto (codifica e documentazione prodotta) soddisfi i requisiti concordati con la proponente. L'obiettivo di questo processo è di dimostrare in modo oggettivo la correttezza del prodotto per le richieste documentate nel capitolato di progetto e destinate all'utilizzo dell'utenza finale. Questo processo è continuo per la durata del progetto ed è definito nel _Piano di Qualifica_.

=== Attività previste
#v(0.5em)

Secondo lo standard ISO/IEC 12207:1995, il processo di verifica prevede le seguenti attività:

- *Implementazione del processo*: questa attività consiste unicamente nel predisporre il piano di verifica che effetuerà il controllo del lavoro svolto. Consiste nell' individuare le criticità e i rischi di non conformità del progetto.

- *Verifica*: esecuzione di attività di controllo e revisione su documentazione, codice e altri artefatti prodotti dal gruppo, al fine di individuare eventuali non conformità e garantirne la correttezza;

=== Implementazione del processo
La seguente attività ha come scopo principale l'individuazione delle criticità che possono essere trovate durante la realizzazione del progetto. Per tutte le criticità che possono essere riscontrate è stata condotta un'analisi accurata nella sezione 3 del documento _Piano di Progetto_. Questa analisi include anche: probabilità di occorrenza, gravità della criticità, strategie di mitigazione e di prevenzione.
=== Verifica
//da discuterne con il team
Le attività di verifica vengono svolte tramite il sistema di _Pull Request_ adottato dal gruppo su GitHub.
Ogni modifica viene sottoposta a revisione prima dell’integrazione nel ramo principale del repository.

Per ciascuna Pull Request viene assegnato un _reviewer_, generalmente corrispondente al verificatore dello sprint corrente, incaricato di controllare la conformità dell’artefatto rispetto ai requisiti, alle convenzioni e agli standard definiti dal gruppo.

Le attività di verifica vengono svolte da membri differenti dagli autori degli artefatti analizzati, così da garantire una valutazione quanto più oggettiva possibile.

=== Analisi statica
L'analisi statica viene così definita in quanto non richiede l'esecuzione del programma esaminato. Il suo scopo è verificare la sintassi e correttezza del documento o codice in esame.
Questa analisi può essere effettuata con i seguenti metodi:
- *Walktrough*: metodo manuale che richiede di effettuare un analisi critica di tutto il file in questione. Viene principalemnte usata solo quando si è a conoscenza della presenza di un errore, ma senza sapere dov'è o cos'è. Questo metodo è molto dispendioso in termini di tempo e di costi, per questo il nostro team punta ad usarla il meno possibile e solo nei casi in cui è strettamente necessaria, in favore di una verifica più automatizzabile come l'inspection.
- *Inspection*: metodo automatizzabile e guidato da una checklist predefinita. Questa checklist ha lo scopo di controllare tutti gli errori ricorrenti e criteri di qualità specifici. Dato che è un metodo automatizzabile il nostro gruppo predilige l'uso dell'inspection rispetto al walktrough, anche se l'inspection è meno approfondita del walktrough.

=== Analisi dinamica
// SEZIONE PIÙ SPECIFICA PER QUANDO INTEGREREMO CODIFICA
L'analisi dinamica, a differenza di quella statica, richiede l'esecuzione del programma per rilevare errori e anomalie nel comportamento a runtime.
Lo strumento principale di questa tecnica è il _TEST_, che per essere efficace deve rispettare due proprietà fondamentali: la ripetibilità, ovvero la capacità di produrre gli stessi risultati a parità di condizioni, e l'automatizzabilità, ovvero la possibilità di essere eseguito senza intervento manuale.

Queste proprietà sono essenziali per supportare la regressione: se un errore precedentemente risolto dovesse ripresentarsi, i test automatizzati permettono di individuarlo e di determinare quale modifica ha reintrodotto il problema.\
Ogni test è definito dai seguenti elementi: stato iniziale, serie di input, output attesi.\
I test sono divisi nelle seguenti 4 categorie:
- *Test di Unità*
- *Test di Integrazione*
- *Test di Sistema*
- *Test di Regressione*

== Validazione

Il processo di validazione rappresenta la fase conclusiva attraverso cui si accerta che il prodotto sviluppato soddisfi i requisiti definiti dalla proponente e risponda correttamente agli obiettivi del progetto. La validazione ha lo scopo di verificare che il sistema realizzato sia conforme alle esigenze espresse nel capitolato e che le funzionalità implementate risultino adeguate al contesto applicativo.

Nel contesto del progetto, il soggetto di riferimento per la validazione è l’azienda proponente, in qualità di committente del prodotto software.

=== Attività previste

- *Implementazione del processo*: definisce le modalità operative attraverso cui viene accertata la conformità del prodotto rispetto ai requisiti specificati nel capitolato e nella documentazione di progetto.

  La validazione viene inoltre supportata dall’utilizzo del caso studio fornito dal proponente, così da verificare il comportamento del sistema in un contesto applicativo realistico e coerente con gli obiettivi del progetto. Gli esiti dei test svolti vengono tracciati nel _Piano di Qualifica_.

- *Validazione*: ha lo scopo di accertare che il sistema sviluppato soddisfi i requisiti funzionali e gli obiettivi definiti nel capitolato di progetto.

  Le attività di validazione coinvolgono il ruolo di _Verificatore_, che controlla la correttezza funzionale delle componenti realizzate, con particolare attenzione all’esecuzione dei decision tree, alla gestione dei requisiti EN18031 e alla produzione degli esiti previsti (*PASS*, *FAIL*, *NOT APPLICABLE*).

#pagebreak()

= Processi Organizzativi

== Introduzione ai processi organizzativi
I processi organizzativi definiscono l’insieme delle attività e delle procedure adottate dal gruppo per coordinare il lavoro, gestire le risorse e garantire il corretto avanzamento del progetto durante l’intero ciclo di vita del software.

L’obiettivo principale di questi processi è garantire continuità operativa, collaborazione efficace tra i membri del gruppo e capacità di adattamento rispetto alle esigenze emerse durante lo sviluppo del progetto.

Nel contesto del progetto, i processi organizzativi riguardano in particolare:
- *Gestione del Processo*
- *Gestione dell'Infrastruttura*
- *Ottimizzazione del Processo*
- *Formazione*

== Gestione del Processo

La gestione del processo definisce le modalità con cui il gruppo pianifica, organizza e monitora le attività necessarie allo sviluppo del progetto.
L’obiettivo principale è garantire una distribuzione efficace del lavoro, il rispetto delle scadenze concordate e il controllo continuo dell’avanzamento delle attività.

=== Attività previste
#v(0.5em)

- *Definizione della metodologia di sviluppo*
- *Organizzazione del team e assegnazione dei ruoli*
- *Pianificazione delle milestone e degli sprint*
- *Gestione operativa delle attività*
- *Monitoraggio dell’avanzamento del progetto*
- *Gestione delle comunicazioni e della documentazione organizzativa*

=== Metodologia di sviluppo
Il gruppo adotta un approccio di sviluppo Agile, basato su cicli iterativi e incrementali della durata di due settimane ciascuno, denominati sprint. Questa scelta nasce dalla natura del progetto, che richiede un confronto frequente con il proponente e la necessità di affinare progressivamente l’interpretazione dei requisiti e delle soluzioni progettuali. \
In particolare, il modello adottato si caratterizza per i seguenti aspetti:

- _Iterazioni brevi e cadenzate_: ogni sprint ha una durata fissa di due settimane, al termine delle quali il gruppo valuta i risultati ottenuti e pianifica le attività successive.
- _Sviluppo incrementale_: ogni sprint produce un incremento funzionante del sistema, riducendo il rischio di accumulare lavoro non verificato e rendendo più agevole il controllo della qualità nel tempo.
- _Adattabilità_: la struttura iterativa permette al gruppo di reagire tempestivamente a cambiamenti nei requisiti o a criticità emerse durante lo sviluppo, senza compromettere la stabilità complessiva del progetto.

=== Organizzazione del team e ruoli
Ciascuno dei membri del gruppo ricopre un ruolo che varia ad ogni sprint in base ad un criterio di rotazione equo e distribuito. Questa scelta, oltre a essere un requisito del corso, garantisce che ogni membro acquisisca nel tempo una visione completa del progetto e del processo di sviluppo, riducendo la dipendenza da singole figure e favorendo una collaborazione più consapevole. \
Di seguito vengono riportati i vari ruoli e vengono descritte le responsabilità associate a ciascuno di essi:
- *Responsabile*\
  Si occupa del monitoraggio delle risorse e gestisce le scadenze ed eventuali rischi. È il ruolo cruciale che autorizza il rilascio dei prodotto, che siano parziali o finali. Il suo impegno è richiesto in maniera costante per l'intera fase di sviluppo progettuale.

- *Amministratore*\
  Assicura l’efficienza di procedure, strumenti e tecnologie a supporto del Way of Working del team. La sua presenza è costante per l’intero progetto.

- *Analista*\
  Si occupa dell'intera analisi e stesura della documentazione relativa all'_Analisi dei Requisiti_, impegnandosi a determinare e soddisfare tutti i requisiti richiesti dalla proponente in maniera che l'intero team riesca ad operare in maniera efficace.

- *Progettista*\
  Stabilisce la struttura del software, rappresentante il prodotto richiesto, definendo l'architettura dell'applicazione e la suddivisione tra i componenti Frontend e Backend.

- *Programmatore*\
  Ruolo cruciale nella fase di implementazione e codifica, in quanto si occupa di sviluppare il codice sorgente, collaborando con il _Progettista_ riguardo alle decisioni stabilite.

Pur essendo assegnati ruoli specifici per ciascuno sprint, le attività vengono svolte in modo collaborativo tra i membri del gruppo.

=== Pianificazione delle milestone

Il progetto prevede diverse revisioni di avanzamento e il superamento di ciascuna di esse consente al team di proseguire con l'operato in maniera supervisionata. In particolare sono due le principali pianificazioni riportate per ordine di avanzamento:
- *RTB Requirements and Technology Baseline*: fissa i requisiti da soddisfare in accordo con la proponente, nella documentazione dedicata all'_Analisi dei Requisiti_, vengono motivate le tecnologie adottate e se ne dimostra adeguatezza e interoperabilità tramite il _Proof of Concept_.

- *PB Product Baseline*: vaglia la maturità della baseline architetturale del prodotto software e la sua realizzazione e prevede l'integrazione di:
  - *Specifica Tecnica*: documentazione dedicata all'architettura logica del prodotto, per componenti, ruoli, connessioni e interazioni;
  - *Minimum Viable Product*: approssima da vicino il prodotto atteso, non ancora definitivo, per una conferma definitiva del completamento del prodotto.

=== Verbali
Ciascuna delle riunioni, interne al gruppo ed esterne con la proponente, vengono verbalizzate e documentate in appositi verbali redatti da un membro del gruppo. \
Ogni verbale riporta la data, i partecipanti, gli argomenti discussi, le decisioni prese e le eventuali azioni da intraprendere, costituendo così una traccia formale e consultabile dell'avanzamento del progetto e delle scelte effettuate nel tempo.

=== Gestione degli sprint
Il team adotta un approccio Agile per assicurare massima produttività e organizzazione operativa. Il lavoro viene organizzato in periodi temporali definiti _sprint_, solitamente con una durata di due settimane, che prevedono una schematica coordinazione:
- *Fase iniziale di pianificazione*: vengono prefissati dal team gli obiettivi che in quella durata bisettimanale dovranno essere raggiunti, suddividendoli in unità specifiche (issue) e categorizzando ciascuna di esse in termini di priorità tramite le label.
- *Stato intermedio*: il gruppo tramite i canali di comunicazione stabiliti si ritrova a discutere e ad aggiornarsi sullo stato di avanzamento.
- *Valutazione e consuntivo*: al termine del ciclo lavorativo vengono tratte delle conclusioni circa le procedure adottate e il punto di arrivo di ogni membro, dichiarando le unità definite inizialmente come complete o work in progress.

=== Monitoraggio dell’avanzamento
L'andamento procedurale delle unità di lavoro in cui vengono divisi gli obiettivi è gestito tramite una _Project Board_ (Kanban) organizzata in fasi di avanzamento che rispecchiano il ciclo di vita di ciascuna attività: dalla sua definizione e inserimento nel backlog di progetto (*Backlog*), alla selezione e preparazione per lo sprint corrente (*Ready*), fino alla presa in carico da parte del membro assegnato (*In Progress*), alla fase di revisione da parte del _Verificatore_ (*In Review*) e alla sua chiusura definitiva a seguito dell'approvazione (*Done*) con integrazione al ramo principale da parte del _Responsabile_.

== Gestione dell’infrastruttura
La gestione dell'infrastruttura ha lo scopo di definire, realizzare e mantenere nel tempo l'insieme delle infrastrutture, degli ambienti di lavoro e degli strumenti di supporto adottati dal gruppo durante l'intero ciclo di vita del progetto, garantendo che siano sempre adeguati alle esigenze operative e coerenti con il _Way of Working_ stabilito.

=== Attività previste
#v(0.5em)

- *Gestione del repository e dei servizi di hosting*
- *Configurazione degli ambienti di sviluppo*
- *Automazione dei processi di integrazione e distribuzione*
- *Gestione della disponibilità e conservazione dei dati*
- *Gestione e aggiornamento dell'ambiente di lavoro*

=== Repository e hosting
Per la gestione centralizzata del codice e della documentazione viene utilizzato GitHub, adottando un modello ispirato a GitHub Flow che permette di mantenere un workflow semplice, ordinato e coerente con l'approccio Agile. Il modello è il seguente:
- *Struttura dei branch*: il ramo principale dell'intera struttura è rappresentata dal _main_ in cui viene pubblicata la documentazione e la codifica verificata e quasi sempre definitiva. Prima di essere approvate, le nuove pubblicazioni vengono validate dal _Verificatore_, che effettua una review approfondita nel branch _develop_. \ Successivamente il _Responsabile_ è abilitato ad effettuare l'integrazione al ramo principale.
- *Convenzione di denominazione*: per le varie operazioni e attività effettuate viene creato un branch dedicato che segue una struttura accordata dal team:
  - *feature/nome-feature* — per lo sviluppo di nuove funzionalità;
  - *fix/nome-fix* — correzione di bug o comportamenti anomali;
  - *docs/nome-documento* — modifiche o aggiunte alla documentazione;
- *Revisione e merge*: l'integrazione del lavoro avviene in due fasi distinte, entrambe gestite tramite _Pull Request_. Nella prima fase il branch di lavoro viene unito a _develop_, previa revisione e approvazione da parte del _Verificatore_. Una volta consolidato il lavoro su _develop_, viene aperta una seconda PR per l'integrazione definitiva su _main_, anch'essa soggetta alla revisione del _Verificatore_ prima del merge.
- *Pipeline automatizzate*: sono configurate GitHub Actions per automatizzare le operazioni ripetitive, tra cui la compilazione dei documenti Typst in PDF e la loro pubblicazione sul sito del progetto.

=== Infrastruttura di sviluppo
L'infrastruttura di sviluppo comprende l'insieme degli strumenti, degli ambienti e delle configurazioni adottate dal gruppo per garantire un processo di sviluppo standardizzato, ripetibile e facilmente manutenibile nel tempo. In particolare il team utilizza i seguenti strumenti:
- *Discord*: Canale vocale di comunicazione principale specialmente utilizzato per gli incontri interni e per la discussione in tempo reale di punti cruciali;
- *WhatsApp*: Canale di comunicazione rapido per messaggistica e brainstorming generale;
- *Zoom*: Strumento di comunicazione sfruttato per la discussione relativa ai _Diari di Bordo_ assieme al docente;
- *Google Meet*: Strumento di comunicazione utilizzato per le riunioni esterne assieme all'azienda proponente;
- *Typst*: Servizio standard per la stesura e compilazione dell'intera documentazione prodotta nell'intero ciclo di vita del progetto;
- *Git*: Sistema di versionamento distribuito per codice e documentazione;
- *GitHub*: Piattaforma per la repository di gruppo, issue tracking system e integrazione continua;
- *Google Docs*: Sistema per la stesura di domande e brainstorming su tematiche affrontate durante gli incontri interni.
- *Python*: Linguaggio di programmazione utilizzato per alcune automazioni;

=== Gestione dell'ambiente di lavoro

Mantenere l'infrastruttura e gli strumenti del progetto aggiornati e funzionanti è una responsabilità continua che accompagna l'intero ciclo di sviluppo. Lo scopo è preservare la continuità operativa e l'affidabilità dell'ambiente, assicurando che tutto resti coerente con gli standard stabiliti dal gruppo.

Gli interventi si distinguono in base alla loro natura:

+ *Interventi ricorrenti*: aggiornamenti e operazioni periodiche legate alla normale evoluzione delle attività;
+ *Interventi straordinari*: modifiche, aggiunte o rimozioni di strumenti, configurazioni o risorse rese necessarie da cambiamenti nei requisiti, criticità impreviste o decisioni organizzative non pianificate.


#pagebreak()

== Ottimizzazione del processo
L'ottimizzazione del processo ha l'obiettivo di garantire che le modalità di lavoro adottate dal gruppo evolvano nel tempo, adattandosi alle esigenze emergenti e agli standard di qualità definiti. Anziché considerare il _Way of Working_ come qualcosa di fisso, il gruppo lo tratta come un elemento vivo: soggetto a osservazione, valutazione e revisione continua lungo l'intero ciclo di vita del progetto.

In questo senso, ogni fase di lavoro rappresenta un'occasione per individuare inefficienze, consolidare le pratiche più efficaci e introdurre correzioni mirate, con l'obiettivo di incrementare progressivamente sia la qualità dei risultati che la sostenibilità del processo stesso.

=== Attività previste
#v(0.5em)

Il processo si articola in tre attività principali:

- *Definizione delle procedure*: formalizzazione delle modalità operative adottate dal gruppo, con relativa documentazione nelle Norme di Progetto e nel _Way of Working_ stabilito.
- *Monitoraggio e valutazione*: osservazione continua dell'andamento delle attività attraverso retrospettive periodiche, analisi delle criticità emerse e valutazione delle metriche associate al processo.
- *Revisione e miglioramento*: identificazione delle aree di inefficienza e introduzione di correzioni mirate, aggiornando la documentazione ufficiale ogni qualvolta le procedure vengano modificate.

=== Retrospettive e revisione interna
Al termine di ogni sprint il gruppo dedica un momento strutturato di riflessione collettiva, finalizzato a valutare l'andamento del periodo appena concluso. 
In questa sede vengono analizzati gli obiettivi raggiunti, le difficoltà incontrate e le dinamiche di collaborazione emerse, con l'intento di trarre indicazioni concrete per lo sprint successivo.

Le retrospettive non hanno carattere formale, ma seguono una struttura ricorrente che favorisce la partecipazione attiva di tutti i membri. Gli esiti della discussione vengono sintetizzati e riportati nel verbale d'interesse, e se necessario tradotti in azioni da integrare nel _Way of Working_.

=== Gestione delle criticità
Quando si presenta una problematica che rischia di compromettere il regolare svolgimento delle attività, il gruppo segue un iter strutturato articolato nelle seguenti fasi:

#v(0.5em)
+ *Identificazione*: la criticità viene rilevata e descritta in modo chiaro, specificandone il contesto e le attività coinvolte.
+ *Analisi*: si individuano le cause alla base del problema e si valuta l'impatto sulle tempistiche, sulle risorse e sulla qualità del progetto.
+ *Risposta*: in base alla natura e all'urgenza, il gruppo definisce le azioni correttive più appropriate, che possono includere la ridistribuzione dei compiti, la revisione delle stime, l'aggiornamento degli strumenti o la modifica delle procedure coinvolte.
+ *Tracciamento*: ogni criticità rilevante viene registrata e monitorata fino alla sua risoluzione, al fine di prevenire il ripresentarsi di situazioni analoghe.

=== Aggiornamento delle procedure
Le norme e le procedure adottate dal gruppo non sono considerate definitive. Infatti, possono essere riviste e aggiornate in qualsiasi momento del progetto, qualora emerga la necessità di adeguarle a nuove esigenze operative o di correggere aspetti risultati inefficaci nella pratica. \
In ogni caso, la seguente documentazione risulta sempre la più valida e affidabile in termini di aggiornamento dell'intera procedura seguita dal gruppo.

== Formazione
=== Condivisione delle conoscenze
=== Studio delle tecnologie
=== Supporto tra membri del gruppo

