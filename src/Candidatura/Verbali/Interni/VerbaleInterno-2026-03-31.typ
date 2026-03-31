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
      [ *Data:* 2026/03/31 \
        *Ora inizio:* 9:00 \
        *Ora fine:* 9:30 \
        *Luogo:* Canale Vocale Discord ],
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
      [], [2026/03/31], [], [], [],
      [0.1.0], [2026/03/31], [Filippo Zonta Rocha], [], [Prima stesura del verbale],
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
+ Riunione di allineamento a seguito di aggiundicamento appalto.
+ Pianificazione attività successive.


#v(0.5cm)


= Svolgimento della Riunione

== Contatto con l'azienda 
Il gruppo ha discusso su come procedere a seguito dell'aggiudicazione dell' appalto presso Bluewind srl, pianificando di prendere contatto con l'azienda in tempi utili per richiedere un incontro e la documentazione tecnica necessaria per il proseguimento preliminare del progetto.

== Creazione Milestone RTB
E' stato concordato la necessità di creare una milestone dedicata alla fase di Realizzazione.

== Aggiornamento sito e creazione template Diario di Bordo
Si è deciso di aggiornare il sito web del progetto e di creare un template per il Diario di Bordo, al fine di migliorare la comunicazione interna e la documentazione delle attività svolte durante il progetto.



#v(0.3cm)

#pagebreak()



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
    [TD-2.1], [Invio email di contatto con azienda Bluewind srl], [Hodja Edis], [VI-3.1],
    [TD-2.2], [Creare milestone RTB], [Giovanni Angelo Marco Bronte], [VI-3.2],
    [TD-2.3],  [Aggiornamento sito e creazione template Diario di Bordo], [Ines Iadadi],  [VI-3.3],
  )
]



