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
      [0.1.0], [2026/09/09], [Leonardo Lorenzin], [], [Prima stesura della lettera di presentazione],
    )
  ]

  pagebreak()
  set page(margin: (x: 2cm, top: 1.9cm, bottom: 2cm), numbering: "1 / 1")
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

Con la presente, il gruppo *Coderius* desidera comunicare l'intenzione di sottoporsi alla revisione della Product Baseline per il capitolato: 

#align(center, text(12pt)[*C1 - Automated EN18031 Compliance Verification*])

proposto dall'azienda *Bluewind S.r.l.*

In questo periodo il gruppo ha sviluppato il Minimun Viable Product, il quale è stato formalmente accettato dall'azienda come riportato nella sezione 4 del #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Esterni/VerbaleEsterno-2026-05-04_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno])] del 2026-09-04.

È possibile visionare il codice sorgente dell’MVP al seguente indirizzo:

#link("https://github.com/CoderiusGroup/MVP")[#text(fill:blue)[https://github.com/CoderiusGroup/MVP]]

La documentazione prodotta durante questa fase del progetto è disponibile all'interno della nostra repository:

#link("https://github.com/CoderiusGroup/Documentazione")[#text(fill:blue)[https://github.com/CoderiusGroup/Documentazione]]

La documentazione può anche essere visualizzata tramite sito web, per facilitare la consultazione:

#link("https://coderiusgroup.github.io/Documentazione/")[#text(fill:blue)[https://coderiusgroup.github.io/Documentazione/]]

Sono consultabili i seguenti documenti:
#table(
  columns: (50%,50%),
  stroke: none,
  [
 - #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[#underline(text(fill: blue)[Analisi dei Requisiti])] 

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Esterni/Piano_di_Progetto.pdf")[#underline(text(fill: blue)[Piano di Progetto])] 
- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Esterni/Piano_di_Qualifica.pdf")[#underline(text(fill: blue)[Piano di Qualifica])]  
- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Interni/Norme_di_Progetto.pdf")[#underline(text(fill: blue)[Norme di Progetto])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Interni/Glossario.pdf")[#underline(text(fill: blue)[Glossario])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Esterni/Specifica_Tecnica.pdf")[#underline(text(fill: blue)[Specifica Tecnica])]
- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Esterni/Manuale_Utente.pdf")[#underline(text(fill: blue)[Manuale Utente])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Esterni/VerbaleEsterno-2026-07-28_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-07-28])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Esterni/VerbaleEsterno-2026-08-21_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-08-21])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Esterni/VerbaleEsterno-2026-09-04_firmato.pdf")[#underline(text(fill: blue)[Verbale esterno del 2026-09-04])]],
[
- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Interni/VerbaleInterno-2026-07-13.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-07-13])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Interni/VerbaleInterno-2026-07-27.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-07-27])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Interni/VerbaleInterno-2026-08-03.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-08-03])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Interni/VerbaleInterno-2026-08-10.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-08-10])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Interni/VerbaleInterno-2026-08-18.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-08-18])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Interni/VerbaleInterno-2026-08-24.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-08-24])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Interni/VerbaleInterno-2026-08-31.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-08-31])]

- #link("https://coderiusgroup.github.io/Documentazione/docs/PB/Verbali/Interni/VerbaleInterno-2026-09-08.pdf")[#underline(text(fill: blue)[Verbale interno del 2026-09-08])]]
)

#v(1em)
Per la realizzazione del progetto la spesa totale sostenuta risulta essere di *10.405 €* a fornte dei *10.680 €* preventivati durante la candidatura.

Cordiali saluti,

Il gruppo Coderius

Componenti del gruppo:
- Bronte Giovanni Angelo Marco [2041845]
- Canavese Alberto [2076423]
- Hodja Edis [2116422]
- Iadadi Ines [2113175]
- Lorenzin Leonardo [2116434]
- Zonta Rocha Filippo [1149339]