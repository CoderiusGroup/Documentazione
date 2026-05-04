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
      [0.1.0], [2026/05/04], [Filippo Zonta Rocha], [], [Prima stesura del verbale],
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
+ Verifica avanzamento lavori e pianificazione prossimi passi.
+ Scelte tecnologiche nei documenti di progetto.
+ Stesura del Diario di Bordo.

#v(0.5cm)

   #pagebreak()


= Svolgimento della Riunione

== Revisione Modalità di creazione dei diagrammi UML
Il team ha deciso a seguito di verifica dei documenti che per coerenza documentale e strutturale tutti i diagrammi UML saranno creati utilizzando il servizio Draw.io, che offre miglior flessibilità  e facilità d'uso.

== Continuazione del documento Analisi dei requisiti
Il team ha proseguito con la stesura del documento Analisi dei requisiti, che in questo momento si trova in una fase avanzata di redazione. Sono stati definiti i prossimi passi per portare a termine questo documento, che è fondamentale per la pianificazione e l'organizzazione del progetto.

== Continuazione del documento Piano di progetto
Il team ha continuato con la stesura del documento Piano di progetto, che è in una fase di sviluppo intermedia.  Sono stati assegnati i compiti per completare questo documento, che è essenziale per la gestione e il coordinamento delle attività del progetto.

== Continuazione del documento Norme di progetto
Il team ha proseguito con la stesura del documento Norme di progetto, che è in una fase di sviluppo iniziale. Sono stati discussi e definiti i prossimi passi per completare questo documento, che è importante per stabilire le regole e le linee guida per il lavoro del team.

== Continuazione del documento Glossario
Procede l'aggiornamento del documento Glossario e relative definizioni, che è in uno stato di aggiornamento continuo. 

== Stesura del Diario di bordo
Il team ha discusso su come strutturare e organizzare il Diario di bordo, che è in una fase di stesura iniziale.

== Aggiornamento Way of Working
Il team ha discusso e aggiornato il documento Way of Working, per ottimizzare i processi di lavoro, migliorare la comunicazione e la collaborazione all'interno del team garantendo chiarezza e coerenza nelle modalità operative.

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-3.1], [Revisione Tecnologie creazione Uml],
    [VI-3.2], [Continuazione del documento Analisi dei requisiti],
    [VI-3.3], [Continuazione del documento Piano di progetto],
    [VI-3.4], [Continuazione del documento Norme di progetto],
    [VI-3.5], [Continuazione del documento Glossario],
    [VI-3.6], [Organizzazione per  Diario di bordo],
    [VI-3.7], [Aggiornamento del documento Way of Working],
  )
]

#v(0.5cm)

== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Verifica avanzamento lavori.


#v(0.5cm)

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-3.1], [Continuazione del documento 
    \ Analisi dei requisiti], [Ines Iadadi,\ Alberto Canavese], [VI-3.2],
    [TD-3.2],
    [Continuazione del documento \ Piano di progetto],
    [Giovanni Angelo \ Marco Bronte],
    [VI-3.3],

    [TD-3.3], [Continuazione del documento \ Norme di progetto], [Edis Hodja], [VI-3.4],
    [TD-3.4], [Continuazione del documento Glossario], [Ines Iadadi,\ Alberto Canavese], [VI-3.5],
    [TD-3.5], [Stesura Diario di bordo], [Team], [VI-3.6],
    [TD-3.6], [Aggiornamento del  Way of Working], [Team], [VI-3.7],
  )
]
