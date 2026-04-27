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
      [0.1.0], [2026/04/21], [Filippo Zonta Rocha], [Alberto Canavese], [Prima stesura del verbale],
      [0.2.0], [2026/04/21], [Alberto Canavese], [Leonardo Lorenzin], [Aggiornamento contenuti e correzione refusi],
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
  data: "2026/04/21",
  ora_inizio: "09:00",
  ora_fine: "09:45",
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
+ Decisione sulle tecnologie da utilizzare per lo sviluppo del backend.
+ Discussione sullo stato lavori e pianificazione documenti.


#v(0.5cm)


= Svolgimento della Riunione
== Scelta delle tecnologie per il backend
Il team, dopo aver approfondito personalmente le tecnologie proposte precedentemente, ha scelto di utilizzare Flask come framework per lo sviluppo del backend, in quanto ritenuto più adatto alle esigenze.


== Stesura iniziale del documento Piano di progetto
Il team ha discusso e definito la struttura iniziale del documento Piano di progetto, stabilendo le sezioni principali e assegnando le responsabilità per la stesura dei contenuti.

== Stesura iniziale del documento Norme di progetto
Il team ha iniziato a delineare le Norme di progetto, identificando le regole e le linee guida che guideranno lo sviluppo del progetto, inclusi standard di codifica, processi di revisione e comunicazione interna.

== Continuazione del documento Analisi dei requisiti
Si procede ad approfondire ulteriormente l'Analisi dei requisiti, procedendo per step atti all'avanzamento del documento, con particolare attenzione alla definizione dei requisiti funzionali e non funzionali del progetto.
== Continuazione del documento Glossario
Il team ha continuato a lavorare sul Glossario, aggiungendo nuovi termini e definizioni rilevanti per il progetto, al fine di garantire la coerenza documentale.
== Redistribuzione dei ruoli
Il team ha discusso e redistribuito i ruoli all'interno del progetto per andare incontro alle esigenze attuali di stesura dei documenti.
== Preparazione domande da porre a Bluewind Srl
È stato preparato un insieme di domande da sottoporre all’azienda *Bluewind Srl* durante la riunione programmata per Lunedì 4 maggio 2026.


#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-3.1], [Scelta delle tecnologie per il backend],
    [VI-3.2], [Inizio del documento Piano di progetto],
    [VI-3.3], [Inizio del documento Norme di progetto],
    [VI-3.4], [Continuazione del documento Analisi dei requisiti],
    [VI-3.5], [Continuazione del documento Glossario],
    [VI-3.6], [Stesura del Diario di bordo],
    [VI-3.7], [Domande per Bluewind per l'incontro del 2026/05/04],
  )
]

#v(0.5cm)

== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Verifica avanzamento lavori.
+ Stesura del Diario di Bordo.

#v(0.5cm)

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-3.1], [Stesura relativa al primo sprint del documento Piano di Progetto], [Ines Iadadi], [VI-3.2],
    [TD-3.2],
    [Stesura iniziale del documento Norme di Progetto],
    [Leonardo Lorenzin, \ Giovanni Angelo Marco Bronte],
    [VI-3.3],

    [TD-3.3], [Continuazione del documento Analisi dei requisiti], [Edis Hodja, Ines Iadadi], [VI-3.4],
    [TD-3.4], [Continuazione del documento Glossario], [Team], [VI-3.5],
    [TD-3.5], [Domande per Bluewind per l'incontro del 2026/05/04], [Team], [VI-3.7],
  )
]
