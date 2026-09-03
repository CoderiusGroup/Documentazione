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
  #text(size: 20pt)[*Versione 1.0.1*]
]

#pagebreak()

#heading(numbering: none, outlined: false)[Tabella di versionamento]
#v(0.5cm)
#align(center)[
  #table(
    columns: (0.5fr, auto, auto, auto, 1fr),
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
    [1.0.1], [2026/07/03], [Edis Hodja], [Filippo Zonta Rocha], [Aggiornamento contenuti della descrizione relativa ai ruoli],
    [1.0.0], [2026/06/23], [Edis Hodja], [], [Approvazione del documento],
    [0.10.1], [2026/06/13], [Giovanni Bronte], [Edis Hodja], [Modifiche alle tabelle delle metriche],
    [0.10.0], [2026/05/28], [Alberto Canavese], [Giovanni Bronte], [Aggiunta della seguente sezione: 5.3.2.2],
    [0.9.0], [2026/05/15], [Edis Hodja], [Giovanni Bronte], [Aggiunta delle seguenti sezioni: 5.1, 5.2, 5.3],
    [0.8.2], [2026/05/15], [Leonardo Lorenzin], [Filippo Zonta Rocha], [Aggiornamento contenuti e correzioni refusi],
    [0.8.1], [2026/05/13], [Filippo Zonta Rocha], [Leonardo Lorenzin], [Aggiornamento contenuti e correzioni refusi],
    [0.8.0], [2026/05/13], [Edis Hodja], [Filippo Zonta Rocha], [Aggiunta delle seguenti sezioni: 4.3, 4.4, 4.5],
    [0.7.0], [2026/05/11], [Edis Hodja], [Filippo Zonta Rocha], [Aggiunta delle seguenti sezioni: 4.1, 4.2],
    [0.6.0], [2026/05/08], [Edis Hodja], [Filippo Zonta Rocha], [Aggiunta della sezione 3.5],
    [0.5.0], [2026/05/05], [Edis Hodja], [Filippo Zonta Rocha], [Aggiornamento delle seguenti sezioni: 2.2.2, 2.2.3, 2.2.4, 2.3.2, 2.3.5, 3.2.3, 3.3],
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

#pagebreak()

#text(size: 18pt, weight: "bold")[Elenco delle Tabelle]
#outline(
  title: none,
  target: figure.where(supplement: [Tabella]),
  indent: 1.5em,
)

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
Il presente documento ha l'obiettivo di definire il _Way of Working_, ovvero l'insieme di regole, convenzioni e standard che il gruppo si impegna a rispettare durante l'intero ciclo di vita del progetto.\
Questo documento verrà redatto contestualmente all'avanzamento delle attività; potrà quindi subire variazioni, integrazioni o rimozioni sulla base delle conoscenze apprese durante il corso del progetto.

== Scopo del prodotto
#v(0.5em)
Il prodotto finale è un'applicazione _web-based_ sviluppata per automatizzare la verifica della conformità alla norma *EN 18031*, ossia lo standard tecnico europeo che stabilisce i requisiti di sicurezza dei dispositivi radio wireless.
Lo scopo dell'applicazione è quello di guidare l'utente attraverso un'analisi strutturata basata su *decision tree*, che consentono di percorrere i flussi logici della normativa in modo sistematico. Questo approccio non solo velocizza l'intero processo di valutazione, ma ne aumenta l'affidabilità riducendo il rischio di sviste manuali. Infine, il sistema è in grado di produrre automaticamente i report e la documentazione tecnica necessaria per attestare l'esito dell'analisi svolta.

== Glossario
#v(0.5em)
All'interno delle *#link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[#underline(text(fill: blue)[Norme di Progetto])]*, così come negli altri documenti formali, i termini che trovano una definizione specifica nel relativo documento *#link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Glossario.pdf")[#underline(text(fill: blue)[Glossario])]* verranno contrassegnati da una lettera "*G*" maiuscola a pedice (es. Termine#sub[G]).

Questa convenzione permette al lettore di individuare immediatamente i vocaboli che possiedono un significato particolare nel contesto del progetto, invitandolo a consultarne la definizione per evitare ambiguità riguardo al linguaggio tecnico utilizzato e garantire così una migliore comprensione dei contenuti.

== Riferimenti

=== Riferimenti Normativi
#v(0.5em)
I documenti elencati di seguito rappresentano i vincoli diretti e le norme da rispettare per lo sviluppo del progetto:

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[*Capitolato C1 — Automated EN18031 Compliance Verification*] #nota[(ultimo accesso: 2026-05-22)]
- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[*Regolamento del Progetto Didattico*] #nota[(ultimo accesso: 2026-04-30)]
- #link("https://www.iso.org/standard/63712.html")[*Standard ISO/IEC 12207:2017*] #nota[(ultimo accesso: 2026-04-27)]
- *Standard EN 18031* #nota[(Consultato tramite copia fornita dalla proponente)]

=== Riferimenti Informativi
#v(0.5em)
- Dispense del corso di Ingegneria del Software 2025/2026:
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T01.pdf")[*T01 - Introduzione*] #nota[(ultimo accesso: 2026-04-23)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T02.pdf")[*T02 - I processi di ciclo di vita del software*] #nota[(ultimo accesso: 2026-04-27)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T03.pdf")[*T03 - Modelli di sviluppo software*] #nota[(ultimo accesso: 2026-04-27)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf")[*T04 - Gestione di progetto*] #nota[(ultimo accesso: 2026-04-30)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf")[*T05 - Analisi dei requisiti*] #nota[(ultimo accesso: 2026-05-11)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T06.pdf")[*T06 - Progettazione software*] #nota[(ultimo accesso: 2026-05-13)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T07.pdf")[*T07 - Qualità di prodotto*] #nota[(ultimo accesso: 2026-06-13)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T08.pdf")[*T08 - Qualità di processo*] #nota[(ultimo accesso: 2026-06-13)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T09.pdf")[*T09 - Verifica e validazione: introduzione*] #nota[(ultimo accesso: 2026-05-15)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T10.pdf")[*T10 - Verifica e validazione: analisi statica*] #nota[(ultimo accesso: 2026-05-15)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T11.pdf")[*T11 - Verifica e validazione: analisi dinamica*] #nota[(ultimo accesso: 2026-05-15)]
- #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf")[*Standard ISO/IEC 12207:1995*] #nota[(ultimo accesso: 2026-04-30)]
- #link("https://typst.app/docs/")[*Documentazione ufficiale di Typst*] #nota[(ultimo accesso: 2026-04-23)]
- #link("https://docs.github.com/en")[*Guida a Git e GitHub*] #nota[(ultimo accesso: 2026-04-23)]

= Processi Primari
== Introduzione ai processi primari
#v(0.5em)
Per realizzare un software funzionante e di qualità, il prodotto finale deve poter essere *robusto* e *mantenibile* nel tempo.

A tal fine è necessario adottare un modello di lavoro basato su *procedure chiare*, capaci di guidare ogni attività in modo ordinato.

Seguendo lo standard *ISO/IEC 12207*, i processi primari principali si suddividono in:

- *Fornitura*: riguarda tutto ciò che serve per gestire il rapporto con la proponente esterna;
- *Sviluppo*: riguarda le attività pratiche per costruire il software vero e proprio.

== Processo di Fornitura
#v(0.5em)
Il processo di fornitura definisce le procedure che il gruppo *Coderius*, in qualità di fornitore, si impegna a seguire per gestire il rapporto con la proponente *BlueWind S.r.l.* durante tutto il ciclo di vita del progetto al fine di garantire la corretta fruizione del prodotto finale.

=== Attività previste
#v(0.5em)
Di seguito le principali attività comprese nel processo di fornitura:

- *Analisi del capitolato*: esame critico del documento di proposta per identificare requisiti e vincoli tecnici.
- *Studio di fattibilità*: valutazione della sostenibilità del progetto in termini di risorse, tempi e competenze tecniche.
- *Pianificazione*: organizzazione temporale delle attività e delle risorse, formalizzata nel *Piano di Progetto*.
- *Monitoraggio e Controllo*: verifica costante dell'avanzamento dei lavori e della qualità dei prodotti intermedi, anche a seguito di eventuali feedback da parte della proponente.
- *Rilascio e Accettazione*: procedure di consegna del software e della documentazione, con successiva validazione da parte della proponente.

