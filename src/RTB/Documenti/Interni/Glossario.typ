#import "definizioni.typ": terms

#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Glossario],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
)

#set text(font: "Libertinus Serif", size: 12pt, lang: "it")
#show figure: set figure(supplement: none)

// --- Frontespizio ---
#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Glossario di Progetto \ 2025/2026]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
]

#pagebreak()

// --- Tabella di versionamento ---
#heading(numbering: none, outlined: false)[Tabella di versionamento]
#v(0.5cm)
#align(center)[
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
    [0.1.0], [2026/04/15], [Bronte Giovanni], [Ines Iadadi], [Prima stesura del documento],
  )
]

#pagebreak()

// --- Indice ---
#show outline.entry.where(level: 1): set block(above: 1.5em)
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 2)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)

= Introduzione
Il presente documento ha lo scopo di definire in modo univoco i termini tecnici, le abbreviazioni e i concetti chiave utilizzati nella documentazione di progetto, al fine di garantire la massima chiarezza.

#pagebreak()

#let current-letter = state("current-letter", "")

#for (word, desc) in terms.pairs().sorted(key: it => lower(it.at(0))) {
  let first-letter = upper(word.at(0))
  
  context {
    if first-letter != current-letter.get() {
      current-letter.update(first-letter)
      heading(level: 1, numbering: none)[#first-letter]
    }
  }

  block(width: 100%, breakable: true)[
    *#word*: #desc
  ]
  v(0.8em)
}