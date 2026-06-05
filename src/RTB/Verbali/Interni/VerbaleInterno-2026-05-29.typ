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
      [0.1.0], [2026/05/29], [Edis Hodja], [], [Prima stesura del verbale],
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
  data: "2026/05/29",
  ora_inizio: "14:00",
  ora_fine: "15:30",
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
+ Chiarimenti con il professor Cardin su aspetti dell'Analisi dei Requisiti
+ Discussione documentazione e organizzazione interna.
+ Pianificazione attività successive.

#v(0.5cm)

= Svolgimento della Riunione

== Incontro con il professor Cardin 
In seguito all’approvazione della mail di contatto, il team ha concordato con il professor Cardin un incontro tramite Google Meet per il giorno 2026-05-29, dalle 09:00 alle 09:20.

Durante l’incontro con il professor Cardin il team ha presentato alcuni dubbi emersi durante la stesura dell’Analisi dei Requisiti. Il confronto si è concentrato principalmente sulla strutturazione dei casi d’uso, sull'utilizzo delle relazioni di inclusione, estensione e specializzazione, sul livello di dettaglio da adottare nella decomposizione dei casi d’uso più complessi e sulla rappresentazione delle funzionalità condivise tra differenti scenari operativi.

Sono stati inoltre chiariti alcuni aspetti relativi alla modellazione di funzionalità simili in contesti differenti e alla rappresentazione di specifici casi d’uso nei diagrammi UML. Le indicazioni ricevute saranno utilizzate per completare e rifinire l’Analisi dei Requisiti nelle prossime attività di revisione.

== Completamento dell'Analisi dei Requisiti
A seguito del confronto con il professor Cardin, il gruppo ha rivisto alcune sezioni della documentazione relativa all'Analisi dei Requisiti, individuando le principali criticità su cui sarà necessario intervenire per giungere, entro la conclusione del prossimo sprint, a una definizione completa.
Nello specifico, le aree di intervento riguardano il completamento di alcuni Use Case, la gestione della loro decomposizione e l'elaborazione dei diagrammi delle attività.

== Continuazione dello sviluppo del Mock-up
Il gruppo ha definito in modo più preciso le attività da svolgere sul prototipo realizzato con Vite, un tool di sviluppo per applicazioni frontend.

Le scelte progettuali sono state guidate dalle indicazioni emerse nelle fasi precedenti e dai requisiti individuati durante l’Analisi dei Requisiti, con l’obiettivo di realizzare una rappresentazione coerente e il più possibile fedele del prodotto finale atteso.

== Revisione del Piano di Qualifica
Il team ha discusso l’opportunità di procedere a una revisione complessiva del Piano di Qualifica considerando che il documento si trova ormai in fase di completamento. In particolare, è stato ritenuto fondamentale il coinvolgimento di tutti i membri del gruppo per la revisione, con un’attenzione maggiore da parte del Verificatore.

== Rotazione dei ruoli
Seguendo quanto indicato nella Dichiarazione degli Impegni, il team ha riorganizzato i ruoli interni prevedendo una rotazione tra i membri, in modo da consentire a tutti di lavorare sulle attività da completare. È stato inoltre introdotto il ruolo di Programmatore, con il compito di supportare le attività di sviluppo e la realizzazione del codice.

== Pianificazione della candidatura per la RTB
Il team ha discusso e individuato le principali azioni da completare e definito i passaggi organizzativi necessari per assicurare la preparazione della documentazione richiesta, stabilendo una possibile data di consegna della RTB indicativamente nella settimana del 2026-06-08.

#pagebreak()

= Conclusione e Decisioni Prese

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-8.1], [Versione definitiva del documeto relativo all'Analisi dei Requisiti],
    [VI-8.2], [Revisione del Piano di Qualifica e validazione],
    [VI-8.3], [Aggiornare alcune sezioni delle Norme di Progetto],
    [VI-8.4], [Strutturare dei quesiti per l'incontro con BlueWind in data 2026-06-03],
    [VI-8.5], [Redazione della parte iniziale relativa allo Sprint 5],
    [VI-8.6], [Finalizzare il Mock-up da presentare alla proponente],
    [VI-8.7], [Sviluppo del Proof of Concept],
  )
]

== Ordine del Giorno prossimo incontro

Nel prossimo incontro saranno affrontati i seguenti punti:
+ Verifica dello stato di avanzamento dei task assegnati e aggiornamento generale sullo stato individuale.
+ Scelta definitiva riguardo la data di consegna della RTB.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-8.1], [Conclusione degli ultimi UC e diagrammi UML dell'Analisi dei Requisiti], [Giovanni Angelo Marco Bronte], [VI-8.1],
    [TD-8.2], [Conclusione, revisione e validazione del Piano di Qualifica], [Leonardo Lorenzin], [VI-8.2],
    [TD-8.3], [Conclusione e aggiornamento delle ultime sezioni delle Norme di Progetto], [Leonardo Lorenzin], [VI-8.3],
    [TD-8.4], [Domande per l'incontro esterno del 2026-06-03 con la proponente BlueWind], [Team], [VI-8.4],
    [TD-8.5], [Redazione del preventivo dello Sprint 5], [Filippo Zonta Rocha], [VI-8.5],
    [TD-8.6], [Finalizzare il Mock-up da presentare alla proponente], [Alberto Canavese], [VI-8.6],
    [TD-8.7], [Definizione e realizzazione del Proof of Concept], [Edis Hodja], [VI-8.7],
  )
]