=== Documentazione coinvolta
#v(0.5em)
Le attività legate al processo di fornitura si concretizzano nella redazione e nel continuo aggiornamento dei seguenti documenti:

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Norme di progetto*]),
    [*Redattore*], [Amministratore],
    [*Tipo di documento*], [Interno],
    [*Scopo*], [Definisce le regole operative, le convenzioni e gli standard tecnici che il gruppo deve adottare per garantire l'uniformità dei processi.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Piano di progetto*]),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [Stabilisce la pianificazione delle attività, la gestione delle risorse, l'analisi dei rischi e la ripartizione dei costi.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Piano di Qualifica*]),
    [*Redattore*], [Amministratore],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [Specifica gli obiettivi di qualità, le metriche di misurazione e i test necessari a validare il software e i documenti prodotti.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Analisi dei Requisiti*]),
    [*Redattore*], [Analista],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [Formalizza le necessità della proponente in una lista strutturata di requisiti funzionali, qualitativi e di vincolo.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Glossario*]),
    [*Redattore*], [Team (assegnazione dinamica)],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [Raccoglie la terminologia tecnica e i termini potenzialmente ambigui per assicurare una comprensione univoca di tutta la documentazione.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Verbali*]),
    [*Redattore*], [Team (assegnazione dinamica)],
    [*Tipo di documento*], [Esterno/Interno],
    [*Scopo*], [Documenti di coordinamento che registrano l'esito delle riunioni, l'assegnazione dei compiti interni e dei ruoli assegnati. Nel caso dei verbali esterni, hanno anche lo scopo di tracciare decisioni, risposte e vincoli concordati.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Lettera di candidatura*]),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [Documento per la richiesta formale da parte del gruppo di poter partecipare al capitolato scelto tramite la validazione dei capitolati.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Valutazione dei Capitolati*]),
    [*Redattore*], [Analista],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [Descrive l'analisi comparativa effettuata sulle diverse proposte per giustificare la scelta del capitolato finale.],
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
    table.header(table.cell(colspan: 2, fill:luma(230), align: center)[*Dichiarazione degli Impegni*]),
    [*Redattore*], [Responsabile],
    [*Tipo di documento*], [Esterno],
    [*Scopo*], [Documento formale in cui il gruppo presenta una stima dei costi del progetto e delle ore che verranno impiegate per il suo completamento. Vengono inoltre dichiarate le responsabilità assunte e la data di consegna prevista.],
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
Riguardano tutti i contatti ufficiali tra il gruppo *Coderius* e *BlueWind S.r.l.*.

- *Incontri (meeting)*: ogni incontro con la proponente deve essere documentato in un *verbale esterno*, denominato secondo il formato _VerbaleEsterno-AAAA-MM-GG_, che riporti le decisioni prese e i chiarimenti ottenuti.
- *Comunicazioni formali*: per l'invio di documenti e comunicazioni ufficiali si utilizza esclusivamente la posta elettronica.
- *Canali rapidi*: per chiarimenti immediati e coordinamento si utilizzano strumenti di messaggistica istantanea (Telegram), attraverso i quali la proponente condivide risorse tecniche di riferimento.

==== Comunicazioni interne
#v(0.5em)
Riguardano il coordinamento tra i membri del gruppo *Coderius*.

- *Incontri (meeting)*: ogni incontro tra i componenti del gruppo deve essere documentato in un *verbale interno*, denominato secondo il formato _VerbaleInterno-AAAA-MM-GG_, che riporti le decisioni prese e i compiti da svolgere.
- *Canali rapidi*: per il coordinamento e gli aggiornamenti si utilizzano strumenti di messaggistica istantanea (WhatsApp, Discord).

=== Strumenti a supporto
#v(0.5em)
Per il corretto svolgimento delle attività del processo di fornitura, il gruppo adotta i seguenti strumenti, distinguendoli in base all'ambito di utilizzo:

==== Strumenti di comunicazione con la proponente
#v(0.5em)
- *Gmail*: utilizzato per le comunicazioni formali e la convocazione dei meeting.
- *Telegram*: utilizzato per chiarimenti immediati.
- *Zoom*: utilizzato per lo svolgimento dei meeting programmati per tempo.

==== Strumenti per il gruppo
#v(0.5em)
- *GitHub*: utilizzato per il versionamento e la conservazione di tutto il materiale prodotto (codice e documentazione), garantendo la tracciabilità delle versioni e delle modifiche.
- *Discord / WhatsApp*: utilizzati per il coordinamento quotidiano e gli incontri tra i componenti del gruppo.
- *Google Docs*: utilizzato per la collaborazione in tempo reale, in particolare per attività di brainstorming e redazione condivisa (es. definizione delle domande per gli incontri con la proponente).

== Processo di Sviluppo
#v(0.5em)
Il processo di sviluppo comprende l'insieme delle attività tecniche e metodologiche necessarie alla realizzazione del prodotto software, a cominciare dall'#link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[#underline(text(fill: blue)[Analisi dei Requisiti])] fino alla consegna e alla verifica finale. L'obiettivo principale è garantire un ciclo di vita del software controllato, dove ogni fase contribuisce alla creazione di un sistema *robusto, sicuro, mantenibile nel tempo e conforme* alle specifiche della proponente.

=== Attività previste
#v(0.5em)
Di seguito vengono riportate le principali attività comprese nel processo di sviluppo:

- *Analisi dei Requisiti*: processo di individuazione, classification e formalizzazione delle necessità della proponente e dei vincoli normativi, comprensivo della definizione dei casi d'uso del sistema.
- *Progettazione dell'architettura*: definizione della struttura ad alto livello del sistema, con l'individuazione dei componenti principali e le loro interazioni.
- *Progettazione di dettaglio*: definizione specifica dei singoli componenti e delle logiche interne, propedeutica alla scrittura del codice.
- *Codifica*: implementazione del codice sorgente seguendo le convenzioni e gli standard di stile stabiliti dal gruppo in fase di progettazione.
- *Test e Integrazione*: attività volta a verificar il corretto funzionamento dei singoli componenti e la loro successiva combinazione, assicurando la coerenza e l'interoperabilità dell'intero sistema realizzato.

=== Analisi dei Requisiti
#v(0.5em)
Questa fase mira a definire con precisione cosa il software debba fare. Il gruppo adotta le seguenti procedure:

- *Analisi delle fonti*: studio del capitolato e della documentazione messa a disposizione dalla proponente al fine di estrarre i vincoli tecnici e normativi.
- *Individuazione dei casi d'uso (UC)*: descrizione delle interazioni tra gli attori e il software tramite diagrammi UML e scenari (principali o alternativi).
- *Classificazione dei requisiti*: ogni requisito viene catalogato come funzionale, di qualità, di vincolo o prestazionale.
- *Attribuzione della priorità*: a ogni requisito viene assegnata una priorità (obbligatorio, desiderabile o opzionale) e un identificativo univoco secondo una specifica nomenclatura.
- *Tracciamento*: associazione costante tra requisiti e casi d'uso per garantire che ogni necessità richiesta dal capitolato sia soddisfatta e che ogni caso d'uso non risulti superfluo.

==== Nomenclatura Casi D'uso
I casi d'uso sono identificati mediante la seguente convenzione:

#align(center, text(1.2em)[
  *UC-[IndiceRadice].[IndiceAnnidato]: Titolo*
])

Dove:
- *UC*: acronimo di *Use Case* (caso d'uso);
- *IndiceRadice*: numero progressivo che identifica un caso d'uso principale;
- *IndiceAnnidato*: numero crescente che indica la sottosezione di un particolare use case, può essere ulteriormente annidato per rappresentare livelli successivi;
- *Titolo*: nome assegnato a ogni use case per differenziarlo dagli altri e riassumerne lo scopo, migliorandone la leggibilità.

La combinazione tra *IndiceRadice* e *IndiceAnnidato* costituisce un identificativo univoco e non duplicabile.

*Esempio*:\
UC-4: Aggiunta nuovo dispositivo manuale;\
UC-4.1: Inserimento nome dispositivo;\
UC-4.2: Inserimento sistema operativo del dispositivo.

==== Nomenclatura Requisiti
Per i requisiti si utilizza la seguente nomenclatura:

#align(center, text(1.2em)[
  *R[Tipologia]-[Priorità][Codice]*
])

La dicitura ha questi significati:

- *[Tipologia]*: indica il tipo di requisito:
 - *F (Funzionale)*: descrive una funzionalità del sistema.
 - *Q (Qualitativo)*: descrive una caratteristica qualitativa del sistema.
 - *V (Vincolo)*: descrive un vincolo logico o normativo.
- *[Priorità]*: indica l’ordine di importanza dell’implementazione:
 - *Ob (Obbligatorio)*: requisito richiesto esplicitamente dalla proponente o necessario al funzionamento del sistema.
 - *D (Desiderabile)*: requisito che aumenta il valore del prodotto, ma non è indispensabile.
 - *Op (Opzionale)*: requisito da realizzare solo se il resto del lavoro è stato completato.
- *[Codice]*: numero progressivo intero che, insieme alla tipologia, costituisce un identificativo univoco dei requisiti.

*Esempio*:\
*RF-Ob01*: Il sistema deve permettere l'inserimento di un nuovo dispositivo all'interno della piattaforma.\
*RF-D03*: Il sistema deve permettere l'annullamento della procedura di eliminazione di un dispositivo durante la fase di richiesta di conferma.\
*RQ-Ob07*: La gestione del ciclo di vita del progetto e l'organizzazione delle attività del team devono adottare un approccio Agile, garantendo iterazioni regolari e flessibilità.

=== Documentazione coinvolta
All'inizio del nostro progetto didattico ci siamo resi conto che il lavoro non poteva procedere per tentativi o per una spartizione approssimativa dei compiti, soprattutto considerando il tempo più ridotto a disposizione per la suddivisione dei gruppi del II lotto.
#v(0.5em)

Le attività del processo di sviluppo sono supportate dalla documentazione definita in precedenza, ovvero *#link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[#underline(text(fill: blue)[Analisi dei Requisiti])], #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Progetto.pdf")[#underline(text(fill: blue)[Piano di Progetto])], #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Qualifica.pdf")[#underline(text(fill: blue)[Piano di Qualifica])] e #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[#underline(text(fill: blue)[Norme di Progetto])]*, integrata con specifiche riguardanti la codifica e le procedure di verifica.

=== Strumenti a supporto
#v(0.5em)
Per lo sviluppo, il gruppo utilizza strumenti mirati a garantire qualità, tracciabilità e collaborazione:

- *Linguaggio e Ambiente*: come linguaggio principale per lo sviluppo delle componenti software e delle logiche della normativa viene utilizzato Python 3.x;
- *Versionamento*: Git e GitHub per la gestione del repository, dei branch, dei commit, delle issue e delle pull request;
- *Automazione*: utilizzo di pipeline CI (Continuous Integration) tramite GitHub Actions per la generazione automatica e la successiva pubblicazione della documentazione di progetto.

==== Strumenti per la proponente
#v(0.5em)

- *Gmail*: utilizzato per comunicazioni formali, convocazione dei meeting;
- *Telegram*: utilizzato per chiarimenti immediati;
- *Zoom*: utilizzato per lo svolgimento dei meeting.

==== Strumenti per il gruppo
#v(0.5em)

- *Discord / WhatsApp*: utilizzati per il coordinamento quotidiano e incontri tra i componenti del gruppo;
- *Draw.io/PlantUML*: utilizzati per la realizzazione dei diagrammi UML che sono essenziali per l'analisi dei requisiti, in particolar modo per l'interpretazione dei casi d'uso.

=== Rapporti con la proponente
#v(0.5em)

La proponente *BlueWind S.r.l.* mette a disposizione del gruppo strumenti e momenti di confronto per agevolare lo sviluppo del progetto:

