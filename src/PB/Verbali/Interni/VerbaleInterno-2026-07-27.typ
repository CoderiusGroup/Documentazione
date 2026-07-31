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
    #text(size: 20pt)[*Versione 0.1.0*]
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
      [1.0.0], [2026-07-31], [Edis Hodja], [], [Approvazione del verbale],
      [0.1.0], [2026-07-27], [Giovanni Bronte], [Edis Hodja], [Prima stesura del verbale],
    )

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
  data: "27/07/2026",
  ora_inizio: "10:00",
  ora_fine: "11:00",
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
+ Divisione ruoli per lo Sprint 9.
+ Organizzazione delle attività relative alla fase di Product Baseline.
+ Discussione relativa ai quesiti da porre durante colloquio con la proponente Bluewind.

= Svolgimento della Riunione

==  Organizzazione delle attività per l'avvio della fase di Product Baseline
Dopo aver ricevuto esito positivo ed aver superato con successo la fase RTB, abbiamo ufficialmente avviato le attività per la successiva fase di Product Baseline. Il team ha quindi discusso quali documenti dovranno essere aggiornati e quali documenti dovranno essere scritti per la Product Baseline.

Il team ha deciso di continuare ad aggiornare i documenti Piano di Progetto e Piano di Qualifica, dato che sono fondamentali per tenere traccia dell'andamento del progetto. Inoltre, è stato deciso di iniziare la stesura del documento relativo alla Specifica Tecnica, che sarà fondamentale per i futuri programmatori, in quanto definisce l'architettura dietro il prodotto finale, ovvero l'applicazione web.

== Divisione ruoli per lo Sprint 9
In vista del termine dello Sprint 8, durante l'incontro interno il team ha discusso della suddivisione dei ruoli per lo sprint successivo. La decisione, presa in maniera collettiva, è stata quella di introdurre due figure con il ruolo di progettisti che affiancheranno il programmatore. Lo scopo è di gestire l'inizio della progettazione dell'applicazione web, cercando di seguire le linee architetturali definite dai progettisti stessi.

A causa di esigenze organizzative e produttive, è stato inoltre deciso di modificare la durata degli sprint da due settimane a una settimana. Questo ci permette di essere più flessibili ai cambiamenti e di pianificare le attività in modo che siano più facilmente gestibili.

== Preparazione per colloquio esterno con la proponente Bluewind
Il gruppo di lavoro ha deliberato gli argomenti di discussione per il prossimo incontro esterno con l'azienda proponente. Considerata l'assenza di variazioni sostanziali ai contenuti dell'Analisi dei Requisiti e trovandosi le attività di Product Baseline in fase di inizializzazione, si è deciso di incentrare l'incontro sul resoconto dei colloqui per l'RTB e sull'approfondimento tecnico dei dubbi emersi durante la redazione della Specifica Tecnica.

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-15.1], [Aggiornamento del Piano di Progetto],
    [VI-15.2], [Aggiornamento del Piano di Qualifica],
    [VI-15.3], [Avvio stesura della Specifica Tecnica],
    [VI-15.4], [Avvio sviluppo dell'applicazione web],
  )
]
== Ordine del Giorno del prossimo incontro
+ Aggiornamento sullo stato di avanzamento riguardante la redazione dei documenti 

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-15.1], [Aggiornamento del Piano di Progetto], [Ines Iadadi], [VI-15.1],
    [TD-15.2], [Aggiornamento del Piano di Qualifica], [Giovanni Bronte], [VI-15.2],
    [TD-15.3], [Avvio stesura della Specifica Tecnica], [Filippo Zonta Rocha,\ Leonardo Lorenzin], [VI-15.3],
    [TD-15.4], [Avvio sviluppo dell'applicazione web], [Alberto Canavese], [VI-15.4],
  )
]
