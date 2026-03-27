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
      [1.0.0], [27/03/2026], [Leonardo Lorenzin], [], [Approvazione verbale],
      [0.1.0], [25/03/2026], [Alberto Canavese], [Leonardo Lorenzin], [Prima stesura del verbale],
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
  data: "2026/03/25",
  ora_inizio: "09:00",
  ora_fine: "10:30",
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
+ Approvazione strumenti organizzativi e di tracciamento
+ Interventi sul sito web della documentazione
+ Approvazione e invio della candidatura ufficiale
+ Definizione ufficiale dei messaggi di commit
#v(0.5cm)


= Svolgimento della Riunione

== Approvazione strumenti organizzativi e di tracciamento
Il gruppo ha discusso la necessità di adottare strumenti idonei per la gestione ottimale dei task. È stata approvata la creazione e l'adozione di un *Issue Tracking System* (ITS) per tracciare i TODO di progetto. Inoltre, per migliorare la tracciabilità delle singole azioni decise durante gli incontri, si è stabilito di aggiungere una sezione "*TODO*" dedicata all'interno del template dei verbali interni.

#v(0.3cm)

== Interventi sul sito web della documentazione
Il gruppo ha analizzato lo stato del sito web destinato a ospitare la documentazione del progetto, prendendo atto della necessità di apportare alcune modifiche sia strutturali che contenutistiche alla piattaforma.

#v(0.3cm)

== Approvazione e invio della candidatura ufficiale
I documenti redatti per la candidatura sono stati visionati e validati collettivamente. A valle dell'approvazione, il gruppo ha autorizzato l'invio ufficiale della comunicazione via email ai professori referenti.

#v(0.3cm)

== Definizione ufficiale dei messaggi di commit
Al fine di garantire standardizzazione nel repository di progetto, il gruppo ha approvato una convenzione ufficiale per i messaggi di commit, imponendo l'uso esclusivo dei prefissi "*fix*", "*update*" e "*new*".

#v(0.5cm)
#pagebreak()

= Conclusione e Decisioni Prese
Al termine della riunione sono state formalizzate le seguenti decisioni operative in base a quanto discusso:
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-3.1], [Adozione e creazione di un Issue Tracking System (ITS).],
    [VI-3.2], [Integrazione di una sezione "TODO" nel template dei verbali interni.],
    [VI-3.3], [Approvazione delle modifiche necessarie per il sito web della documentazione.],
    [VI-3.4], [Approvazione dei documenti e del conseguente invio della candidatura ufficiale.],
    [VI-3.5], [Adozione della convenzione "fix", "update", "new" per i messaggi di commit.],
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
    [TD-3.1], [Creazione ITS e gestione issue per tracciamento TODO], [Ines Iadadi], [VI-3.1],
    [TD-3.2], [Aggiunta sezione TODO nei verbali interni per tracciabilità], [Alberto Canavese], [VI-3.2],
    [TD-3.3], [Modifiche al sito web della documentazione], [Ines Iadadi], [VI-3.3],
    [TD-3.4], [Invio della candidatura ufficiale tramite mail], [Giovanni Angelo Marco Bronte], [VI-3.4],
  )
]