- *Canali di comunicazione*: un canale Telegram per comunicazioni rapide e informali, e l'invio di email tramite l'indirizzo del gruppo per chiarimenti tecnici e condivisione di documentazione ufficiale;
- *Incontri remoti*: la possibilità di organizzare meeting sulla piattaforma Zoom, a seguito dei quali il gruppo redigerà un *Verbale Esterno* per tracciare le decisioni prese;
- *Materiale di supporto*: la fornitura della documentazione tecnica relativa alla norma *EN 18031* e indicazioni sulle logiche dei *decision tree* da implementare.

Il gruppo *Coderius* si impegna a recepire i feedback ricevuti e a presentare un prodotto conforme ai requisiti concordati entro le scadenze prefissate.

=== Rapporti con il committente
#v(0.5em)
Il committente mette a disposizione strumenti di supporto e momenti di valutazione per monitorare la qualità dei processi e dei prodotti:

- *Ricevimenti e comunicazioni*: possibilità di richiedere incontri o inviare e-mail istituzionali per chiarire dubbi metodologici o riguardanti la gestione del progetto;
- *Diari di Bordo*: incontri periodici in cui il gruppo espone l'avanzamento dei lavori, le difficoltà riscontrate e le soluzioni adottate.

Il gruppo si impegna a partecipare alle milestone di avanzamento previste:

- *RTB (Requirements and Technology Baseline)*: momento di revisione che prevede la consegna della documentazione e la presentazione di un *Proof of Concept* (PoC) per dimostrare la fattibilità tecnica della soluzione scelta;
- *PB (Product Baseline)*: fase finale che prevede la consegna della documentazione tecnica completa e la presentazione dell'applicazione funzionante per la verifica della conformità allo standard *EN 18031*.
= Processi di Supporto
#v(0.5em)
La seguente sezione descrive i processi di supporto secondo lo standard *ISO/IEC 12207*, che hanno lo scopo di garantire una gestione efficace, il controllo e la qualità delle attività del ciclo di vita del progetto.

Nello specifico, vengono analizzati i seguenti processi di supporto:
- *Documentazione*;
- *Gestione delle configurazioni*;
- *Garanzia della qualità*;
- *Verifica*;
- *Validazione*.

== Documentazione
#v(0.5em)
Il processo di documentazione ha lo scopo di raccogliere, organizzare e gestire l'insieme dei documenti prodotti durante l'intero ciclo di vita del progetto. Non rappresenta una semplice attività di archiviazione, ma costituisce il fondamento per garantire la trasparenza, la manutenibilità e la continuità del lavoro tra i membri del gruppo.

Ogni attività, decisione tecnica o organizzativa deve essere formalizzata per permettere:
- *Tracciabilità*: ricostruire l'evoluzione del progetto e le motivazioni dietro ogni scelta architetturale o normativa.
- *Qualità*: assicurare che ogni documento prodotto rispetti gli standard definiti e sia sottoposto a verifica prima del rilascio.
- *Comunicazione*: facilitare lo scambio di informazioni tra i componenti del team e verso la proponente e il committente.

=== Tipologie di documenti
#v(0.5em)
Il gruppo ha definito dei template specifici per garantire l'uniformità e la professionalità della documentazione. I documenti che dispongono di una struttura predefinita sono:
- *Verbale interno*: resoconto delle riunioni di coordinamento del team.
- *Verbale esterno*: documentazione degli incontri con la proponente o il committente.
- *Diario di bordo*: documento informativo periodico sullo stato di avanzamento del progetto.

