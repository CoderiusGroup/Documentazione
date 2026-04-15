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
      [0.2.0], [2026/04/15], [Leonardo Lorenzin], [Filippo Zonta Rocha], [Aggiornamento contenuti e correzione refusi],
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
+ Preparazione domande da porre a Bluewind Srl durante la riunione del 17.04.2026.
+ Discussione riguardo alle tecnologie da utilizzare per lo sviluppo del progetto.


#v(0.5cm)


= Svolgimento della Riunione

== Definizione glossario
Il gruppo ha analizzato lo stato di avanzamento dell’analisi dei requisiti e del glossario. È stato stabilito che quest'ultimo verrà aggiornato periodicamente sul sito (indicativamente al termine di ogni sprint). Si è inoltre proceduto alla redazione della prima stesura del glossario, il cui file è stato inserito nella directory: `RTB/Documenti interni`.

== Aggiornamento sito per il glossario
Si è deciso di aggiornare il sito per rendere il glossario disponibile alla consultazione.

== Preparazione domande da porre a Bluewind Srl
È stato preparato un insieme di domande da sottoporre all’azienda *Bluewind Srl* durante la riunione programmata per venerdì 17 aprile 2026.

== Discussione riguardo alle tecnologie da utilizzare
Il gruppo ha deciso di realizzare un'applicazione *web-based*.
Tra le tecnologie prese in considerazione per il frontend (*Vue* o *React*), il gruppo ha scelto di utilizzare *React*.

Per il backend, le opzioni basate su Python prese in considerazione sono: *Flask* e *FastAPI*. Il gruppo ha preferito prendersi del tempo per permettere a ognuno dei componenti di approfondire le varie tecnologie per poi poter decidere quale utilizzare.

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-3.1], [Il glossario sarà aggiornato periodicamente e modificato alla fine di ogni sprint.],
    [VI-3.2], [Sviluppo di un'applicazione web-based utilizzando React per il frontend.],
    [VI-3.3],
    [La scelta della tecnologia per il backend avverrà in seguito previa valutazione da parte del gruppo di Flask e FastAPI.],
  )
]

#v(0.5cm)

== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Decisione finale sulle tecnologie da utilizzare per il backend.
+ Verifica dello stato di avanzamento per il glossario e l'aggiornamento del sito.

#v(0.5cm)

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-3.1], [Prima stesura del glossario], [Giovanni Angelo Marco Bronte], [VI-3.1],
    [TD-3.2], [Aggiornamento del sito per rendere disponibile la consultazione del glossario], [Ines Iadadi], [VI-3.1],
    [TD-3.3],
    [Approfondimento delle tecnologie relative al backend per sostenere la discussione decisionale],
    [Tutti i membri],
    [VI-3.3],
  )
]