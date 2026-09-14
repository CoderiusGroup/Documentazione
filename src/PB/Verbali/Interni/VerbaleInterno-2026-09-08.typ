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
  data: "2026/09/08",
  ora_inizio: "9:30",
  ora_fine: "10:45",
  luogo: "Canale vocale Discord"
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin

= Ordine del Giorno
+ Assegnazione dei ruoli per lo Sprint 15
+ Aggiornamento sui documenti e sullo stato delle attività 
+ Verifica e approvazione dei documenti


= Svolgimento della Riunione

== Assegnazione dei ruoli per lo Sprint 14
Durante l'incontro, il team ha ricalibrato la suddivisione dei ruoli in vista dello Sprint 14, tenendo conto delle responsabilità necessarie per la preparazione della presentazione PB. Il ruolo di verificatore dispone ancora di un numero significativo di ore, che saranno impiegate per verificare e approvare i documenti.

== Aggiornamento sui documenti e sullo stato delle attività
Al momento della redazione del presente verbale, la maggior parte dei documenti è completa e attende soltanto la revisione finale e la conseguente approvazione. Per questo motivo, gran parte dello sprint sarà dedicata alle verifiche conclusive in vista della presentazione PB.
Saranno inoltre aggiornati i documenti che richiedono un aggiornamento settimanale, ossia il Piano di Progetto e il Piano di Qualifica.

== Verifica e approvazione dei documenti
Come indicato nel paragrafo precedente, l'obiettivo principale di questo sprint è verificare i documenti ancora da completare o approvare in vista della presentazione PB. In particolare, il team procederà con la verifica e l'approvazione dell'Analisi dei Requisiti, delle Norme di Progetto, della Specifica Tecnica e del Manuale Utente.

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-21.1], [Approvazione della Specifica Tecnica],
    [VI-21.2], [Aggiornamento del Piano di Progetto e del Piano di Qualifica],
    [VI-21.3], [Approvazione delle Norme di Progetto],
    [VI-21.4], [Approvazione dell'Analisi dei Requisiti],
    [VI-21.5], [Approvazione del Manuale Utente],
    
  )
]

== Ordine del Giorno prossimo incontro
+ Preparazione per presentazione PB con il professor Tullio Vardanega

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-21.1], [Approvazione della Specifica Tecnica], [Team], [VI-21.1],
    [TD-21.2], [Aggiornamento del Piano di Progetto e del Piano di Qualifica], [Filippo Zonta Rocha, \ Edis Hodja], [VI-21.2],
    [TD-21.3], [Approvazione delle Norme di Progetto], [Team], [VI-21.3],
    [TD-21.4], [Approvazione dell'Analisi dei Requisiti], [Team], [VI-21.4],
    [TD-21.5], [Approvazione del Manuale Utente], [Team], [VI-21.5],
  )
]