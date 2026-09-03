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
    #text(size: 20pt)[*Versione 1.0.0*]
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
// a meno di modifiche alla tabella di versionamento, tutto il resto va fatto da qui
// =========================================================================

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "2026/08/03",
  ora_inizio: "10.00",
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
+ Divisione ruoli per lo Sprint 10.
+ Aggiornamento dei documenti per la PB
+ Stato di avanzamento dello sviluppo dell'applicazione web

= Svolgimento della Riunione

== Divisione ruoli per lo Sprint 10

A seguito della conclusione dello Sprint 9, il team ha discusso la suddivisione dei ruoli per lo Sprint 10. Inoltre, si è deciso di mantenere la durata settimanale dello sprint, al fine di avere un ritmo di lavoro costante e un'equa distribuzione delle attività da svolgere.

== Aggiornamento dei documenti per la PB

Il team prosegue l'attività di redazione e aggiornamento della documentazione richiesta per la Product Baseline (PB). Nello specifico, le attività si concentrano sulla prosecuzione della Specifica Tecnica, fondamentale per definire nel dettaglio l'architettura e guidare lo sviluppo dell'applicazione web. Contestualmente, si procede al continuo allineamento del Piano di Progetto e del Piano di Qualifica, al fine di garantire un monitoraggio rigoroso dell'avanzamento dei lavori e del rispetto degli standard di qualità predefiniti.

== Stato di avanzamento dello sviluppo dell'applicazione web

Durante l'incontro, il team ha concordato di proseguire con l'implementazione dell'applicazione web, focalizzandosi sul completamento dei moduli pianificati. Tale avanzamento permetterà di verificare l'effettiva coerenza alle specifiche e di monitorare con precisione lo stato di maturità dell'MVP.
 
#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-16.1], [Aggiornamento del Piano di Progetto],
    [VI-16.2], [Aggiornamento del Piano di Qualifica],
    [VI-16.3], [Aggiornamento della Specifica Tecnica],
    [VI-16.4], [Proseguimento dello sviluppo dell'applicazione web],
    [VI-16.5], [Invio mail all'azienda Bluewind],
  )
]
== Ordine del Giorno del prossimo incontro
+ Aggiornamento sullo stato di avanzamento riguardante la redazione dei documenti 
+ Aggiornamento sullo stato di avanzamento riguardante lo sviluppo dell'applicazione web

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-16.1], [Aggiornamento del Piano di Progetto], [Leonardo Lorenzin], [VI-16.1],
    [TD-16.2], [Aggiornamento del Piano di Qualifica], [Alberto Canavese], [VI-16.2],
    [TD-16.3], [Aggiornamento della Specifica Tecnica], [Edis Hodja], [VI-16.3],
    [TD-16.4], [Proseguimento dello sviluppo dell'applicazione web], [Ines Iadadi, Giovanni Bronte], [VI-16.4],
    [TD-16.5], [Invio mail all'azienda Bluewind], [Leonardo Lorenzin], [VI-16.5],
  )
]