==== Verbali
#v(0.5em)
I verbali del gruppo Coderius seguono una struttura fissa per facilitare la reperibilità delle informazioni:
- *Frontespizio*: include il logo del gruppo, i dati di contatto (#link("mailto:coderius01@gmail.com")), la tipologia di documento, i riferimenti temporali (data, ora di inizio e fine), i riferimenti logistici (luogo o canale di comunicazione) della riunione e la versione più recente reperita dalla tabella di versionamento.
- *Tabella di versionamento*: riporta lo storico delle modifiche, indicando versione, data, autori, verificatori e descrizione dell'aggiornamento.
- *Indice*: elenco numerato delle sezioni per una navigazione rapida del documento.
- *Partecipanti*: lista dei membri del team presenti all'incontro.
- *Ordine del Giorno*: elenco sintetico dei punti che si intendono affrontare durante la seduta.
- *Svolgimento della Riunione*: discussione dettagliata di quanto anticipato nella sezione ordine del giorno e altre decisioni prese per l'avanzamento del progetto.
- *Conclusioni e Decisioni prese*: riassunto di quanto è stato discusso durante la riunione, sintetizzato in una tabella.
- *Ordine del giorno prossimo incontro*: anticipazione degli argomenti principali di cui discutere durante il successivo incontro.
- *TODO (Attività da svolgere)*: tabella riassuntiva che elenca i compiti assegnati in vista dell'incontro successivo.

#v(0.5em)
*Convenzioni di nomenclatura e codifica*
#v(0.5em)
Per garantire la tracciabilità tra discussioni e azioni, il gruppo adotta i seguenti formati:
- *Attività (TODO)*: identificate dal codice *TD-x.y* (dove _x_ è il numero progressivo del verbale e _y_ l'identificativo dell'attività).
- *Decisioni di riferimento*: collegate alle attività tramite il codice VI#sub[G]-x.y per i verbali interni (dove _G_ a pedice indica il riferimento al Glossario).
- *Date*: espresse nel formato *AAAA/MM/GG* per uniformità con il registro delle modifiche e gli standard internazionali.

==== Diario di bordo
#v(0.5em)
Questa tipologia di documento ha la funzione di monitorare periodicamente lo stato di avanzamento del lavoro da parte del gruppo con finalità prettamente informativa e didattica. La struttura dei Diari di Bordo si articola in tre punti chiave:
- *Risultati raggiunti*: elenco dettagliato delle attività portate a termine nel periodo di riferimento.
- *Attività future*: pianificazione dei task previsti per il prossimo sprint.
- *Difficoltà riscontrate*: esposizione di eventuali criticità o ostacoli emersi durante lo svolgimento del progetto.

==== Denominazione dei documenti
#v(0.5em)
Al fine di garantire un ordinamento cronologico intuitivo e una gestione efficiente dei file nel repository, il gruppo ha stabilito una nomenclatura standard basata sul formato *NomeDocumento-AAAA-MM-GG*. Nello specifico:
- *Verbali interni*: `VerbaleInterno-AAAA-MM-GG`.
- *Verbali esterni*: `VerbaleEsterno-AAAA-MM-GG`.
- *Diari di bordo*: `DiarioDiBordo-AAAA-MM-GG`.

=== Strumenti per la documentazione
#v(0.5em)
Per la redazione e la gestione della documentazione, il gruppo ha deciso di utilizzare i seguenti strumenti:
- *Typst*: è il principale linguaggio di markup utilizzato per l'intera documentazione di progetto. A differenza di sistemi più datati come LaTeX, Typst offre una compilazione istantanea e una sintassi più moderna e leggibile. Questo permette al gruppo di mantenere un alto standard qualitativo dei documenti, garantendo al contempo una maggiore velocità nella revisione dei contenuti e nella gestione dei template personalizzati.
- *GitHub*: rappresenta il fulcro del sistema di conservazione e controllo dei documenti. L'utilizzo di repository dedicate permette di tracciare ogni singola modifica tramite il versionamento del codice sorgente dei file `.typ`. Il gruppo sfrutta inoltre le seguenti funzionalità:
  - *Pull Request*: per gestire i processi di verifica e approvazione in modo strutturato prima dell'integrazione definitiva.
  - *GitHub Actions*: per automatizzare la generazione dei PDF a partire dai sorgenti Typst, garantendo che l'ultima versione prodotta sia sempre disponibile e correttamente formattata.
  - *Issue e Projects*: per la pianificazione dei task documentali e il monitoraggio delle scadenze.

=== Produzione
#v(0.5em)
Per la produzione di un documento il nostro gruppo opera nel seguente modo:
- *Creazione Issue e Branch dedicato*: inizialmente viene creata una issue su GitHub dal responsabile assegnato in quello sprint. In base all'importanza del documento, viene creato un relativo branch di feature per poterci lavorare senza influenzare il main. Se il documento da creare è invece di minore rilevanza, come un verbale, questo viene inserito nel branch apposito `feature/verbali`, il quale contiene al suo interno sia i verbali esterni sia quelli interni.
- *Stesura del documento*: il documento viene assegnato a uno o più membri del team che ricoprono il ruolo adatto per la stesura in quello specifico sprint.
- *Verifica del documento*: ogni volta che il documento viene aggiornato, quest'ultimo deve essere verificato da chi ricopre il ruolo di verificatore, il quale aggiornerà la tabella di versionamento inserendo il proprio nome e una breve descrizione delle modifiche apportate.
- *Approvazione e Merge*: una volta che il documento è concluso viene aperta una pull request su GitHub dal responsabile, inizialmente verso il branch develop e in seguito verso il main. Dal momento in cui il documento è presente nel branch main viene considerato concluso e, grazie all'automazione di GitHub Actions, il PDF viene generato e pubblicato automaticamente.

=== Manutenzione
#v(0.5em)
Nel caso in cui i documenti necessitino di modifiche a causa di eventuali errori presenti all'interno del loro contenuto, il gruppo segue i seguenti passaggi:

1. Creare un nuovo branch di lavoro dedicato per la correzione degli errori (es. `fix/norme-progetto`).
2. Apportare le modifiche necessarie in locale.
3. Integrare la tabella di versionamento dello specifico documento inserendo una nuova riga che spieghi l'intervento effettuato.
4. Effettuare il push sul branch di lavoro.
5. Aprire una Pull Request in modo tale che il documento aggiornato possa essere verificato dal membro del gruppo assegnato a tale attività.
6. Aggiungere il documento revisionato nel branch dedicato a quest'ultimo (es. `feature/norme-progetto`).

== Gestione della configurazione
#v(0.5em)
Questa sezione ha l'obiettivo di descrivere come il gruppo Coderius gestisce le componenti software e documentali nel progetto, al fine di garantire tracciabilità, coerenza e controllo delle modifiche.

=== Attività previste
#v(0.5em)
La gestione delle attività previste avviene nel seguente ordine:

- *Identificazione della configurazione*;
- *Controllo della configurazione*;
- *Rendicontazione dello stato della configurazione*;
- *Valutazione della configurazione*.

=== Identificazione della configurazione
#v(0.5em)
Secondo lo standard *ISO/IEC 12207:1995*, l'attività di identificazione della configurazione consiste nell'individuazione di tutti gli elementi del progetto, includendo sia le componenti software composte da codice sia l'intera parte documentale.

Questa attività viene effettuata durante la fase di progettazione per schematizzare l'architettura del software, la quale verrà in seguito implementata dagli sviluppatori.

=== Controllo della configurazione
#v(0.5em)
Per poter svolgere al meglio questa attività, il gruppo Coderius adotta i seguenti strumenti:

- *Pull Request*: permette al team di revisionare il lavoro svolto e verificarlo prima di effettuarne il merge nel branch di destinazione (`develop` o `main`). Questo processo viene seguito per ridurre al minimo il rischio di errori prima che un documento o codice sia considerato concluso.
- *Issue*: permettono di tracciare, gestire e pianificare le attività del progetto. Vengono aperte alla redazione di un nuovo documento o all'avvio di una funzionalità, in modo da poter assegnare il task ai membri del team preposti per quello sprint. Ogni issue presenta le seguenti caratteristiche:
  - È identificata all'interno di GitHub tramite la notazione `#NUMERO`, dove `NUMERO` rappresenta un identificativo univoco del repository.
  - Descrive l'attività da svolgere o la modifica richiesta.
  - Può essere assegnata a uno o più membri del team.
  - Viene aggiornata durante l'avanzamento delle attività fino alla sua chiusura definitiva.
- *Project Board*: è una tavola digitale  utilizzata per tracciare lo stato delle attività in tempo reale. Le colonne principali utilizzate sono:
  - *Backlog*: attività da pianificare e non ancora avviate.
  - *Ready*: attività pronte per essere sviluppate nello sprint corrente.
  - *In Progress*: attività attualmente in fase di sviluppo.
  - *In Review*: attività in fase di verifica e revisione.
  - *Done*: attività completate e integrate nel branch principale.

=== Rendicontazione dello stato della configurazione
#v(0.5em)
La rendicontazione dello stato della configurazione definisce le regole di versionamento dei file. Il gruppo ha adottato la codifica standard *MAJOR.MINOR.PATCH*:
- *MAJOR*: viene incrementata in caso di rilasci ufficiali del documento.
- *MINOR*: viene incrementata in caso di modifiche sostanziali, come l'aggiunta di nuove sezioni in un documento o di nuove funzionalità nel codice.
- *PATCH*: viene incrementata in caso di modifiche minori, correzioni di refusi o piccoli bug fix ortografici.

=== Valutazione della configurazione
#v(0.5em)
Questa attività serve a controllare che il software prodotto sia pienamente funzionale e completo rispetto ai requisiti individuati. Tale controllo viene garantito grazie a un tracciamento costante dei requisiti, formalizzato e aggiornato all'interno del documento #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[#underline(text(fill: blue)[Analisi dei Requisiti])].

=== Strumenti utilizzati
#v(0.5em)
Gli strumenti per la gestione della configurazione che il gruppo ha deciso di adottare sono i seguenti:
- *GitHub*: principale strumento per creare, modificare e gestire tutti i file legati al progetto. Permette inoltre di definire le milestone, assegnare i compiti e tracciare l'avanzamento del lavoro.
- *GitHub Pages*: servizio utilizzato per l'hosting del sito web del gruppo, direttamente connesso al repository principale. Il suo scopo è consentire un accesso facile e rapido alla proponente e ai committenti per la consultazione di tutta la documentazione prodotta in formato PDF.

== Garanzia della qualità
#v(0.5em)
Il gruppo implementa il processo di garanzia della qualità (_Quality Assurance_) con l'obiettivo di fornire evidenze concrete e verificabili che il prodotto software, i processi di sviluppo e tutta la documentazione prodotta siano conformi ai requisiti definiti, agli standard adottati e alle pianificazioni stabilite.

=== Attività previste
#v(0.5em)
Il processo di garanzia della qualità prevede le seguenti attività:

- *Implementazione del processo*: definizione e adozione delle metriche e delle procedure di qualità che verranno applicate durante l'intero ciclo di vita del progetto.
- *Controllo di processo*: verifica periodica che le attività svolte dai membri del gruppo siano aderenti alle procedure e agli standard stabiliti.
- *Accertamento del prodotto*: verifica costante che il prodotto software e la relativa documentazione rispettino i requisiti specifici e le convenzioni stabilite dal gruppo.
- *Valutazione oggettiva*: la verifica e garanzia della qualità, quando possibile, viene affidata a membri del team che non hanno partecipato attivamente alla stesura del documento o della porzione di codice in questione.

=== Linee guida
#v(0.5em)
Il processo di garanzia della qualità segue le seguenti linee guida:

- *Prevenzione prima della correzione*: il gruppo privilegia pratiche preventive, come revisioni e verifiche periodiche, rispetto alla correzione a posteriori delle anomalie.
- *Tracciabilità*: modifiche, verifiche e anomalie sono documentate e tracciate tramite gli strumenti adottati dal team.
- *Miglioramento continuo*: procedure e modalità operative vengono periodicamente rivalutate per migliorarne l'efficacia e l'efficienza.
- *Responsabilità condivisa*: la qualità del prodotto e della documentazione è una responsabilità condivisa da tutti i membri del gruppo.
- *Conformità agli standard*: ogni artefatto prodotto deve rispettare le convenzioni, i requisiti e gli standard definiti dal gruppo.

=== Ruoli
#v(0.5em)
Nella seguente tabella sono riportati i ruoli principali ed essenziali per garantire la qualità del prodotto e della documentazione di progetto:

#v(0.5em)
#align(center, table(
  columns: (30%, 70%),
  inset: 7pt,
  stroke: 0.5pt,
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  [*Ruolo*], [*Specifica*],
  [Responsabile], [Supervisiona le attività di garanzia della qualità e il rispetto degli standard definiti.],
  [Verificatore], [Esegue verifiche su documentazione, codice e artefatti prodotti.],
  [Amministratore], [Gestisce gli strumenti di automazione e supporto alle verifiche.],
  [Membro del gruppo], [Contribuisce al mantenimento della qualità seguendo le procedure e le convenzioni condivise.],
))

== Verifica
Il processo di verifica è tecnico e oggettivo; ha lo scopo di valutare e determinare se il lavoro svolto (codifica e documentazione prodotta) soddisfi i requisiti necessari e concordati con la proponente. L'obiettivo di questo processo è di dimostrare in modo oggettivo la correttezza del prodotto rispetto ai requisiti documentati nel capitolato di progetto e destinati all'utilizzo dell'utenza finale. Questo processo è continuo per la durata del progetto ed è definito nel #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Qualifica.pdf")[#underline(text(fill: blue)[Piano di Qualifica])].

=== Attività previste
#v(0.5em)

Secondo lo standard *ISO/IEC 12207:1995*, il processo di verifica prevede le seguenti attività:

- *Implementazione del processo*: questa attività consiste unicamente nel predisporre il piano di verifica che effettuerà il controllo del lavoro svolto. Consiste nell' individuare le criticità e i rischi di non conformità del progetto.

- *Verifica*: esecuzione di attività di controllo e revisione su documentazione, codice e altri artefatti presenti, al fine di individuare eventuali  non conformità e garantirne la correttezza;

=== Implementazione del processo
#v(0.5em)
La seguente attività ha come scopo principale l'individuazione delle criticità che possono sorgere durante la realizzazione del progetto. Per tutte le criticità che possono essere riscontrate è stata condotta un'analisi accurata nella sezione 3 del documento #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Progetto.pdf")[#underline(text(fill: blue)[Piano di Progetto])]. Questa analisi include anche: probabilità di occorrenza, gravità della criticità, strategie di mitigazione e di prevenzione.
=== Verifica
#v(0.5em)
Le attività di verifica vengono svolte tramite il sistema di _Pull Request_ adottato dal gruppo su GitHub.
Ogni modifica viene sottoposta a revisione prima dell'integrazione nel ramo principale del repository.

Per ciascuna Pull Request viene assegnato uno o più _reviewer_, a seconda di chi ricopre il ruolo di verificatore per lo sprint corrente, incaricato/i di controllare la conformità dell’artefatto rispetto ai requisiti, alle convenzioni e agli standard definiti.

Le attività di verifica vengono svolte da membri differenti dagli autori degli artefatti analizzati, così da garantire una valutazione quanto più oggettiva possibile.

==== Analisi statica
#v(0.5em)
L'analisi statica viene così definita in quanto non richiede l'esecuzione del programma esaminato. Il suo scopo è verificare la sintassi e correttezza del documento o codice in esame.

Questa analisi può essere effettuata attraverso i seguenti metodi:
- *Walkthrough*: metodo manuale che richiede un'analisi critica dell'intero file. Viene utilizzato principalmente quando si rileva un'anomalia di cui non si conosce l'esatta collocazione o causa. Questo approccio è dispendioso in termini di tempo e di costi; per questo motivo il team punta a utilizzarlo il meno possibile, preferendo verifiche automatizzabili.
- *Inspection*: metodo formalizzato e guidato da una checklist predefinita. Questa checklist ha lo scopo di individuare gli errori ricorrenti e verificare criteri di qualità specifici. Trattandosi di un metodo parzialmente automatizzabile e più strutturato, il gruppo predilige l'uso dell'inspection rispetto al walkthrough.

==== Analisi dinamica
#v(0.5em)
L'analisi dinamica, a differenza di quella statica, richiede l'esecuzione del programma per rilevare errori e anomalie nel comportamento a runtime.

