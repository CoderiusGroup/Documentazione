#let verbale(
  titolo: "",
  data: "",
  ora_inizio: "",
  ora_fine: "",
  luogo: "",
  body,
) = {
  set document(title: titolo, author: "Coderius")
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
      if counter(page).get().first() > 1 [
        #set text(size: 9pt, fill: luma(100))
        #grid(
          columns: (1fr, 1fr),
          align(left)[Verbale Interno], align(right)[Coderius Group],
        )
        #v(-0.5em)
        #line(length: 100%, stroke: 0.4pt + luma(150))
      ]
    },
  )
  set text(font: "Libertinus Serif", size: 11pt, lang: "it")
  set heading(numbering: "1.1.")

  align(center)[
    #v(4em)
    #image("../../../images/logoCoderius.jpg", width: 50%)
    #link("mailto:coderius01@gmail.com")[
      #text(size: 1.2em)[coderius01\@gmail.com]
    ]
    #v(3em)
    #line(length: 80%, stroke: 1.5pt)
    #v(1em)
    #text(size: 2.2em, weight: "bold")[#titolo]
    #v(1em)
    #line(length: 80%, stroke: 1.5pt)
    #v(4em)

    #grid(
      columns: (1fr, 1fr),
      align: left,
      gutter: 2em,
      [ *Data:* #data \
        *Ora inizio:* #ora_inizio \
        *Ora fine:* #ora_fine \
        *Luogo:* #luogo ],
    )
    #v(4em)
    #text(size: 20pt)[*Versione 1.0.0*]
  ]
  pagebreak()

  // --- REGISTRO DELLE MODIFICHE ---
  heading(numbering: none, outlined: false)[Tabella di versionamento]
  v(2em)

  align(center)[
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
      [1.0.0], [2026/06/08], [Ines Iadadi], [], [Approvazione del verbale],
      [0.1.0], [2026/06/08], [Edis Hodja], [Ines Iadadi], [Prima stesura del verbale],
    )
  ]

  pagebreak()

  //--- indice ---
  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text(weight: "bold")[Indice],
    indent: 2em,
    depth: 3,
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  body
}


#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "2026/06/08",
  ora_inizio: "10:00",
  ora_fine: "11:30",
  luogo: "Canale Vocale Discord",
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin
#v(0.5cm)

= Ordine del Giorno
+ Confronto sullo stato della documentazione e sull'organizzazione del lavoro.
+ Pianificazione delle attività successive.

#v(0.5cm)

= Svolgimento della Riunione

== Aggiornamento del Piano di Qualifica

Il team ha approvato la documentazione relativa al Piano di Qualifica, che in questo periodo ha subito un ulteriore aggiornamento. Nello specifico, sono stati implementati dei sistemi automatici su GitHub volti a monitorare la qualità della documentazione prodotta.

Gli strumenti introdotti sono i seguenti:

- Indice di Gulpease: calcolo automatico dell'indice di leggibilità per tutti i documenti narrativi (file `.typ` presenti in `src/`).

- Controllo ortografico: conteggio automatico degli errori ortografici nei documenti `.typ` contenuti in `src/`, effettuato tramite `aspell` con dizionario italiano.

- Wordlist personalizzata: definizione di un dizionario personalizzato per il controllo ortografico con `aspell-it`, in modo da escludere dai conteggi termini tecnici e parole di dominio non riconosciute dal dizionario standard.

L'introduzione di questi sistemi automatici consente al team di monitorare in modo continuo e oggettivo la qualità formale dei documenti, riducendo l'effort manuale di verifica e garantendo maggiore uniformità.

== Correzioni e ultimazione dell'Analisi dei Requisiti

Il team si è confrontato su alcuni aspetti procedurali relativi allo sviluppo dei casi d'uso, analizzando in particolare quelli risultati poco corretti o di scarsa utilità nel contesto della documentazione e del progetto stesso.

A seguito di questa analisi, il team ha provveduto a correggere gli elementi critici e a rimuovere quelli ritenuti superflui, migliorando così la coerenza complessiva dell'Analisi dei Requisiti.


== Inoltro dell'email alla proponente
Il team ha esaminato congiuntamente la bozza dell'email redatta dal Responsabile e destinata alla proponente Bluewind. La comunicazione contiene la versione definitiva del documento di Analisi dei Requisiti e formalizza la richiesta di firma e validazione del verbale relativo all'ultimo incontro svolto in data 2026-06-03.

Contestualmente, è stata inviata una seconda email volta a correggere alcune imprecisioni riscontrate in precedenti verbali esterni. Tali criticità sono riconducibili alla definizione del Way of Working, tuttora in fase di consolidamento, e la comunicazione ha l'obiettivo di allinearne i contenuti agli standard adottati dal gruppo.

== Avanzamento del Proof of Concept
Durante l'incontro, il Programmatore ha aggiornato il team riguardo ai progressi compiuti sul Proof of Concept. È emerso che l'integrazione tra le diverse componenti dell'applicazione è stata portata a termine con successo: il frontend, realizzato con React e generato tramite Vite a partire dal mock-up presentato alla proponente in un incontro esterno, comunica correttamente con il backend, sviluppato in Python mediante Flask.

== Aggiornamento della struttura della repository
Il gruppo ha deciso di caricare le presentazioni dei Diari di Bordo in una nuova cartella dedicata all'interno della repository di documentazione, al fine di garantirne la tracciabilità e la consultazione da parte di tutti i membri del team.

#pagebreak()

= Conclusione e Decisioni Prese

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-9.1], [Aggiornamento dei dati presenti nel Piano di Qualifica],
    [VI-9.2], [Correzione e validazione dell'Analisi dei Requisiti],
    [VI-9.3], [Validazione finale delle Norme di Progetto],
    [VI-9.4], [Inoltro dell'email alla proponente Bluewind],
    [VI-9.5], [Continuazione dello sviluppo del Proof of Concept],
    [VI-9.6], [Aggiornamento sezioni della repository],
  )
]

== Ordine del Giorno prossimo incontro

Nel prossimo incontro saranno affrontati i seguenti punti:
+ Verifica dello stato di avanzamento dei task assegnati e aggiornamento generale sullo stato individuale.
+ Approvazione della documentazione e caricamento definitivo su GitHub.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-9.1], [Aggiornamento del Piano di Qualifica in seguito all'aggiunta degli strumenti di tracking su GitHub], [Filippo Zonta Rocha], [VI-9.1],
    [TD-9.2], [Conclusione definitiva dell'Analisi dei Requisiti], [Giovanni Angelo Marco Bronte], [VI-9.2],
    [TD-9.3], [Verifica sintattica e ortografica delle Norme di Progetto], [Leonardo Lorenzin, \ Ines Iadadi], [VI-9.3],
    [TD-9.4], [Invio della mail a Bluewind con relativa Analisi dei Requisiti e verbali esterni da verificare], [Filippo Zonta Rocha], [VI-9.4],
    [TD-9.5], [Sviluppare le parti principali del Proof of Concept], [Edis Hodja], [VI-9.5],
    [TD-9.6], [Aggiornamento della struttura della repository], [Alberto Canavese], [VI-9.6],
  )
]



