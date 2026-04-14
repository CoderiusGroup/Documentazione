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
      [0.1.0], [2026/04/14], [Alberto Canavese], [Leonardo Lorenzin], [Prima stesura del verbale],
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
  data: "2026/04/14",
  ora_inizio: "14:00",
  ora_fine: "15:00",
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
+ Definizione glossario.
+ Aggiornamento sito per il glossario.
+ Aggiornamento repo per i verbali esterni.
+ Preparazione domande da porre a Bluewind Srl durante la riunione del 16.04.2026.
+ Discussione riguardo alle tecnologie da utilizzare per lo sviluppo del progetto.


#v(0.5cm)


= Svolgimento della Riunione

== Definizione glossario
Il gruppo si confronta su a che punto è l’analisi dei requisiti e il glossario (definito che il glossario deve essere aggiornato periodicamente).
È stato definito che il glossario viene modificato sul sito periodicamente (idealmente alla fine di ogni sprint).
Viene assegnato Giovanni Bronte alla prima stesura di un glossario che si troverà nella directory: `RTB/Documenti interni`.

== Aggiornamento sito per il glossario
Si è deciso di aggiornare il sito per avere il glossario disponibile alla consultazione. Questo compito è stato assegnato a Ines Iadadi.

== Aggiornamento repo per i verbali esterni
È stato confermato il verbale esterno del 04.04, già inviato e firmato da Bluewind Srl.
Alberto Canavese ha creato la nuova directory nel branch develop: `RTB/Verbali/Esterni`, dove verranno caricati i verbali esterni una volta firmati.

== Preparazione domande da porre a Bluewind Srl
È stata preparata una lista di domande da sottoporre all’azienda Bluewind Srl durante la riunione programmata per giovedì 16 aprile 2026.

== Discussione riguardo alle tecnologie da utilizzare
Il gruppo ha deciso di realizzare un'applicazione web based.
Tra le tecnologie prese in considerazione per il frontend (Vue o React), il gruppo ha scelto React.

Per il backend le opzioni in considerazione (Python) sono: Flask e FastAPI. Il gruppo si prende un po’ di tempo per permettere a ognuno di approfondire le varie tecnologie per decidere più avanti quale utilizzare per il backend.

#v(0.3cm)

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-3.1], [Il glossario sarà aggiornato periodicamente e modificato alla fine di ogni sprint.],
    [VI-3.2], [Sviluppo di un'applicazione web based utilizzando React per il frontend.],
    [VI-3.3],
    [La scelta della tecnologia per il backend avverrà in seguito previa valutazione da parte del gruppo di Flask e FastAPI.],
  )
]

#pagebreak()

== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Decisione sulle tecnologie da utilizzare per il backend.
+ Verifica dello stato di avanzamento per il glossario e l'aggiornamento del sito.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-3.1], [Prima stesura di un glossario], [Giovanni Angelo Marco Bronte], [VI-3.1],
    [TD-3.2], [Aggiornare il sito per rendere disponibile la consultazione del glossario], [Ines Iadadi], [VI-3.1],
    [TD-3.3],
    [Approfondire le varie tecnologie backend per sostenere la discussione decisionale],
    [Tutti i membri],
    [VI-3.3],
  )
]
