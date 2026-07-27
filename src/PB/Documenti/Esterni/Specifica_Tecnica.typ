#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Piano di Progetto], align(right)[Coderius Group],
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  },
)

#set text(font: "Libertinus Serif", size: 12pt, lang: "it")

#set heading(numbering: "1.")

#let scheda-rischio(id, nome, tipo, prob, impatto, prevenzione, risposta) = {
  set text(size: 11pt)
  block(
    width: 100%,
    stroke: 0.5pt + luma(100),
    inset: 0pt,
    clip: true,
    table(
      columns: (5.5cm, 1fr),
      stroke: (x, y) => (
        bottom: 0.5pt + luma(100),
        right: if x == 0 { 0.5pt + luma(10) } else { none },
      ),
      inset: (x: 10pt, y: 7pt),
      fill: (x, _) => if x == 0 { luma(240) } else { none },
      [*Codice*], [#id],
      [*Denominazione*], [#nome],
      [*Categoria*], [#tipo],
      [*Probabilità*], [#prob],
      [*Impatto*], [#impatto],
      [*Prevenzione*], [#prevenzione],
      [*Piano di risposta*], [#risposta],
    ),
  )
  v(0.8em)
}

#let tabella-ore(rows, caption-text: none) = {
  let role-header(name) = rotate(-60deg, reflow: true)[#name]
  figure(
    table(
      columns: (1.6fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, auto),
      align: (left, center, center, center, center, center, center, center),
      stroke: 0.5pt + luma(100),
      table.header(
        [*Componente*],
        role-header[*Responsabile*],
        role-header[*Amministratore*],
        role-header[*Analista*],
        role-header[*Progettista*],
        role-header[*Programmatore*],
        role-header[*Verificatore*],
        role-header[*Totale*],
      ),
      ..rows.flatten(),
    ),
    caption: caption-text,
  )
}

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Specifica Tecnica]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
  #v(4em)
  #text(size: 20pt)[*Versione 0.1.0*]
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
    [0.2.0], [2026/07/27], [Alberto Canavese], [], [Stesura della sezione 1],
    [0.2.0], [2026/07/27], [Giovanni Bronte], [], [Stesura della sezione 2],
    [0.1.0], [2026/07/21], [Giovanni Bronte], [], [Prima stesura del documento],
  )
]
#pagebreak()
#show outline.entry.where(level: 1): set block(above: 1.5em)
#show link: underline;
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 3)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)


= Introduzione

== Scopo del documento
La presente documentazione è redatta con il fine di illustrare in modo esaustivo l'architettura, sia logica che infrastrutturale, del sistema concepito dal *Coderius Group*. La *Specifica Tecnica* si pone come linea guida vincolante per l'intera fase di implementazione, fungendo da ponte tra l'analisi dei requisiti e la realizzazione concreta del software, per assicurarne solidità e coerenza strutturale.

Nel dettaglio, gli obiettivi preposti per questo documento sono:
- *Motivare l'infrastruttura tecnologica:* argomentare le ragioni dietro la scelta degli strumenti di sviluppo (inclusi Python, React, Flask e Vite), selezionati per rispondere appieno ai criteri di flessibilità, performance e scalabilità richiesti dal progetto.
- *Strutturare la logica applicativa e i design pattern:* mappare l'organizzazione interna dei moduli e i loro flussi di comunicazione, dimostrando come i pattern implementati favoriscano la creazione di codice disaccoppiato e orientato al testing.
- *Pianificare la strategia di deployment:* definire le modalità di distribuzione dell'applicativo e l'allocazione delle sue parti all'interno degli ambienti operativi, sfruttando la containerizzazione offerta da Docker.
- *Promuovere la manutenibilità a lungo termine:* fornire direttive chiare al team di sviluppo per rendere la base di codice facilmente interpretabile, supportando così agevolmente le future iterazioni, correzioni ed espansioni del sistema.

== Scopo del prodotto
Il prodotto mira ad automatizzare e digitalizzare il processo di verifica della conformità alla normativa di sicurezza EN 18031, come richiesto dal capitolato *Automated EN18031 Compliance Verification* proposto da Bluewind S.r.l. L'obiettivo è sostituire le attuali procedure manuali, spesso dispendiose in termini di tempo e soggette a errore umano, con una soluzione software moderna ed efficiente.

Il sistema permetterà di valutare sistematicamente i requisiti di sicurezza per i dispositivi, elaborando esiti certi e tracciabili attraverso l'esecuzione di alberi decisionali. Tramite un'interfaccia utente web fluida e reattiva, il prodotto finale ottimizzerà i tempi operativi della proponente, garantendo al contempo un elevato standard di affidabilità nella validazione dei dati.

== Glossario
Al fine di evitare ambiguità e incomprensioni legate alla terminologia tecnica presente in questo documento e nel resto della documentazione prodotta dal Coderius Group, è stato redatto un apposito glossario. 
Ogni termine tecnico o di dominio che necessita di ulteriori chiarimenti è contrassegnato nel testo da una "G" a pedice (es. _termine_#sub[G]). Cliccando sull'indicatore, il lettore verrà reindirizzato direttamente alla definizione corrispondente all'interno del documento #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Glossario.pdf")[*Glossario*].

== Riferimenti

=== Riferimenti normativi
- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[*Capitolato d'appalto C1:* _Automated EN18031 Compliance Verification_ - Bluewind S.r.l.]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[*Norme di Progetto:* Coderius Group]
- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[*Regolamento del progetto didattico:* Corso di Ingegneria del Software]

=== Riferimenti informativi
- *Materiale didattico del corso di Ingegneria del Software:*
  - #link("https://www.math.unipd.it/~rcardin/swea/2023/Diagrammi%20delle%20Classi.pdf")[Diagrammi delle Classi]
  - #link("https://www.math.unipd.it/~rcardin/swea/2022/Software%20Architecture%20Patterns.pdf")[Pattern Architetturali]
  - #link("https://www.math.unipd.it/~rcardin/swea/2022/Design%20Pattern%20Creazionali.pdf")[Pattern Creazionali]
  - #link("https://www.math.unipd.it/~rcardin/swea/2022/Design%20Pattern%20Strutturali.pdf")[Pattern Strutturali]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T06.pdf")[Progettazione Software]
- *Documentazione delle tecnologie:*
  - *Python:* #link("https://docs.python.org/3/")
  - *JavaScript:* #link("https://developer.mozilla.org/en-US/docs/Web/JavaScript")
  - *React:* #link("https://react.dev/")
  - *Vite:* #link("https://vite.dev/guide/")
  - *Flask:* #link("https://flask.palletsprojects.com/")
  - *Docker:* #link("https://docs.docker.com/")
  - *Vitest:* #link("https://vitest.dev/")
  - *React Testing Library:* #link("https://testing-library.com/docs/react-testing-library/intro/")

= Tecnologie
Nelle seguente sezione vengono descritte le tecnologie usate per lo sviluppo del capitolato Automated EN18031 Compliance Verification.

== Linguaggi di Programmazione 

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Python],
    [3.9.6],
    [Python è un linguaggio di programmazione ad alto livello, orientato a oggetti, adatto, tra gli altri usi, a sviluppare applicazioni distribuite, scripting, computazione numerica e system testing. 
    Nel nostro progetto è stato scelto per la gestione del lato backend dato che è il linguaggio prediletto dalla proponente e per la sua estrema versatilità.],

    [Javascript],
    [ES2020],
    [JavaScript è un linguaggio di programmazione multi paradigma orientato agli eventi. Nel nostro progetto è utilizzato per la gestione del frontend assieme alla libreria React ],
)

== Framework usati

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Flask],
    [3.1.3],
    [Flask è un micro-framework Web scritto in Python, è progettato per essere rapido e semplice, offrendo al contempo la possibilità di essere utilizzato per applicazioni complesse.
    È inoltre molto semplice da imparare, flessibile e ha buone performance.
    ],
)

