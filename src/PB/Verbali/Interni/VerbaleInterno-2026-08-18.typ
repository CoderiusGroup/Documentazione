#let verbale(
  titolo: "",
  data: "",
  ora_inizio: "",
  ora_fine: "",
  luogo: "",
  body
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
        align(left)[Verbale Interno],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )
  set text(font: "Libertinus Serif", size: 11pt, lang: "it")
  set heading(numbering: "1.1.")

  //copertina
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

    // dettagli della riunione
    #grid(
      columns: (1fr, 1fr),
      align: left,
      gutter: 2em,
      [ *Data:* #data \
        *Ora inizio:* #ora_inizio \
        *Ora fine:* #ora_fine \
        *Luogo:* #luogo ]
    )
    #v(4em)
  ]
  pagebreak()

  //--- indice ---
  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text( weight: "bold")[Indice],
    indent: 2em,
    depth: 3
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  body
}

// =========================================================================
// Inizio documento
// =========================================================================

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "2026/08/18",
  ora_inizio: "10:00",
  ora_fine: "10:30",
  luogo: "Canale vocale Discord"
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Ines Iadadi
- Leonardo Lorenzin
- Giovanni Angelo Marco Bronte

= Ordine del Giorno
+ Divisione dei ruoli per il nuovo Sprint 12
+ Aggiornamento sui progressi delle attività
+ Incontro con Bluewind
+ Organizzazione delle tempistiche e disponibilità


= Svolgimento della Riunione

== Divisione dei ruoli per il nuovo Sprint 12
In vista dell'avvio dello Sprint 12, durante l'incontro interno il team ha discusso della nuova suddivisione dei ruoli per far fronte agli obiettivi previsti. Si è deciso per questo sprint di tornare a impiegare due programmatori per lo sviluppo del codice, per accelerare lo stato di avanzamento del MVP. Inoltre, si è deciso di dare più flessibilità al verificatore, che potrà fornire assistenza sulla stesura della Specifica Tecnica e all'amministratore nell'avanzamento del MVP.

== Aggiornamento sui progressi delle attività
La discussione si è poi focalizzata sull'analisi dello sprint precedente. I membri del team hanno condiviso gli aggiornamenti sui progressi ottenuti, in modo da delineare le attività da completare e le eventuali criticità riscontrate. Si procederà con la stesura del Diario di Bordo, che sarà completato entro il 21/08/2026.

== Incontro con Bluewind 
In vista dell'incontro con l'azienda Bluewind, il team ha discusso di come presentare lo stato di avanzamento dei lavori e dunque le scelte progettuali adottate; inoltre, chiarire eventuali dubbi.

== Organizzazione delle tempistiche e disponibilità
L'ultimo punto all'ordine del giorno ha riguardato la distribuzione delle attività vista la ridotta disponibilità di alcuni membri del team durante questo periodo di ferie. Si è deciso di organizzare le attività in modo da garantire la continuità dello sviluppo, tenendo conto delle tempistiche e delle priorità. 

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-16.1], [Approvazione formale dei ruoli previsti per lo Sprint 12],
    [VI-16.2], [Stesura del Diario di Bordo del 2026-08-21],
    [VI-16.3], [Organizzazione in vista dell'incontro con Bluewind],
    [VI-16.4], [Continuazione dello sviluppo relativo al MVP],
    [VI-16.5], [Continuazione della stesura della Specifica Tecnica],
      )
]

== Ordine del Giorno prossimo incontro
+ Verifica dello stato di avanzamento delle attività
+ Esito della stesura della Specifica Tecnica e allineamento del codice

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-16.1], [Aggiornamento parte preventivo Sprint 12 del Piano di Progetto], [Alberto Canavese], [VI-16.1],
    [TD-16.2], [Stesura del Diario di Bordo], [Alberto Canavese], [VI-16.2],
    [TD-16.3], [Organizzazione per l'incontro con Bluewind], [Team], [VI-16.3],
    [TD-16.4], [Continuare con sviluppo MVP], [Leonardo Lorenzin, Edis Hodja, Filippo Zonta Rocha], [VI-16.4],
    [TD-16.5], [Continuazione stesura della Specifica Tecnica], [Ines Iadadi, Giovanni Angelo Marco Bronte], [VI-16.5],
  )
]