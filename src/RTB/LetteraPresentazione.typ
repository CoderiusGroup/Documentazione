#let lettera(
  titolo: "",
  data: "",
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
        align(left)[Lettera di presentazione],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )
  set text(font: "Libertinus Serif", size: 11pt, lang: "it")
  set heading(numbering: "1.1.")

  align(center)[
    #v(8em)
    
    #image("/src/images/logoCoderius.jpg", width: 60%)
    
    #line(length: 70%, stroke: 1pt)
    #v(1em)
    
    #text(size: 26pt, weight: "bold")[#titolo]
    
    #v(1em)
    #line(length: 70%, stroke: 1pt)
    
    #v(1.5em)
    
    #text(size: 16pt)[*Gruppo Coderius*] \
    #v(2pt)
    #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
    #v(3em)
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
      [1.0.0], [2026/06/29], [Ines Iadadi], [], [Approvazione della lettera di presentazione],
      [0.1.0], [2026/06/29], [Leonardo Lorenzin], [Ines Iadadi], [Prima stesura della lettera di presentazione],
    )
  ]

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  set par(justify: true, leading: 0.65em)
  
  v(1em)
  [*Lettera di presentazione del gruppo Coderius*]
  
  v(1em)
  [Egregi Professori Vardanega Tullio e Cardin Riccardo,]

  v(1.5em)
  
  body
  
}


#show: lettera.with(
  titolo: "Lettera di Presentazione",
)

Con la presente, il gruppo *Coderius* desidera comunicare l'intenzione di sottoporsi alla revisione di Requirements and Technology Baseline per il capitolato: 

#align(center, text(12pt)[*C1 - Automated EN18031 Compliance Verification*])

proposto dall'azienda *Bluewind S.r.l.*

La documentazione prodotta durante questa fase del progetto è disponibile all'interno della nostra repository:

#link("https://github.com/CoderiusGroup/Documentazione")[#text(fill:blue)[https://github.com/CoderiusGroup/Documentazione]]

La documentazione può anche essere visualizzata tramite sito web, per facilitare la consultazione:

#link("https://coderiusgroup.github.io/Documentazione/")[#text(fill:blue)[https://coderiusgroup.github.io/Documentazione/]]

Sono consultabili i seguenti documenti:
#table(
  columns: (50%,50%),
  stroke: none,
  [
 - #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[#underline(text(fill: blue)[Analisi dei Requisiti])] 

- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Progetto.pdf")[#underline(text(fill: blue)[Piano di Progetto])] 
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Qualifica.pdf")[#underline(text(fill: blue)[Piano di Qualifica])]  
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[#underline(text(fill: blue)[Norme di Progetto])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Glossario.pdf")[#underline(text(fill: blue)[Glossario])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Esterni/VerbaleEsterno-2026-04-03_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-04-03])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Esterni/VerbaleEsterno-2026-04-17_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-04-17])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Esterni/VerbaleEsterno-2026-05-04_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-05-04])]  
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Esterni/VerbaleEsterno-2026-05-18_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-05-18])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Esterni/VerbaleEsterno-2026-06-03_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-06-03])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Esterni/VerbaleEsterno-2026-06-16_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-06-16])]
  ],
  [
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-03-31.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-03-31])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/VerbaleInterno-2026-04-14.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-04-14])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-04-21.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-04-21])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-05-04.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-05-04])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-05-13.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-05-13])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-05-18.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-05-18])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-05-25.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-05-25])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-05-29.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-05-29])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-06-08.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-06-08])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-06-12.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-06-12])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-06-23.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-06-23])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Verbali/Interni/VerbaleInterno-2026-06-26.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-06-26])]
  ]
)

In aggiunta alla documentazione il gruppo *Coderius* ha sviluppato un Proof of Concept, la repository del quale è disponibile al seguente link:

#link("https://github.com/CoderiusGroup/PoC")[#text(fill:blue)[https://github.com/CoderiusGroup/PoC]]



#v(1em)
Infine, riconfermiamo la data ultima di consegna del progetto il *18 Settembre 2026*, con costo stimato di *10 680 €*.

Cordiali saluti,

Il gruppo Coderius

Componenti del gruppo:
- Bronte Giovanni Angelo Marco [2041845]
- Canavese Alberto [2076423]
- Hodja Edis [2116422]
- Iadadi Ines [2113175]
- Lorenzin Leonardo [2116434]
- Zonta Rocha Filippo [1149339]