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
  data: "2026/08/24",
  ora_inizio: "10:30",
  ora_fine: "11:45",
  luogo: "Canale vocale Discord"
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Edis Hodja
- Filippo Zonta Rocha
- Leonardo Lorenzin
- Giovanni Angelo Marco Bronte

= Ordine del Giorno
+ Divisione dei ruoli per il nuovo Sprint 13
+ Definizione degli obiettivi di sprint (MVP e Documentazione)
+ Pianificazione delle scadenze finali e incontro con Bluewind


= Svolgimento della Riunione

== Divisione dei ruoli per il nuovo Sprint 13
In vista dell'avvio dello Sprint 13, durante l'incontro interno il team ha discusso della nuova suddivisione dei ruoli. Si è deciso di impiegare due programmatori per accelerare e portare a una quasi conclusione lo sviluppo dell'MVP, con il supporto aggiuntivo del verificatore. 

Per quanto riguarda la parte di progettazione, il progettista verrà supportato attivamente dal responsabile e dall'amministratore.

== Definizione degli obiettivi dello Sprint 13
La discussione si è poi focalizzata sulle attività pratiche e documentali da portare a termine. Dal punto di vista del codice, la priorità assoluta è giungere a una versione quasi definitiva dell'MVP. 

Parallelamente, il team ha delineato i compiti relativi alla stesura dei documenti: è necessario aggiornare la Specifica Tecnica, integrare nuovi dati necessari per il Piano di Qualifica, e aggiornare la sezione del preventivo nel Piano di Progetto.

== Pianificazione delle scadenze finali e incontro con Bluewind
L'ultimo punto all'ordine del giorno ha riguardato l'organizzazione delle fasi conclusive del progetto. Il gruppo ha concordato sulla necessità di stimare e fissare una data definitiva per il termine dei lavori. 

Di conseguenza, si è discusso di come coordinarsi per il prossimo incontro di confronto con l'azienda Bluewind e per la futura presentazione della Product Baseline (PB).

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-19.1], [Approvazione formale dei ruoli previsti per lo Sprint 13],
    [VI-19.2], [Continuazione dello sviluppo per giungere a una quasi conclusione del MVP],
    [VI-19.3], [Aggiornamento della Specifica Tecnica (scelta dei pattern)],
    [VI-19.4], [Aggiornamento del Piano di Qualifica (Metriche di qualità del prodotto)],
    [VI-19.5], [Aggiornamento della parte di preventivo del Piano di Progetto],
    [VI-19.6], [Necessità di stimare una data fissa di fine lavori, confronto con Bluewind e PB]
  )
]

== Ordine del Giorno prossimo incontro
+ Verifica dello stato di avanzamento dell'MVP.
+ Controllo dell'aggiornamento dei documenti (Specifica Tecnica, Piano di Qualifica, Piano di Progetto).
+ Fissazione definitiva delle date di consegna e di incontro con l'azienda.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-19.1], [Giungere ad una quasi conclusione dell'MVP], [Edis Hodja, \ Filippo Zonta Rocha], [VI-19.2],
    [TD-19.2], [Aggiornamento Specifica Tecnica (scelta pattern)], [Alberto Canavese], [VI-19.3],
    [TD-19.3], [Aggiornamento preventivo Piano di Progetto], [Ines Iadadi], [VI-19.5],
    [TD-19.4], [Aggiornamento Piano di Qualifica (sezione Metriche)], [Giovanni Angelo Marco Bronte], [VI-19.4],
    [TD-19.5], [Stimare data fine lavori, incontro BlueWind e PB], [Team], [VI-19.6],
  )
]