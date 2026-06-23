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
      [0.1.0], [2026-06-23], [Giovanni Bronte], [], [Prima stesura del verbale],
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
  data: "23/06/2026",
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
+ Confronto sullo stato della documentazione e sull'organizzazione del lavoro 
+ Discussione sui documenti da completare per RTB


= Svolgimento della Riunione

== Discussione sullo stato della documentazione
Il team ha discusso sullo stato dei documenti necessari per la candidatura a RTB, i documenti in questione sono: Analisi dei Requisiti, Piano di Qualifica, Piano di Progetto e Norme di Progetto. Tutti i documenti elencati sono molto vicini ad essere pronti per l'approvazione finale. Il team ha deciso che mancano solo le ultime modifiche riguardanti AdR, segnalate dall'azienda proponente durante il verbale esterno del 2026-06-16. Queste modifiche apporteranno dei cambiamenti ai requisiti dell'AdR, i quali dovranno essere modificati anche nei documenti PdP e PdQ, nelle sezioni apposite.

== Aggiornamento del Glossario
Prosegue l'aggiornamento del Glossario in quanto è un altro documento fondamentale per il progetto dato che raccoglie tutti i termini tecnici, abbreviazioni e concetti al fine di garantire la massima chiarezza. In questo sprint il team si concentra sul controllo delle definizioni inserite e sull'aggiunta di eventuali termini che potrebbero causare confusione senza una definizione precisa.

== Stesura presentazione per le tecnologie scelte 
Per l'RTB è prevista la presentazione delle varie tecnologie scelte dal team per sviluppare il Proof of Concept e il software finale del progetto, da presentare durante il PB. Il team ha quindi assegnato all'amministratore di questo sprint il compito di stendere questa presentazione data la vicinanza alla candidatura dell'RTB.

== Conclusione Proof of Concept
Il Proof of Concept è molto vicino all'approvazione finale, per questo il team ha discusso sulle ultime modifiche da fare riguardanti l'eseguibile in modo che sia pronto per la sua presentazione durante l'RTB.

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-11.1], [Approvazione Analisi dei Requisiti],
    [VI-11.2], [Approvazione Norme di Progetto],
    [VI-11.3], [Approvazione Piano di Progetto],
    [VI-11.4], [Approvazione Piano di Qualifica],
    [VI-11.5], [Conclusione Proof of Concept],
    [VI-11.6], [Stesura presentazione delle tecnologie scelte],
    [VI-11.7], [Aggiornamento Glossario],
    [VI-11.8], [Invio Lettera di candidatura RTB]
    
  )
]
== Ordine del Giorno prossimo incontro
+ Resoconto dello stato di avanzamento delle attività conclusive prima della consegna definitiva

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-11.1], [Approvazione Analisi dei Requisiti], [Edis Hodja,\ Leonardo Lorenzin], [VI-11.1],
    [TD-11.2], [Approvazione Norme di Progetto], [Edis Hodja,\ Leonardo Lorenzin],[VI-11.2],
    [TD-11.3], [Approvazione Piano di Progetto], [Edis Hodja,\ Leonardo Lorenzin],[VI-11.3],
    [TD-11.4], [Approvazione Piano di Qualifica], [Edis Hodja,\ Leonardo Lorenzin],[VI-11.4],
    [TD-11.5], [Conclusione Proof of Concept], [Ines Iadadi,\ Filippo Zonta Rocha],[VI-11.5],
    [TD-11.6], [Stesura presentazione delle tecnologie scelte], [Bronte Giovanni],[VI-11.6],
    [TD-11.7], [Aggiornamento Glossario], [Edis Hodja,\ Leonardo Lorenzin],[VI-11.7],
    [TD-11.8], [Invio Lettera di candidatura RTB], [Alberto Canavese],[VI-11.8]
  )
]