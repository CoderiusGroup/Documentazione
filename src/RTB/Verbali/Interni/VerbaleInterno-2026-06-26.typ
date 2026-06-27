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
      [0.1.0], [2026-06-26], [Giovanni Bronte], [], [Prima stesura del verbale],
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
  data: "26/06/2026",
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
+ Discussione sullo stato dei documenti 
+ Rotazione settimanale dei ruoli per il cambio sprint


= Svolgimento della Riunione

== Rotazione dei ruoli
Il 2026-06-26 finisce lo sprint 6 del nostro team. Seguendo quanto scritto nelle Norme di Progetto e quanto fatto negli sprint precedenti, il team si è riunito per discutere sulla rotazione dei ruoli da fare per il prossimo sprint. 

== Aggiornamento Piano di Progetto e Piano di Qualifica
Come scritto già negli scorsi verbali interni, alla fine di ogni sprint vengono aggiornati il Piano di Progetto e il Piano di Qualifica inserendo il resoconto dello sprint passato. Nello scorso verbale avevamo inserito nel TODO "Approvazione Piano di Progetto" e "Approvazione Piano di Qualifica", dato che i documenti non sono stati ancora approvati, questi ultimi verranno prima aggiornati con il resoconto dello sprint e successivamente verificati per l'approvazione finale del documento in vista della presentazione RTB.

== Concludere la verifica dell'Analisi dei Requisiti
Dallo scorso verbale interno sono stati trovati alcuni errori minori da sistemare per quanto riguarda l'Analisi dei Requisiti. Per questo motivo il team ha deciso di apportare le modifiche necessarie al documento prima che venga approvato in modo definitivo.

== Presentazione interna del Proof of Concept 
I due programmatori di questo sprint hanno presentato al resto del team la versione attuale del Proof of Concept. Il team ha notato una possibile funzionalità mancante alla versione attuale dell'eseguibile. È stato quindi deciso di aggiungere questa funzionalità al Proof of Concept prima della candidatura all'RTB.

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-12.1], [Stesura del Diario di Bordo per incontro del 2026-07-03],
    [VI-12.2], [Aggiornamento Piano di Progetto],
    [VI-12.3], [Aggiornamento Piano di Qualifica],
    [VI-12.4], [Aggiornamento Glossario],
    [VI-12.5], [Apportare modifiche al Proof of Concept],
    [VI-12.6], [Validazione Proof of Concept],
  )
]
== Ordine del Giorno prossimo incontro
+ Discussione su presentazione tecnologie RTB

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-12.1], [Stesura del Diario di Bordo per incontro del 2026-07-03], [Team], [VI-12.1],
    [TD-12.2], [Aggiornamento Piano di Progetto], [Leonardo Lorenzin],[VI-12.2],
    [TD-12.3], [Aggiornamento Piano di Qualifica], [Edis Hodja],[VI-12.3],
    [TD-12.4], [Aggiornamento Glossario], [Team],[VI-12.4],
    [TD-12.5], [Apportare modifiche al Proof of Concept], [Giovanni Bronte,\ Ines Iadadi],[VI-12.5],
    [TD-12.6], [Validazione Proof of Concept], [Filippo Zonta Rocha,\ Alberto Canavese],[VI-12.6],
  )
]