Lo strumento principale di questa tecnica è il _test_, che per essere efficace deve rispettare due proprietà fondamentali: la ripetibilità, ovvero la capacità di produrre i medesimi esiti a parità di condizioni, e l'automatizzabilità, ovvero la possibilità di essere eseguito senza intervento manuale.

Queste proprietà sono essenziali per supportare i test di regressione: se un errore precedentemente risolto dovesse ripresentarsi, l'automazione permette di individuarlo tempestivamente e determinare quale modifica lo abbia reintrodotto.

== Validazione
#v(0.5em)
Il processo di validazione rappresenta la fase conclusiva attraverso cui si accerta che il prodotto sviluppato soddisfi i requisiti definiti dalla proponente e risponda correttamente agli obiettivi del progetto. La validazione ha lo scopo di verificare che il sistema realizzato sia conforme alle esigenze espresse nel capitolato e che le funzionalità implementate risultino adeguate al contesto applicativo finale.

Nel contesto del progetto, il soggetto di riferimento per l'accettazione e la validazione è l'azienda proponente, la quale certifica la conformità del software alle necessità operative emerse durante le attività di analisi.

=== Attività previste
#v(0.5em)
- *Implementazione del processo*: definisce le modalità operative attraverso cui viene accertata la conformità del prodotto rispetto ai requisiti specifici del capitolato e della documentazione di progetto.
  
  La validazione viene inoltre supportata dall'utilizzo del caso studio fornito dal proponente, così da verificare il comportamento del sistema in un contesto applicativo realistico e coerente con gli obiettivi del progetto. Gli esiti dei test svolti vengono tracciati nel #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Qualifica.pdf")[#underline(text(fill: blue)[Piano di Qualifica])].
- *Validazione*: ha lo scopo di accertare che il sistema sviluppato soddisfi i requisiti funzionali e gli obiettivi definiti nel capitolato di progetto.

  Le attività di validazione coinvolgono il ruolo di _Responsabile_, che controlla la correttezza funzionale delle componenti realizzate, con particolare attenzione all’esecuzione dei decision tree, alla gestione dei requisiti EN18031 e alla produzione degli esiti previsti (*PASS*, *FAIL*, *NOT APPLICABLE*).

= Processi Organizzativi
#v(0.5em)
== Introduzione ai processi organizzativi
#v(0.5em)
I processi organizzativi definiscono l'insieme delle attività e delle procedure adottate dal gruppo per coordinare il lavoro, gestire le risorse e garantire il corretto avanzamento del progetto durante l'intero ciclo di vita del software.

L'obiettivo principale di questi processi è garantire continuità operativa, collaborazione efficace tra i membri del gruppo e capacità di adattamento rispetto alle esigenze emerse durante lo sviluppo del progetto.

Nel contesto del progetto, i processi organizzativi riguardano in particolare:
- *Gestione del Processo*;
- *Gestione dell'Infrastruttura*;
- *Ottimizzazione del Processo*;
- *Formazione*.

== Gestione del processo
#v(0.5em)
La gestione del processo definisce le modalità con cui il gruppo pianifica, organizza e monitora le attività necessarie allo sviluppo del progetto.
L'obiettivo principale è garantire una distribuzione efficace del lavoro, il rispetto delle scadenze concordate e il controllo continuo dell'avanzamento delle attività.

=== Attività previste
#v(0.5em)
Le attività previste per la gestione  del processo sono le seguenti:
- *Definizione della metodologia di sviluppo*
- *Organizzazione del team e assegnazione dei ruoli*
- *Pianificazione delle milestone e degli sprint*
- *Gestione operativa delle attività*
- *Monitoraggio dell'avanzamento del progetto*
- *Gestione delle comunicazioni e della documentazione organizzativa*

=== Metodologia di sviluppo
#v(0.5em)
Il gruppo adotta un approccio di sviluppo Agile, basato su cicli iterativi e incrementali della durata di due settimane ciascuno, denominati sprint. Questa scelta nasce dalla natura del progetto, che richiede un confronto frequente con la proponente e comporta la necessità di affinare progressivamente l'interpretazione dei requisiti e delle soluzioni progettuali.

In particolare, il modello adottato si caratterizza per i seguenti aspetti:

- _Iterazioni brevi e cadenzate_: ogni sprint ha una durata fissa di due settimane, al termine delle quali il gruppo valuta i risultati ottenuti e pianifica le attività successive.
- _Sviluppo incrementale_: ogni sprint produce un incremento funzionante del sistema, riducendo il rischio di accumulare lavoro non verificato e rendendo più agevole il controllo della qualità nel tempo.
- _Adattabilità_: la struttura iterativa permette al gruppo di reagire tempestivamente a cambiamenti nei requisiti o a criticità emerse durante lo sviluppo, senza compromettere la stabilità complessiva del progetto.

=== Organizzazione del team e ruoli
#v(0.5em)
Ciascuno dei membri del gruppo ricopre un ruolo che varia a ogni sprint in base a un criterio di rotazione equo e distribuito. Questa scelta, oltre a essere un requisito del corso, garantisce che ogni membro acquisisca nel tempo una visione completa del progetto e del processo di sviluppo, riducendo la dipendenza da singole figure e favorendo una collaborazione più consapevole.

Di seguito vengono riportati i vari ruoli e vengono descritte le responsabilità associate a ciascuno di essi:

- *Responsabile*\
  Si occupa del monitoraggio delle risorse e gestisce le scadenze ed eventuali rischi. È il ruolo cruciale che autorizza il rilascio dei risultati prodotti, che siano parziali o finali. Il suo impegno è richiesto in maniera costante per l'intera fase di sviluppo progettuale.
- *Amministratore*\
  Assicura l'efficienza di procedure, strumenti e tecnologie a supporto del _Way of Working_ del team. La sua presenza è costante per l'intero progetto.
- *Analista*\
  Si occupa dell'intera analisi e stesura della documentazione relativa all'#link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[#underline(text(fill: blue)[Analisi dei Requisiti])], impegnandosi a determinare e soddisfare tutti i requisiti richiesti dalla proponente, affinché l'intero team riesca a operare in modo efficace.
- *Progettista*\
  Stabilisce la struttura del software, che costituirà il prodotto richiesto, definendo l'architettura dell'applicazione e la suddivisione tra i componenti Frontend e Backend.
- *Programmatore*\
  Rappresenta il ruolo cruciale nella fase di implementazione e codifica, in quanto si occupa di sviluppare il codice sorgente, collaborando con il _Progettista_ riguardo alle decisioni stabilite.
- *Verificatore*\
  Si occupa di accertare il rispetto delle norme di qualità per ogni prodotto intermedio e finale del progetto, dalla documentazione al codice sorgente. Pianifica ed esegue le procedure di test necessarie alla validazione del sistema, segnalando tempestivamente eventuali difetti o non conformità al fine di garantire la correttezza e l'affidabilità del prodotto sviluppato.

Pur essendo assegnati ruoli specifici per ciascuno sprint, le attività vengono svolte in modo collaborativo tra i membri del gruppo.

=== Pianificazione delle milestone
#v(0.5em)
Il progetto prevede diverse revisioni di avanzamento, il cui superamento consente al team di proseguire con le attività in modo supervisionato. In particolare, le due principali milestone, riportate in ordine cronologico, sono:

- *RTB (Requirements and Technology Baseline)*: fissa i requisiti da soddisfare in accordo con la proponente nella documentazione dedicata all'#link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[#underline(text(fill: blue)[Analisi dei Requisiti])], motiva le tecnologie adottate e ne dimostra l'adeguatezza e l'interoperabilità tramite il _Proof of Concept_.
- *PB (Product Baseline)*: vaglia la maturità della baseline architetturale del software e la sua effettiva realizzazione. Essa prevede l'integrazione dei seguenti elementi:
  - *Specifica Tecnica*: documentazione dedicata all'architettura logica del prodotto, strutturata per componenti, ruoli, connessioni e interazioni.
  - *Minimum Viable Product (MVP)*: approssima da vicino la soluzione finale tramite una versione preliminare ma funzionante, volta a ottenere la conferma ufficiale della conformità del sistema atteso.

=== Verbali
#v(0.5em)
Ogni riunione, sia essa interna al gruppo o esterna con la proponente, viene verbalizzata e documentata in appositi verbali redatti a rotazione da un membro del team, indipendentemente dal ruolo ricoperto nello sprint corrente.

Ogni verbale riporta la data, i partecipanti, gli argomenti discussi, le decisioni prese e le eventuali azioni da intraprendere, costituendo così una traccia formale e consultabile dell'avanzamento del progetto e delle scelte effettuate nel tempo.

=== Gestione degli sprint
#v(0.5em)
Il team adotta un approccio Agile per assicurare massima produttività e organizzazione operativa. Il lavoro viene strutturato in _sprint_ di durata bisettimanale, i quali prevedono una precisa sequenza di coordinamento:
- *Fase iniziale di pianificazione*: il team definisce gli obiettivi da raggiungere nel periodo di riferimento, suddividendoli in unità di lavoro specifiche (_issue_) e categorizzando ciascuna di esse in termini di priorità tramite apposite _label_ su GitHub.
- *Stato intermedio*: attraverso i canali di comunicazione stabiliti, i membri del gruppo si confrontano periodicamente per monitorare l'andamento dei task e risolvere eventuali blocchi operativi o criticità.
- *Valutazione e consuntivo*: al termine di ogni ciclo lavorativo viene effettuata un'analisi delle procedure adottate e dei traguardi raggiunti, procedendo alla chiusura delle _issue_ completate o alla rendicontazione di quelle rimaste in stato di _work in progress_ per la loro riprogrammazione.

=== Monitoraggio dell'avanzamento
#v(0.5em)
L'avanzamento operativo delle unità di lavoro (_issue_) viene monitorato e gestito attraverso una _Project Board_ in stile Kanban. Questo strumento permette di tracciare visivamente il ciclo di vita di ciascuna attività, la quale transita progressivamente attraverso le seguenti fasi:

