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

== Discussione sull'Analisi dei requisiti 
Sono stati analizzati i requisiti verificandone lo stato attuale, le dipendenze con le altre attività e i relativi grafi di tracciabilità. Il documento di trova ai dettagli terminali di redazione.

== Discussione sulle stime e l'automazione per il Piano di qualifica
Sono state discusse le stime per le attività del piano di qualifica, con particolare attenzione all'automazione dei processi di testing e verifica. Si è deciso di testare strumenti di automazione per migliorare l'efficienza e la qualità delle attività di qualifica. Ne prosegue la redazione del documento.

== Aggiornare le Norme di progetto
Sono state discusse le modifiche da apportare alle Norme di Progetto, nello specifico dato l'avanzamento del documento del piano di qualifica, si è reso opportuno nello speicifico aggiornare la sezione della nomenclatura di progetto, in modo da allinearla con le nuove attività e processi introdotti.

== Aggiornarmento Sprint nel Piano di progetto
Vista che si sta avvicinando la fine del 4 Sprint, è stato deciso di aggiornare il piano di progetto con le attività previste per il 5° Sprint, in modo da avere una visione chiara delle prossime fasi di lavoro e garantire una pianificazione efficace.

== Approvazione mail di contatto con il professore Cardin
È stata approvata la bozza di email di contatto con il professore Cardin per avere feedback diretto riguardo la qualità dell' Analisi dei Requisiti in modo da avere il documento pronto per la presentazione del RTB.

== Diario di Bordo per 2026-05-29
È stato discusso e scritto il contenuto per il diario di bordo da presentare nella prossima riunione del 2026-05-29.


#v(0.3cm)

#pagebreak()

= Conclusione e Decisioni Prese

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-7.1], [Portare a termine l'Analisi dei Requisiti],
    [VE-7.2], [Proseguire con la stesura del Piano di qualifica],
    [VE-7.3], [Aggiornare Norme di Progetto],
    [VE-7.4], [Aggiornamento Piano di Progetto],
    [VE-7.5], [Invio comunicazione via mail al Proff.  Cardin],
    [VE-7.6], [Stesura Diario di Bordo]
  )
]
== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione:
+ Verifica dello stato dei task assegnati.
+ Pianificazione delle attività successive.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-7.1], [Conclusione Analisi dei requisiti], [Leonardo Lorenzin], [VI-7.1],
    [TD-7.2], [Continuazione Piano di Qualifica], [Alberto Canavese], [VI-7.2],
    [TD-7.3], [Aggiornare Nomenclatura], [Giovanni Angelo Marco Bronte], [VI-7.3],
    [TD-7.4], [Aggiornamento Piano di Progetto], [Edis Hodja], [VI-7.4],
    [TD-7.5], [Invio comunicazione via mail al Proff. Cardin], [Team], [VI-7.5],
    [TD-7.6], [Stesura Diario di Bordo], [Team], [VI-7.6],

  )
]



