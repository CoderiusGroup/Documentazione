#let verbale(
  titolo: "",
  data: "",
  ora_inizio: "",
  ora_fine: "",
  luogo: "",
  body,
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
          align(left)[Verbale Interno], align(right)[Coderius Group],
        )
        #v(-0.5em)
        #line(length: 100%, stroke: 0.4pt + luma(150))
      ]
    },
  )
  set text(font: "Libertinus Serif", size: 11pt, lang: "it")
  set heading(numbering: "1.1.")

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

    #grid(
      columns: (1fr, 1fr),
      align: left,
      gutter: 2em,
      [ *Data:* #data \
        *Ora inizio:* #ora_inizio \
        *Ora fine:* #ora_fine \
        *Luogo:* #luogo ],
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
      [1.0.0], [2026/05/26], [Giovanni Bronte], [], [Approvazione del verbale],
      [0.2.0], [2026/05/25], [Filippo Zonta Rocha], [Giovanni Bronte], [Aggiornamento contenuto],
      [0.1.0], [2026/05/25], [Filippo Zonta Rocha], [Giovanni Bronte], [Prima stesura del verbale],
    )
  ]

  pagebreak()

  //--- indice ---
  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text(weight: "bold")[Indice],
    indent: 2em,
    depth: 3,
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  body
}


#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "2026/05/25",
  ora_inizio: "14:00",
  ora_fine: "15:00",
  luogo: "Canale Vocale Discord",
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin
#v(0.5cm)

= Ordine del Giorno
+ Discussione documentazione e organizzazione interna.
+ Pianificazione attività successive.

#v(0.5cm)

= Svolgimento della Riunione

== Discussione sull'Analisi dei Requisiti 
Il team ha discusso alcuni punti dell’Analisi dei Requisiti per chiarire i dubbi emersi durante la stesura del documento. Il documento si trova attualmente nelle fasi finali di redazione, anche se permane ancora un confronto interno riguardo alla rappresentazione e all’organizzazione dei diagrammi UML.

== Discussione sulle stime e l'automazione per il Piano di Qualifica
Sono stati discussi diversi aspetti relativi al Piano di Qualifica, con particolare attenzione all’automazione dei processi di testing e di verifica della documentazione. Il team ha discusso sull’adozione di strumenti di automazione finalizzati non solo al supporto delle attività di verifica, ma anche alla raccolta di metriche e valori teorici utili per stimare l’efficienza dei processi di sviluppo, qualità e validazione dei documenti. Prosegue nel frattempo la redazione del documento.

== Aggiornamento delle Norme di Progetto
Il team ha discusso e revisionato diverse sezioni delle Norme di Progetto al fine di mantenerle coerenti con l’evoluzione dell’organizzazione interna e della documentazione prodotta. In particolare, in seguito all’avanzamento dell’Analisi dei Requisiti, è stato accordato l'aggiornamento della sezione relativa alla nomenclatura e alla classificazione dei requisiti, definendo in modo più chiaro la distinzione tra requisiti funzionali obbligatori (RF-Ob), desiderabili (RF-D) e opzionali (RF-Op).

== Approvazione mail per contattare il professor Cardin
Il team ha approvato la bozza dell’email da inviare al professor Cardin al fine di richiedere un riscontro riguardo alla correttezza e alla rappresentazione dei diagrammi UML presenti nell’Analisi dei Requisiti. L’obiettivo è ottenere un feedback diretto prima della RTB, così da poter individuare ed eventualmente correggere tempestivamente possibili errori o incongruenze nel documento.

== Diario di Bordo per 2026-05-29
Il team ha discusso e definito gli aggiornamenti da apportare al Diario di Bordo relativo all’incontro del 2026-05-29, sulla base delle attività svolte nelle due settimane. Durante la discussione sono stati analizzati gli obiettivi raggiunti, le principali problematiche riscontrate nel corso della redazione della documentazione e dell’organizzazione interna del lavoro, nonché i possibili approcci per affrontarle.

È stato inoltre svolto un confronto sui prossimi passi operativi del progetto, con particolare attenzione al completamento dei documenti in vista della RTB e al consolidamento dei diagrammi UML.

#v(0.3cm)


= Conclusione e Decisioni Prese

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-7.1], [Completare il documeto relativo all'Analisi dei Requisiti],
    [VI-7.2], [Proseguire con la stesura del Piano di Qualifica],
    [VI-7.3], [Aggiornare alcune sezioni delle Norme di Progetto],
    [VI-7.4], [Fissare un colloquio di confronto con il professor Cardin],
    [VI-7.5], [Stesura del Diario di Bordo in data 2026-05-29]
  )
]

== Ordine del Giorno prossimo incontro

Nel prossimo incontro saranno affrontati i seguenti punti:
+ Verifica dello stato di avanzamento dei task assegnati e aggiornamento generale sullo stato individuale.
+ Pianificazione di una possibile data per la presentazione della RTB.
+ Discussione e brainstorming riguardo ai mock-up e al materiale dimostrativo da realizzare in vista della RTB.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-7.1], [Conclusione degli ultimi UC e diagrammi UML dell'Analisi dei Requisiti], [Leonardo Lorenzin, \ Filippo Zonta Rocha], [VI-7.1],
    [TD-7.2], [Continuazione del Piano di Qualifica], [Alberto Canavese], [VI-7.2],
    [TD-7.3], [Aggiornarmento delle sezioni descrittive la nomenclatura presente nelle Norme di Progetto], [Alberto Canavese], [VI-7.3],
    [TD-7.4], [Invio comunicazione via mail al professor Cardin per fissare un colloquio di confronto], [Edis Hodja], [VI-7.4],
    [TD-7.5], [Stesura del Diario di Bordo per l'incontro in data 2026-05-29 ], [Team], [VI-7.5],

  )
]