- *Backlog*: fase iniziale in cui vengono inserite tutte le attività identificate e pianificate per il progetto, in attesa di essere assegnate a uno sprint specifico.
- *Ready*: raccoglie le attività selezionate e preparate per essere sviluppate durante lo sprint corrente.
- *In Progress*: indica che l'attività è stata presa in carico dal membro del team assegnato ed è attualmente in fase di sviluppo o redazione.
- *In Review*: fase in cui l'artefatto prodotto viene sottoposto a controllo da parte del _Verificatore_ per accertarne la qualità e la conformità agli standard.
- *Done*: fase di chiusura definitiva dell'attività, raggiungibile solo a seguito dell'approvazione del codice o del documento e della successiva integrazione nel ramo principale del repository da parte del _Responsabile_.
== Gestione dell'infrastruttura
#v(0.5em)
La gestione dell'infrastruttura ha lo scopo di definire, realizzare e mantenere nel tempo l'insieme delle infrastrutture, degli ambienti di lavoro e degli strumenti di supporto adottati dal gruppo durante l'intero ciclo di vita del progetto, garantendo che siano sempre adeguati alle esigenze operative e coerenti con il _Way of Working_ stabilito.

=== Attività previste
#v(0.5em)
Il processo di gestione dell'infrastruttura si articola nelle seguenti attività principali:
- *Gestione del repository e dei servizi di hosting*;
- *Configurazione degli ambienti di sviluppo*;
- *Automazione dei processi di integrazione e distribuzione*;
- *Gestione della disponibilità e conservazione dei dati*;
- *Gestione e aggiornamento dell'ambiente di lavoro*.

=== Repository e hosting
#v(0.5em)
Per la gestione centralizzata del codice e della documentazione viene utilizzato GitHub, adottando un modello ispirato a GitHub Flow che permette di mantenere un workflow semplice, ordinato e coerente con l'approccio Agile. Il modello è il seguente:

- *Struttura dei branch*: il ramo principale è rappresentato dal _main_, in cui vengono pubblicate la documentazione e la codifica verificate e definitive. Prima dell'integrazione, ogni modifica viene inserita nel branch di staging _develop_ per essere esaminata dal _Verificatore_, che effettua una revisione approfondita. Successivamente, il _Responsabile_ autorizza e procede con l'integrazione finale nel ramo principale.
- *Convenzione di denominazione*: per le varie operazioni e attività effettuate viene creato un branch dedicato che segue una struttura concordata dal team:
  - *feature/nome-feature* --- per lo sviluppo di nuove funzionalità;
  - *fix/nome-fix* --- per la correzione di bug o comportamenti anomali;
- *Revisione e merge*: l'integrazione del lavoro avviene in due fasi distinte, entrambe gestite tramite _Pull Request_. Nella prima fase, il branch di lavoro viene unito a _develop_, previa revisione e approvazione da parte del _Verificatore_. Una volta consolidato il lavoro su _develop_, viene aperta una seconda PR per l'integrazione definitiva su _main_, anch'essa soggetta alla supervisione del _Verificatore_ e approvata dal _Responsabile_ prima del merge.
- *Pipeline automatizzate*: sono configurate le _GitHub Actions_ per automatizzare le operazioni ripetitive, tra cui la compilazione dei documenti Typst in PDF e la loro pubblicazione sul sito web del progetto.

=== Infrastruttura di sviluppo
#v(0.5em)
L'infrastruttura di sviluppo comprende l'insieme degli strumenti, degli ambienti e delle configurazioni adottate dal gruppo per garantire un processo di sviluppo standardizzato, ripetibile e facilmente manutenibile nel tempo. In particolare, il team utilizza i seguenti strumenti:
- *Discord*: Canale vocale di comunicazione principale specialmente utilizzato per gli incontri interni e per la discussione in tempo reale di punti cruciali;
- *WhatsApp*: Canale di comunicazione rapido per messaggistica e brainstorming generale;
- *Zoom*: Strumento di comunicazione sfruttato per la discussione relativa ai _Diari di Bordo_ assieme al committente e le riunioni di allineamento con la proponente;
- *Typst*: Linguaggio di markup per la stesura e compilazione dell'intera documentazione prodotta nell'intero ciclo di vita del progetto;
- *Git*: Sistema di versionamento distribuito per codice e documentazione;
- *GitHub*: Piattaforma per la repository di gruppo, issue tracking system e integrazione continua;
- *Google Docs*: Sistema per la stesura di domande e brainstorming su tematiche affrontate durante gli incontri interni.
- *Python*: Linguaggio di programmazione utilizzato per alcune automazioni;
=== Infrastruttura di sviluppo
#v(0.5em)
L'infrastruttura di sviluppo comprende l'insieme degli strumenti, degli ambienti e delle configurazioni adottate dal gruppo per garantire un processo di sviluppo standardizzato, ripetibile e facilmente manutenibile nel tempo. In particolare, il team utilizza i seguenti strumenti:

- *Discord*: canale di comunicazione vocale e testuale principale, impiegato per gli incontri interni e il confronto in tempo reale sulle attività quotidiane;
- *WhatsApp*: canale di messaggistica istantanea per comunicazioni rapide, notifiche urgenti e brainstorming informale;
- *Zoom*: piattaforma di videoconferenza utilizzata per la discussione dei _Diari di Bordo_ con il committente e per le riunioni di allineamento con la proponente;
- *Typst*: linguaggio di markup e sistema di composizione editoriale utilizzato per la redazione e la compilazione della documentazione di progetto;
- *Git*: sistema di versionamento distribuito per il tracciamento delle modifiche a codice e documenti;
- *GitHub*: piattaforma per la repository di gruppo, issue tracking system e integrazione continua;
- *Google Docs*: sistema per la stesura di domande e brainstorming su tematiche affrontate durante gli incontri interni.
- *Python*: linguaggio di programmazione  utilizzato per lo sviluppo di script e alcune automazioni.

=== Gestione dell'ambiente di lavoro
#v(0.5em)
Mantenere l'infrastruttura e gli strumenti del progetto aggiornati e funzionanti è una responsabilità continua che accompagna l'intero ciclo di sviluppo. Lo scopo è preservare la continuità operativa e l'affidabilità dell'ambiente, assicurando che tutto resti coerente con gli standard stabiliti dal gruppo.

Gli interventi si distinguono in base alla loro natura:
+ *Interventi ricorrenti*: aggiornamenti e operazioni periodiche legate alla normale evoluzione delle attività;
+ *Interventi straordinari*: modifiche, aggiunte o rimozioni di strumenti, configurazioni o risorse rese necessarie da cambiamenti nei requisiti, criticità impreviste o decisioni organizzative non pianificate.

== Ottimizzazione del processo
#v(0.5em)
L'ottimizzazione del processo ha l'obiettivo di garantire che le modalità di lavoro adottate dal gruppo evolvano nel tempo, adattandosi alle esigenze emergenti e agli standard di qualità definiti. Anziché considerare il _Way of Working_ come qualcosa di fisso, il gruppo lo tratta come un elemento vivo: soggetto a osservazione, valutazione e revisione continua lungo l'intero ciclo di vita del progetto.

In questo senso, ogni fase di lavoro rappresenta un'occasione per individuare inefficienze, consolidare le pratiche più efficaci e introdurre correzioni mirate, con l'obiettivo di incrementare progressivamente sia la qualità dei risultati sia la sostenibilità del processo stesso.

=== Attività previste  
#v(0.5em)

L'ottimizzazione del processo si articola in tre attività principali:
- *Definizione delle procedure*: formalizzazione delle modalità operative adottate dal gruppo, con relativa documentazione nelle #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[#underline(text(fill: blue)[Norme di Progetto])] e nel _Way of Working_ stabilito.
- *Monitoraggio e valutazione*: osservazione continua dell'andamento delle attività attraverso retrospettive periodiche, analisi delle criticità emerse e valutazione delle metriche associate al processo.
- *Revisione e miglioramento*: identificazione delle aree di inefficienza e introduzione di correzioni mirate, aggiornando la documentazione ufficiale ogni qualvolta le procedure vengano modificate.

=== Retrospettive e revisione interna
#v(0.5em)
Al termine di ogni sprint il gruppo dedica un momento strutturato alla riflessione collettiva, finalizzato a valutare l'andamento del periodo appena concluso. In questa sede vengono analizzati gli obiettivi raggiunti, le difficoltà incontrate e le dinamiche di collaborazione emerse, con l'intento di trarre indicazioni concrete per lo sprint successivo.

Sebbene la conduzione di questi incontri mantenga un carattere flessibile per favorire il confronto aperto, la struttura segue una cadenza ricorrente che garantisce la partecipazione attiva di tutti i membri. Gli esiti della discussione vengono sintetizzati all'interno del relativo verbale.

=== Gestione delle criticità
#v(0.5em)
Quando si presenta una problematica che rischia di compromettere il regolare svolgimento delle attività, il gruppo segue un iter strutturato articolato nelle seguenti fasi:

+ *Identificazione*: la criticità viene rilevata e descritta in modo chiaro, specificandone il contesto e le attività coinvolte.
+ *Analisi*: si individuano le cause alla base del problema e si valuta l'impatto sulle tempistiche, sulle risorse e sulla qualità del progetto.
+ *Risposta*: in base alla natura e all'urgenza, il gruppo definisce le azioni correttive più appropriate, che possono includere la ridistribuzione dei compiti, la revisione delle stime, l'aggiornamento degli strumenti o la modifica delle procedure coinvolte.
+ *Tracciamento*: ogni criticità rilevante viene registrata e monitorata fino alla sua risoluzione, al fine di prevenire il ripresentarsi di situazioni analoghe.

=== Aggiornamento delle procedure
#v(0.5em)
Le norme e le procedure adottate dal gruppo non sono considerate definitive. Infatti, possono essere riviste e aggiornate in qualsiasi momento del progetto, qualora emerga la necessità di adeguarle a nuove esigenze operative o di correggere aspetti risultati inefficaci nella pratica. \
A tal fine, la documentazione ufficiale viene costantemente revisionata e aggiornata per risultare costantemente valida e affidabile in termini di procedure seguite dal gruppo.

