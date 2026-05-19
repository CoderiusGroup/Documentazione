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
      [0.1.0], [2026/05/18], [Filippo Zonta Rocha], [Giovanni Bronte], [Prima stesura del verbale],
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
  data: "18/05/2026",
  ora_inizio: "14:30",
  ora_fine: "16:00",
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
+ Riunione di allineamento per lo sprint
+ Tecnologie adottate

= Svolgimento della Riunione

== Conclusione del documento Analisi dei Requisiti
Durante la riunione, è stata discussa l'importanza di portare a termine l'Analisi dei Requisiti, in quanto rappresenta una base fondamentale per la pianificazione e l'esecuzione delle attività successive.

== Proseguire con la stesura del Piano di qualifica
Si è concordato di proseguire con la stesura del Piano di qualifica, al fine di definire in modo dettagliato le strategie e le metodologie che saranno adottate per garantire la qualità del progetto.

== Realizzazione Mock-up dell'applicazione
Si è deciso di avviare la realizzazione del Mock-up dell'applicazione, al fine di visualizzare concretamente l'interfaccia utente e le funzionalità previste, utlizzando Figma come strumento di design collaborativo.

== Pianificare candidatura RTB
Si è discusso della necessità di pianificare una possibile data per la candidatura del progetto alla proponente per la RTB.

== Rotazione dei ruoli
Seguendo quanto scritto nella Dichiarazione di Impegni, il team ha effettuato una rotazione dei ruoli all'interni per permettere a tutti i membri di acquisire esperienza in diverse aree e responsabilità.

== Discussione delle ore lavorate
Il team si è confrontato sulle ore usate nello sprint 3 per il progetto e la quantità di tempo rimasta per completare il lavoro entro la quantità prefissata dal team nella Dichiarazione di Impegni, in particolar modo è stato discusso il ruolo dell'analista. 

#pagebreak() 

= Conclusione e Decisioni Prese

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-4.1], [Portare a termini l'Analisi dei Requisiti],
    [VE-4.2], [Proseguire con la stesura del Piano di qualifica],
    [VE-4.3], [Realizzazione Mock-up dell'applicazione],
    [VE-4.4], [Pianificare presentazione RTB],
    [VE-4.5], [Rotazione dei ruoli],
    [VE-4.6], [Discussione delle ore lavorate]
  )
]
== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Verifica avanzamento lavori.
+ Pianificazione presentazione RTB al proponente.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-5.1], [Conclusione del documento Analisi dei requisiti], [Filippo Zonta Rocha, \ Leonardo Lorenzin], [VE-4.1],
    [TD-5.2], [Continuazione del documento Piano di qualifica], [Alberto Canavese], [VE-4.2],
    [TD-5.3], [Realizzazione Mock-up dell'applicazione], [Ines Iadadi], [VE-4.3],
    [TD-5.4], [Pianificazione presentazione RTB], [Team], [VE-4.4]
  )
]