== Strumenti di build

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Vite],
    [8.0.16],
    [Vite è diventato lo standard de facto dell'ecosistema frontend. È il motore ufficiale dietro i framework moderni come Vue, e i template ufficiali di React.
    È inoltre molto più veloce a creare il server rispetto ad altri strumenti simili ed è anche molto facile da implementare grazie alla sua configurazione minima richiesta. 
    ],
)

== Tecnologie per deployment

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Docker],
    [3.1.3],
    [Docker è una piattaforma open source che consente agli sviluppatori di creare, implementare, eseguire, aggiornare e gestire i container. 
    I container sono componenti standardizzati ed eseguibili che combinano il codice sorgente dell'applicazione con le librerie e le dipendenze del sistema operativo necessarie per eseguire tale codice in qualsiasi ambiente.
    ],
)

== Librerie

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [React],
    [19.2.7],
    [React è una libreria completa, molto flessibile e permette la creazione e la gestione dell'interfaccia utente. Nel nostro progetto viene utilizzato per le varie librerie che permettono di gestire l'interfaccia utente al meglio.],
)

== Tecnologie per testing

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Vitest],
    [/],
    [Vitest è un framework per il test di Javascript, progettato per essere veloce e leggero, con supporto per diversi tipi di test.],

    [React Testing Library],
    [/],
    [React Testing Library è una soluzione molto leggera per il testing di componenti React. Offre funzioni di utilità essenziali basate su react-dom e react-dom/test-utils, incoraggiando al contempo migliori pratiche di testing.]
)


= Architettura

= Tracciamento

