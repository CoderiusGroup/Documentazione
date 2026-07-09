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
      [0.1.0], [2026-07-08], [Ines Iadadi], [], [Prima stesura del verbale],
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
  data: "08/07/2026",
  ora_inizio: "13:00",
  ora_fine: "14:30",
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
+ Esito della revisione RTB con il professor Cardin
+ Organizzazione della seconda parte della revisione RTB con il professor Vardanega
+ Rotazione dei ruoli


= Svolgimento della Riunione

== Esito della revisione RTB con il professor Cardin
Il team ha discusso l'esito della revisione RTB tenuta con il professor Cardin, rivelatosi positivo con l'ottenimento del "semaforo verde" per procedere con la seconda parte della RTB. Il professore ha inoltre fornito un feedback relativo all'Analisi dei Requisiti (ADR), segnalando alcune correzioni da apportare al documento. Il team ha concordato di implementare tali correzioni in vista dell'inizio del prossimo sprint.

== Organizzazione della seconda parte della revisione RTB con il professor Vardanega
A seguito dell'esito positivo ottenuto con il professor Cardin, il team ha discusso la suddivisione dei contenuti e la stesura della presentazione per la seconda parte della revisione RTB, questa volta con il professor Vardanega. È stato concordato di contattarlo via mail per fissare la data dell'incontro.

== Rotazione dei ruoli
Il 2026-07-09 si concluderà lo sprint 7 del nostro team. In conformità a quanto stabilito dal way of working adottato, il team ha discusso la rotazione dei ruoli da applicare nel corso dello sprint successivo. Sono stati stabiliti i ruoli che verranno assunti a partire dall'ottavo sprint, con la reintroduzione del ruolo di analista, necessario per effettuare le correzioni all'Analisi dei Requisiti segnalate dal professor Cardin.
#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-13.1], [Contattare il professor Vardanega via mail per fissare l'incontro della revisione RTB],
    [VI-13.2], [Stesura della presentazione per la seconda parte della revisione RTB],
    [VI-13.3], [Apportare le correzioni all'Analisi dei Requisiti],
  )
]
== Ordine del Giorno prossimo incontro
+ Stato di avanzamento della presentazione per la seconda parte della revisione RTB
+ Stato delle correzioni apportate all'Analisi dei Requisiti

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-13.1], [Contattare il professor Vardanega via mail per fissare l'incontro], [Leonardo Lorenzin], [VI-13.1],
    [TD-13.2], [Stesura della presentazione per la seconda parte della revisione RTB], [Team], [VI-13.2],
    [TD-13.3], [Apportare le correzioni all'Analisi dei Requisiti], [Ines Iadadi], [VI-13.3],
  )
]