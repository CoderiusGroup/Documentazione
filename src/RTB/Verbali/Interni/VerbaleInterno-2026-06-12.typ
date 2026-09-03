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
      [1.0.0], [2026/06/16], [Edis Hodja], [], [Approvazione del verbale],
      [0.1.0], [2026/06/12], [Giovanni Bronte], [Edis Hodja], [Prima stesura del verbale],
      // aggiungi nuova riga quando viene aggiornato
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
  data: "12/06/2026",
  ora_inizio: "09:00",
  ora_fine: "11:00",
  luogo: "Canale Vocale Discord"
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin


= Ordine del Giorno
+ Pianificazione dei ruoli e delle attività per il prossimo Sprint.
+ Aggiornare il Diario di Bordo 
+ Confronto sullo stato della documentazione e sull'organizzazione del lavoro.


= Svolgimento della Riunione

== Rotazione dei ruoli 
Seguendo quanto indicato nella Dichiarazione degli Impegni, il team ha riorganizzato i ruoli interni prevedendo una rotazione tra i membri, in modo da consentire a tutti di lavorare sulle attività da completare. Per il prossimo sprint sono stati assegnati due verificatori e due programmatori, rimuovendo dalla rotazione dei ruoli per questo sprint il progettista e l'analista. Il motivo di questa scelta è di poter finalizzare il Proof of Concept realizzato e verificare tutti i documenti scritti in vista dell'RTB.

== Diario di Bordo del 2026-06-12
Il team ha discusso e definito gli aggiornamenti da apportare al Diario di Bordo relativo all’incontro del 2026-06-12, sulla base delle attività svolte nelle due settimane. Durante la discussione sono stati analizzati gli obiettivi raggiunti, le principali problematiche riscontrate nel corso della redazione della documentazione e dell’organizzazione interna del lavoro, nonché i possibili approcci per affrontarle.


== Invio Mail all'azienda proponente
Il team ha deciso di inviare una mail all'azienda proponente con l'attuale versione dell'AdR, con lo scopo di permettere all'azienda di visualizzare i progressi fatti ed eventualmente fornire dei riscontri al team.

== Aggiornamento di specifici documenti
Procede l'aggiornamento dei documenti: Piano di Progetto e Piano di Qualifica. Questi documenti vengono aggiornati ogni sprint, in quanto hanno delle sezioni dedicate che descrivono la progressione del lavoro effettuato dal team durante lo sprint. Il team ha anche discusso sull'importanza di mantenere aggiornato il glossario in vista dell'RTB.

== Revisione e valutazione interna del Proof of Concept
Il programmatore del quinto sprint ha presentato le modifiche da lui effettuate al Proof of Concept al resto del team per poter avere un momento di discussione e di riscontro riguardante lo sviluppo dell'eseguibile. 



= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-10.1], [Aggiornamento del Glossario],
    [VI-10.2], [Redazione della Lettera di Presentazione per RTB],
    [VI-10.3], [Continuazione sviluppo del Proof of Concept],
    [VI-10.4], [Aggiornamento Piano di Progetto],
    
  )
]
== Ordine del Giorno prossimo incontro
Nel prossimo incontro saranno affrontati i seguenti punti:
+ Discussione sullo stato dei documenti in vista dell'RTB.
+ Incontro con Bluewind

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-10.1], [Aggiornamento del Glossario con gli svariati termini usati nei vari documenti], [Edis Hodja], [VI-10.1],
    [TD-10.2], [Redazione della Lettera di Presentazione per l'RTB], [Alberto Canavese],[VI-10.2],
    [TD-10.3], [Continuazione sviluppo del Proof of Concept ], [Ines Ianadi,\ Filippo Zonta Rocha],[VI-10.3],
    [TD-10.4], [Aggiornamento del Piano di Progetto per le sezioni legate al resoconto dello Sprint 5 e alla pianificazione dello Sprint 6], [Giovanni Bronte],[VI-10.4]
    
  )
]