== Formazione
#v(0.5em)
Il gruppo riconosce la formazione come una componente attiva del progetto, rifiutando l'idea che si tratti di un'attività puramente accessoria. Acquisire una solida padronanza degli strumenti, dei linguaggi e delle pratiche concordate è una condizione necessaria per operare in modo autonomo ed efficace; per questo motivo, tale processo viene gestito con il medesimo rigore riservato alle fasi di sviluppo e documentazione.

=== Attività previste
#v(0.5em)
Il processo di formazione si articola in tre attività principali:
- *Studio individuale delle tecnologie*: ogni membro è responsabile dell'acquisizione delle competenze necessarie allo svolgimento dei propri compiti, facendo riferimento alla documentazione ufficiale e alle risorse condivise dal gruppo.
- *Condivisione delle conoscenze*: le competenze acquisite vengono messe a disposizione del team attraverso momenti di confronto, documentazione interna e supporto diretto tra membri.
- *Supporto reciproco*: nei casi in cui un membro incontri difficoltà tecniche o operative, il gruppo interviene attivamente per favorire il superamento del blocco, evitando che le criticità individuali rallentino l'avanzamento collettivo.

=== Condivisione delle conoscenze
#v(0.5em)
La condivisione delle conoscenze avviene in modo informale ma strutturato: quando un componente del team acquisisce competenze rilevanti per il progetto, è tenuto a renderle accessibili al resto del gruppo. Questo flusso informativo si appoggia alle piattaforme di comunicazione stabilite, come WhatsApp per le notifiche rapide e Discord per sessioni di allineamento vocale o di condivisione dello schermo.

L'obiettivo principale non è la produzione di documentazione formativa esaustiva, bensì l'abbattimento della soglia d'ingresso operativo per chi si trova ad affrontare per la prima volta uno strumento o una tecnologia già appresi da altri membri.

=== Studio delle tecnologie
#v(0.5em)
Ciascun membro è responsabile dello studio autonomo delle tecnologie assegnate al proprio ambito di lavoro. Come riferimento principale viene utilizzata la documentazione ufficiale dei singoli strumenti, integrata da risorse aggiuntive individuate in autonomia:
- #link("https://typst.app/docs/")[*Typst Documentazione Ufficiale*;]
- #link("https://docs.python.org/3/")[*Python Documentazione Ufficiale*;] #nota[(Riferimento alla versione: 3.14.5)]
- #link("https://react.dev/")[*React Documentazione ufficiale*;]
- #link("https://flask.palletsprojects.com/en/stable/")[*Flask Framework*.]

Il percorso di apprendimento non segue una struttura rigida: ogni membro organizza lo studio in base ai propri tempi e alle scadenze del progetto, segnalando eventuali difficoltà al resto del gruppo qualora queste possano impattare sulle attività pianificate.

=== Supporto tra membri del gruppo
#v(0.5em)
Quando un membro del gruppo si trova in difficoltà, sia in fase di apprendimento sia durante lo svolgimento delle attività, gli altri intervengono per fornire supporto diretto. Questo avviene principalmente attraverso le riunioni interne; tuttavia, in caso di blocchi critici che ostacolano il proseguimento delle attività, vengono organizzate sessioni di lavoro condivise in cui uno o più membri si rendono disponibili per un incontro straordinario, così da far fronte insieme alle difficoltà riscontrate.

Il supporto reciproco non è considerato un'eccezione, bensì parte integrante del _Way of Working_ del gruppo: distribuire le competenze in modo omogeneo riduce le dipendenze dai singoli e aumenta la resilienza del team nel suo complesso.

= Metriche della qualità
== Introduzione alle metriche della qualità

Al fine di garantire un approccio quantitativo alla qualità, il gruppo adotta un sistema di misurazione basato su metriche. Queste rappresentano i criteri oggettivi attraverso i quali viene valutata l'aderenza dei processi e dei prodotti agli standard prefissati.

Le metriche definite in questo documento trovano applicazione e tracciamento operativo all'interno del  *#link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Qualifica.pdf")[#underline(text(fill: blue)[Piano di Qualifica])]*.

=== Classificazione
Le metriche sono suddivise in due categorie principali, ispirate allo standard ISO/IEC 9126:

1. *Metriche di Qualità di Processo (MPC)*: indicatori utilizzati per monitorare l'andamento delle attività di progetto, l'efficienza del team e la gestione delle risorse (es. costi, tempi, stabilità dei requisiti).
2. *Metriche di Qualità di Prodotto (MPD)  *: indicatori focalizzati sulle caratteristiche degli artefatti prodotti, siano essi documentali o software.

=== Obiettivi per la Qualità di Prodotto
Il gruppo adotta il modello *ISO/IEC 9126* per definire gli obiettivi di qualità, declinando le sei caratteristiche principali in sotto-attributi misurabili.

#let sotto-attributi(..elementi) = {
  set list(indent: 1.5em)
  list(..elementi)
}

==== Funzionalità
Valuta la capacità del software di soddisfare le necessità definite dal proponente.
#sotto-attributi(
  [*Adeguatezza*: capacità di svolgere compiti specifici in linea con gli scopi del progetto.],
  [*Accuratezza*: precisione nel fornire risultati conformi ai requisiti definiti.],
  [*Interoperabilità*: abilità del sistema di scambiare informazioni con componenti esterni.],
  [*Sicurezza*: grado di protezione dell'integrità dei dati contro accessi non autorizzati.],
  [*Conformità*: rispetto degli standard di dominio e delle specifiche funzionali.]
)

==== Affidabilità
Misura la stabilità operativa del prodotto in condizioni d'uso standard.
#sotto-attributi(
  [*Maturità*: capacità di prevenire malfunzionamenti derivanti da errori logici.],
  [*Tolleranza agli errori*: resilienza del sistema di fronte a input errati o anomalie operative.],
  [*Recuperabilità*: efficacia delle procedure di ripristino post-guasto.],
  [*Aderenza*: rispetto di regole di progettazione finalizzate alla continuità del servizio.]
)

==== Efficienza
Analizza il rapporto tra le prestazioni del sistema e le risorse computazionali consumate.
#sotto-attributi(
  [*Comportamento temporale*: velocità di risposta del sistema alle richieste dell'utente.],
  [*Utilizzo delle risorse*: gestione ottimizzata di memoria, CPU e banda di rete.],
  [*Conformità*: rispetto dei vincoli architetturali e di performance.]
)

==== Usabilità
Indaga la facilità con cui l'utente finale interagisce con il prodotto.
#sotto-attributi(
  [*Comprensibilità*: immediatezza concettuale delle interfacce.],
  [*Apprendibilità*: curva di apprendimento necessaria per padroneggiare le funzionalità.],
  [*Operabilità*: controllo fluido e intuitivo dei flussi di lavoro.],
  [*Attrattività*: qualità estetica e gratificazione dell'esperienza utente.],
  [*Conformità*: aderenza alle linee guida di usabilità stabilite nelle NdP.]
)

==== Manutenibilità
Descrive la facilità di evoluzione del sistema nel tempo.
#sotto-attributi(
  [*Analizzabilità*: facilità con cui è possibile diagnosticare la causa di un difetto.],
  [*Modificabilità*: agilità nell'integrare nuove feature o aggiornare quelle esistenti.],
  [*Stabilità*: resistenza del software all'introduzione di effetti collaterali a seguito di modifiche.],
  [*Testabilità*: efficacia delle procedure di verifica nel validare le modifiche apportate.]
)

==== Portabilità
Valuta la flessibilità del software in ambienti eterogenei.
#sotto-attributi(
  [*Adattabilità*: possibilità di configurazione in contesti operativi differenti.],
  [*Installabilità*: semplicità della procedura di deploy del software.],
  [*Conformità*: rispetto di standard di cross-platform.],
  [*Sostituibilità*: facilità di sostituzione del sistema nel caso di migrazioni tecnologiche.]
)

=== Nomenclatura e Struttura
Per garantire l'univocità e la reperibilità, ogni metrica deve essere definita secondo il seguente formato:

#align(center)[
  *M[TIPO]-[ID]*
]

- *M*: prefisso costante per "Metrica";
- *[TIPO]*: identificatore della categoria (*PC* per Processo, *PD* per Prodotto);
- *[ID]*: numero progressivo a due cifre (es. 01, 02).

Per ogni metrica, il gruppo deve definire:
- *Nome e Identificativo*;
- *Descrizione*: scopo della misurazione;
- *Formula di calcolo*: metodo matematico per ottenere il valore;
- *Soglia di Accettabilità*: valore minimo per considerare il requisito soddisfatto;
- *Soglia di Ottimalità*: valore target per un prodotto di eccellenza.

== Metriche di Qualità del Processo
#let metrica(id, nome, formula, desc) = {
  block(width: 100%, breakable: false, [
    #table(
      columns: (3cm, 1fr),
      stroke: 0.5pt,
      fill: (x, y) => if x == 0 {luma(230) } else { none },
      inset: 8pt,
      [*Metrica*], [*#id - #nome*],
      [*Descrizione*], [#desc],
      [*Formula*], [#align(center)[#formula]],
    )
    #v(0.5em)
  ])
}

=== Processi Primari
I processi primari comprendono tutte le attività legate direttamente al ciclo di vita del prodotto software. Per valutarne l'andamento, l'efficienza e la conformità agli obiettivi prefissati, vengono utilizzate metriche quantitative in grado di monitorare l'avanzamento dei lavori, l'allocazione delle risorse e la qualità di ciò che viene prodotto.\ L'analisi di questi indicatori consente di individuare eventuali scostamenti e applicare correzioni mirate per garantire il rispetto dei vincoli di progetto.

#metrica(
  "MPC-01", "Planned Value (PV)", 
  $ "PV" = "BAC" * % "lavoro pianificato" $, 
  "Valore del lavoro pianificato da completare entro una determinata data."
)

#metrica(
  "MPC-02", "Earned Value (EV)", 
  $ "EV" = "BAC" * % "lavoro completato" $, 
  "Valore del lavoro effettivamente completato in  conformità con il budget previsto."
)

