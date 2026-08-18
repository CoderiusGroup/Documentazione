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
  data: "10/08/2026",
  ora_inizio: "9:30",
  ora_fine: "10:15",
  luogo: "Canale vocale Discord"
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Ines Iadadi

= Ordine del Giorno
+ Divisione dei ruoli per il nuovo Sprint 11
+ Aggiornamento sui progressi dei lavori
+ Organizzazione delle tempistiche e disponibilità


= Svolgimento della Riunione

== Divisione dei ruoli per il nuovo Sprint 11
In vista dell'avvio dello Sprint 11, durante l'incontro interno il team ha discusso della nuova suddivisione dei ruoli per far fronte agli obiettivi previsti. La decisione, presa in maniera collettiva, è stata quella di allocare due figure nel ruolo di progettisti per gestire in modo mirato l'avanzamento della Specifica Tecnica e definire accuratamente le scelte architetturali. 

Tale configurazione è stata pensata per ottimizzare il parallelismo delle attività, sfruttando anche la maggiore flessibilità organizzativa data dal periodo estivo.

== Aggiornamento sui progressi dei lavori
La discussione si è poi focalizzata sull'analisi dello sprint precedente. I membri del team hanno condiviso gli aggiornamenti sui progressi ottenuti, confrontandosi in modo costruttivo. \ Durante questo scambio sono emersi alcuni dubbi e riflessioni, in particolar modo relativi all'implementazione del codice e alle scelte architetturali legate alla Specifica Tecnica. 

Il gruppo ha dedicato il tempo necessario per analizzare le criticità, stabilendo come procedere per allineare al meglio lo sviluppo e la redazione documentale.

== Organizzazione delle tempistiche e disponibilità
L'ultimo punto all'ordine del giorno ha riguardato la gestione dei lavori e delle scadenze durante la settimana di Ferragosto. È stato fatto notare che, trovandoci nel periodo di ferie, vi sia minore disponibilità di tempo generale dovuta soprattutto a impegni interpersonali. 

Il team ha pertanto deciso di organizzare le tempistiche in modo da sfruttare questa finestra per portare avanti il lavoro cercando di sfruttare al meglio gli orari di ciascun membro.

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-17.1], [Approvazione formale dei ruoli previsti per lo Sprint 11],
    [VI-17.2], [Stesura del Diario di Bordo del 2026-08-14],
    [VI-17.3], [Definizione dell'approccio per la stesura della Specifica Tecnica in relazione ai dubbi di implementazione],
    [VI-17.4], [Continuazione dello sviluppo relativo alla MVP],
  )
]

== Ordine del Giorno prossimo incontro
+ Verifica dello stato di avanzamento delle attività
+ Esito della stesura della Specifica Tecnica e allineamento codice
+ Resoconto organizzativo per l'incontro con Bluewind

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-17.1], [Aggiornamento parte preventivo Sprint 11 del Piano di Progetto], [Leonardo Lorenzin], [VI-17.1],
    [TD-17.2], [Stesura del Diario di Bordo], [Giovanni Angelo Marco Bronte], [VI-17.2],
    [TD-17.3], [Integrazione e continua stesura della Specifica Tecnica], [Edis Hodja, \ Filippo Zonta Rocha], [VI-17.3],
    [TD-17.4], [Continuare con sviluppo MVP], [Ines Iadadi], [VI-17.4],
  )
]