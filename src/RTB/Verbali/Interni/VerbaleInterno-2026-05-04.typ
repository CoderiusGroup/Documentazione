#let verbale(
  titolo: "Verbale Riunione Interna",
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
    #text(size: 20pt)[*Versione 1.0.1*]
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
      [1.0.1], [2026/05/26], [Edis Hodja], [Giovanni Bronte], [Correzione codici e decisione di riferimento],
      [1.0.0], [2026/05/04], [Leonardo Lorenzin], [], [Approvazione del verbale],
      [0.2.0], [2026/05/04], [Edis Hodja], [Leonardo Lorenzin], [Aggiornamento delle sezioni e aggiunta: 2.8, 2.9],
      [0.1.0], [2026/05/04], [Filippo Zonta Rocha], [Leonardo Lorenzin], [Prima stesura del verbale],
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
  data: "2026/05/04",
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
+ Verifica avanzamento lavori e pianificazione dei prossimi passi.
+ Scelte tecnologiche nei documenti di progetto.
+ Stesura del Diario di Bordo.
+ Finalizzazione delle domande per l'incontro con il proponente.

#v(0.5cm)

   #pagebreak()


= Svolgimento della Riunione

== Standardizzazione dello strumento per i diagrammi UML
Il team ha deciso a seguito di una verifica dei documenti che per coerenza documentale e strutturale tutti i diagrammi UML relativi ai casi d'uso della documentazione inerente all'Analisi dei Requisiti saranno creati utilizzando il servizio _Draw.io_, che offre strumenti flessibili e coerenza con le direttive analizzate.

== Continuazione del documento Analisi dei requisiti
Si procede con la stesura del documento Analisi dei requisiti, che in questo momento si trova in una fase intermedia di redazione e sono stati definiti i prossimi passi per portare a termine la stesura, che è fondamentale per la pianificazione e l'organizzazione del progetto.

== Continuazione del documento Piano di progetto
Si procede con la stesura del documento Piano di progetto, che è in una fase di sviluppo intermedia.  Sono stati assegnati i compiti per proseguire la redazione di questo documento, che è essenziale per la gestione e il coordinamento delle attività del progetto.

== Continuazione del documento Norme di progetto
Si prosegue con la stesura del documento Norme di progetto, che è in una fase di sviluppo intermedia. Sono stati discussi e definiti i prossimi passi per proseguire con la scrittura di questo documento, che è importante per stabilire le regole e le linee guida per il lavoro del team.

== Continuazione del documento Glossario
Procede l'aggiornamento del documento Glossario e relative definizioni, che è in uno stato di aggiornamento continuo.

== Stesura del Diario di bordo
Il team ha discusso su come strutturare e organizzare il Diario di Bordo inerente al primo incontro che si svolgerà in data 2026-05-08, che è in una fase di stesura iniziale.

== Aggiornamento Way of Working
Il team ha discusso e aggiornato il Way of Working andando a definire una struttura collettiva delle issues e del loro utilizzo per ottimizzare i processi di lavoro, migliorare la comunicazione e la collaborazione all'interno del team garantendo chiarezza e coerenza nelle modalità operative.

== Rotazione dei ruoli interni
In seguito ad un aggiornamento della documentazione e al suo stato di avanzamento sono stati assegnati definitivamente i ruoli precedentemente discussi e decisi seguendo i criteri di rotazione.

== Organizzazione dei quesiti per il proponente
In vista del prossimo incontro organizzato con il proponente Bluewind S.r.l., il gruppo ha individuato e strutturato i quesiti riguardanti vari dubbi sorti durante la continuazione del lavoro andando a mirare su problematiche riscontrate.

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-4.1], [Definizione per lo standard tecnologico relativo alla creazione dei diagrammi UML],
    [VI-4.2], [Continuazione del documento Analisi dei requisiti],
    [VI-4.3], [Continuazione del documento Piano di progetto],
    [VI-4.4], [Continuazione del documento Norme di progetto],
    [VI-4.5], [Continuazione del documento Glossario],
    [VI-4.6], [Organizzazione per  Diario di bordo],
    [VI-4.7], [Aggiornamento del documento Way of Working],
    [VI-4.8], [Rotazione dei ruoli interni],
    [VI-4.9], [Finalizzazione delle domande per Bluewind],
  )
]

#v(0.5cm)

== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Verifica avanzamento lavori.
+ Discussione sulla documentazione inerente al Piano di Qualifica


#v(0.5cm)

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-4.1], [Continuazione del documento 
    \ Analisi dei requisiti], [Ines Iadadi,\ Alberto Canavese], [VI-4.2],
    [TD-4.2],
    [Continuazione del documento \ Piano di progetto],
    [Giovanni Angelo \ Marco Bronte],
    [VI-4.3],

    [TD-4.3], [Continuazione del documento \ Norme di progetto], [Edis Hodja], [VI-4.4],
    [TD-4.4], [Continuazione del documento Glossario], [Ines Iadadi,\ Alberto Canavese], [VI-4.5],
    [TD-4.5], [Stesura Diario di bordo], [Team], [VI-4.6],
    [TD-4.6], [Aggiornamento del  Way of Working], [Team], [VI-4.7],
  )
]