#metrica(
  "MPC-03", "Actual Cost (AC)", 
  $ "AC" = sum "costi sostenuti" $, 
  "Costo totale effettivamente sostenuto fino alla data corrente."
)

#metrica(
  "MPC-04", "Schedule Performance Index (SPI)", 
  $ "SPI" = "EV" / "PV" $, 
  "Indica l'efficienza temporale. Se < 1, il progetto è in ritardo."
)

#metrica(
  "MPC-05", "Cost Performance Index (CPI)", 
  $ "CPI" = "EV" / "AC" $, 
  "Indica l'efficienza economica. Se < 1, il progetto è fuori budget."
)

#metrica(
  "MPC-06", "Estimate at Completion (EAC)", 
  $ "EAC" = "BAC" / "CPI" $, 
  "Proiezione del costo totale finale basata sulla performance attuale."
)

#metrica(
  "MPC-07", "Estimate to Complete (ETC)", 
  $ "ETC" = "EAC" - "AC" $, 
  "Costo stimato necessario per completare il lavoro rimanente."
)

#metrica(
  "MPC-08", 
  "Requirements Stability Index (RSI)", 
  [
    #$ "RSI" = ("NRI" - ("NC" + "NRC" + "NRA")) / "NRI" $
    #v(0.8em)
    #set text(size: 0.85em)
    #align(left)[
      *Legenda dei  parametri:* \
      - *NRI*: Numero Requisiti Iniziali \
      - *NC*: Numero di Cambiamenti \
      - *NRC*: Numero di Requisiti Cancellati \
      - *NRA*: Numero di Requisiti Aggiunti
    ]
  ], 
  "Misura la stabilità dei requisiti nel tempo, valutando l'impatto di modifiche, cancellazioni o aggiunte rispetto al set iniziale."
)

=== Processi di Supporto
I processi di supporto raccolgono tutte le attività che servono a tenere sotto controllo il ciclo di sviluppo, garantendone tracciabilità e affidabilità nel tempo.
Il loro scopo principale è seguire l'andamento dei lavori così da individuare tempestivamente eventuali scostamenti rispetto a quanto pianificato, e poterli correggere prima che diventino critici.

#metrica(
  "MPC-09", "Indice di Gulpease", 
  [
    #$ "IG" = 89 + (300 * "NF" - 10 * "NL") / "NP" $
    #v(0.8em)
    #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NF*: Numero di Frasi \
      - *NL*: Numero di Lettere \
      - *NP*: Numero di Parole
    ]
  ], 
  "Valuta la leggibilità di un testo in lingua italiana. Un indice basso indica un testo troppo complesso per il target di riferimento."
)

#metrica(
  "MPC-10", "Correttezza Ortografica", 
  [
    #$ "CO" = 1000 * ("NE" / "NP") $
    #v(0.8em)
    #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NE*: Numero di Errori ortografici \
      - *NP*: Numero di Parole
    ]
  ], 
  "Rileva la densità di errori linguistici nei documenti. Il calcolo viene normalizzato su 1000 parole per facilitare il confronto tra documenti di diversa lunghezza."
)

#metrica(
  "MPC-11", "Test Success Rate", 
  [
    #$ "TSR" = ("NTS" / "NTT") * 100 $
    #v(0.8em)
    #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NTS*: Numero di Test Superati \
      - *NTT*: Numero Totale dei Test eseguiti
    ]
  ], 
  "Indica la percentuale di test automatizzati che hanno prodotto un esito positivo rispetto al totale dei test previsti."
)

#metrica(
  "MPC-12", "Code Coverage", 
  [
    #$ "CC" = ("NLT" / "NLTOT") * 100 $
    #v(0.8em)
    #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NLT*: Numero di linee di codice testate \
      - *NLTOT*: Numero di linee di codice totali
    ]
  ], 
  "Indica la percentuale di linee di codice sorgente effettivamente eseguite durante l'esecuzione della suite di test automatizzati."
)

#metrica(
  "MPC-13", "Quality Metrics Satisfied", 
  [
    #$ "QMS" = ("NMS" / "NMT") * 100 $
    #v(0.8em)
    #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NMS*: Numero di Metriche Soddisfatte \
      - *NMT*: Numero di Metriche Totali monitorate
    ]
  ], 
  "Rappresenta la percentuale complessiva delle metriche di qualità che rientrano nei range accettabili definiti nelle presenti Norme."
)
=== Processi Organizzativi
Questi processi riguardano la dimensione organizzativa del gruppo: dalla definizione degli standard interni alla gestione della qualità, dallo sviluppo delle competenze al miglioramento continuo. Le metriche associate misurano conformità ed efficacia dei processi di governance, con l'obiettivo di garantire la sostenibilità e la maturità del modello di sviluppo nel tempo.

#metrica(
  "MPC-14", "Time Efficiency", 
  [
    #$ "TE" = ("OPC" / "OEC") * 100 $
    #v(0.8em)
    #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *OPC*: Ore Previste Cumulative (pianificate) \
      - *OEC*: Ore Effettive Cumulative (impiegate realmente)
    ]
  ], 
  "Indica il rapporto tra il tempo pianificato e quello effettivamente consumato. Un valore inferiore al 100% segnala che il team sta impiegando più tempo del previsto per le attività."
)

#metrica(
  "MPD-01", "Requisiti Obbligatori Soddisfatti", 
  [#$ "RObbS" = ("NRObS" / "NROb") * 100 $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NROS*: Numero Requisiti Obbligatori Soddisfatti \
      - *NRO*: Numero Totale Requisiti Obbligatori
    ]
  ], 
  "Indica la percentuale di requisiti essenziali implementati correttamente. È un indicatore critico per il rilascio del prodotto."
)

#metrica(
  "MPD-02", "Requisiti Desiderabili Soddisfatti", 
  [#$ "RObbS" = ("NRDS" / "NRD") * 100 $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NROS*: Numero Requisiti Desiderabili Soddisfatti \
      - *NRO*: Numero Totale Requisiti Desiderabili
    ]
  ], 
  "Indica la percentuale di requisiti essenziali implementati correttamente. È un indicatore critico per il rilascio del prodotto."
)

#metrica(
  "MPD-03", "Requisiti Opzionali Soddisfatti", 
  [#$ "RObbS" = ("NROpS" / "NROp") * 100 $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NROS*: Numero Requisiti Opzionali Soddisfatti \
      - *NRO*: Numero Totale Requisiti Opzionali
    ]
  ], 
  "Indica la percentuale di requisiti essenziali implementati correttamente. È un indicatore critico per il rilascio del prodotto."
)

=== Affidabilità

#metrica(
  "MPD-04", "Failure Density", 
  [#$ "FD" = "NF" / "KLOC" $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NF*: Numero di Failure rilevate \
      - *KLOC*: Migliaia di Linee di Codice
    ]
  ], 
  "Misura la densità di guasti del sistema rispetto alla dimensione del codice sorgente."
)

#metrica(
  "MPD-05", "Statement Coverage", 
  [#$ "SC" = ("IT" / "ITOT") * 100 $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *IT*: Istruzioni Testate dai test automatizzati \
      - *ITOT*: Istruzioni Totali nel codice
    ]
  ], 
  "Percentuale di istruzioni del codice sorgente coperte dall'esecuzione dei test."
)

#metrica(
  "MPD-06", "Branch Coverage", 
  [#$ "SC" = ("IT" / "ITOT") * 100 $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *IT*: Istruzioni Testate dai test automatizzati \
      - *ITOT*: Istruzioni Totali nel codice
    ]
  ], 
  "Percentuale di rami del codice che sono coperti da Test automatizzati"
)

=== Usabilità

#metrica(
  "MPD-07", "Error Rate", 
  [#$ "ER" = ("NET" / "NAT") *100 $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NET*: Numero di Errori Totali
      - *NAT*: Numero di Azioni Totali
    ]
  ], 
  "Percentuale di errori rispetto al numero di azioni"
)

#metrica(
  "MPD-08", "Time To Complete Task", 
  [#$ "TCT" = ("TO" + 4 * "TP" + "TPes") / 6 $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *TO*: Tempo Ottimista \
      - *TP*: Tempo Probabile \
      - *TPes*: Tempo Pessimista
    ]
  ], 
  "Stima il tempo medio necessario a un utente per completare correttamente un'operazione specifica."
)

=== Efficienza

#metrica(
  "MPD-09", "Response Time", 
  [$ "RT" <= t $], 
  "Tempo impiegato dal sistema per fornire una risposta a seguito di un input dell'utente."
)

=== Manutenibilità

#metrica(
  "MPD-10", "Coefficient of Coupling", 
  [#$ "COC" = "ND"/"NC" $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *COC*: Coefficient of Coupling
      - *ND*: Numero di Dipendenze
      - *NC*: Numero di Componenti
    ]
  ], 
  "Numero di dipendenza tra i componenti del sistema"
)

#metrica(
  "MPD-11", "Cyclomatic Complexity", 
  [#$ v(G) = E - N + 2P $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *E*: Numero di archi del grafo di controllo \
      - *N*: Numero di nodi del grafo \
      - *P*: Numero di componenti connesse
    ]
  ], 
  "Quantifica la complessità logica del codice contando il numero di percorsi indipendenti."
)

#metrica(
  "MPD-12", "Instability Index", 
  [#$ I = "Ce" / ("Ce" + "Ca") $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *Ce*: Classi esterne da cui il modulo dipende (Efferent) \
      - *Ca*: Classi esterne che dipendono dal modulo (Afferent)
    ]
  ], 
  "Misura la resilienza di un modulo al cambiamento. Un valore vicino a 0 indica massima stabilità."
)

#metrica(
  "MPD-13", "Code Smell", 
  [#$ "CS" = "NCS" / "KLOC" $
    #v(0.8em) #set text(size: 0.85em)
    #align(left)[
      *Legenda:* \
      - *NCS*: Numero di Code Smell rilevati \
      - *KLOC*: Migliaia di Linee di Codice
    ]
  ],
  "Indica la densità di potenziali problemi di design o violazioni delle best practice di codifica."
)