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
      [0.1.0], [2026-05-13], [Filippo Zonta Rocha], [], [Correzione refusi, Aggiornamento sezioni],
      [0.1.0], [2026-05-13], [Giovanni Bronte], [Filippo Zonta Rocha], [Prima stesura del verbale],
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

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "13/05/2026",
  ora_inizio: "09:00",
  ora_fine: "10:40",
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
+ Verifica avanzamento e pianificazione lavori.
+ Discussione e creazione del Diario di Bordo per il 15/05.
+ Implementazione di una sezione per il Diario di Bordo nel sito del gruppo.
+ Discussione sul documento: Piano di Qualifica.


= Svolgimento della Riunione

== Continuazione del documento Analisi dei Requisiti
La redazione del documento dell'Analisi dei Requisiti è in una fase avanzata di stesura. Durante la riunione esterna tenuta il 2026-05-04 il team ha richiesto la possibilità di avere feedback sull'AdR da parte dell'azienda proponente. Questo permetterà di verificare se gli Use Case definiti fino ad ora siano corretti, per poter continuare l'approfondimento documentale.

== Continuazione del documento Norme di Progetto 
La redazione del documento Norme di Progetto è in una fase avanzata di stesura. Sono stati discussi e definiti i prossimi passi per proseguire la scrittura di questo documento, il quale è fondamentale per stabilire le regole e linee guida per il lavoro del team.

== Continuazione del documento Piano di Progetto
L'aggiornamento del documento Piano di Progetto viene eseguito all'inizio di ogni sprint, in quanto deve includere un resoconto dello sprint precedente e pianificare le attività per lo sprint successivo. In questo caso l'aggiornamento del PdP dovrà essere fatto il 2026-05-18.

== Stesura iniziale del Piano di Qualifica
Stesura iniziale del Piano di Qualifica limitatamente alla sezione introduttiva. Per questo sprint il gruppo ha deciso di concentrarsi sulla stesura degli altri documenti, in quanto il Piano di Qualifica è un documento che richiede una pianificazione dettagliata e una definizione precisa delle strategie di verifica e validazione, che al momento non sono ancora state completamente definite.

== Stesura del Diario di Bordo
Il team ha discusso e deciso come aggiornare il Diario di Bordo per l'incontro del 2026-05-15 in base a quanto svolto durante la settimana.

== Aggiunta di una sezione per il Diario di Bordo sul sito web del gruppo
Il team ha deciso che implementerà una sezione per pubblicare tutti i Diari di Bordo che si svolgeranno durante questo progetto sul sito web del gruppo, in modo da avere una documentazione accessibile e organizzata di tutte le attività svolte durante il progetto.

== Discussione su alcuni Use Case dell'Analisi dei requisiti
Gli analisti per questo sprint hanno sollevato alcuni dubbi per quanto riguarda alcuni Use Case scritti in precedenza nell'AdR che è stata oggetto di discussione da parte del team per risolvere i problemi trovati. Tra i quali uno Use Case in particolare non era molto chiaro al team, cosi è stato deciso di chiedere chiarimenti all'azienda tramite il canale di comunicazione Telegram, in modo da poter proseguire con la stesura dell'AdR.

== Organizzazione dei quesiti per il proponente 
Oltre alla richiesta di feedback sull'AdR, il  gruppo ha preparato alcuni quesiti su alcuni dubbi sorti durante la continuazione del lavoro.


= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-3.1], [Continuazione del documento Analisi dei Requisiti],
    [VI-3.2], [Continuazione del documento Norme di Progetto],
    [VI-3.3], [Continuazione del documento Piano di Progetto],
    [VI-3.4], [Finalizzazione dei quesiti per Bluewind],
    [VI-3.5], [Invio quesito su AdR tramite gruppo Telegram a Bluewind],
    [VI-3.6], [Aggiornato Diario di Bordo per incontro 2026-05-15],
    [VI-3.7], [Implementazione sezione Diari di Bordo sul sito],
    
  )
]
== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Verifica avanzamento lavori.
+ Rotazione dei ruoli.
+ Discussione del documento Analisi dei Requisiti, successivamente all'incontro con Bluewind.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-4.1], [Continuazione Analisi dei Requisiti], [Ines Iadadi, Alberto Canavese], [VI-3.1],
    [TD-4.2], [Continuazione Norme di Progetto], [Edis Hodja],[VI-3.2],
    [TD-4.3], [Continuazione Piano di Progetto], [Giovanni Bronte],[VI-3.3],
    [TD-4.4], [Inviato quesito per Bluewind], [Team],[VI-3.5],
    [TD-4.5], [Implementazione sezione Diari di Bordo sul sito], [Team],[VI-3.7]
  )
]