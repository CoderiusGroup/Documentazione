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
    #v(4em)
    #image("/logoCoderius.jpg", width: 50%)
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
      // aggiungi nuova riga quando aggiorni
      [0.1.0], [2026/03/22], [Leonardo Lorenzin], [], [Prima stesura della lettera di presentazione],
      
      
    )
  ]

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  set par(justify: true, leading: 0.65em)
  
  v(1em)
  [*Lettera di presentazione del gruppo Coderius*]
  
  v(1em)
  [Egregi Professori Vardanega Tullio e Cardin Riccardo\
  Alla cortese attenzione dei referenti di *Bluewind S.r.l.*]

  v(1.5em)
  
  body
  
}


#show: lettera.with(
  titolo: "Lettera di Presentazione",
)

Con la presente, il gruppo *Coderius* intende formalizzare la propria candidatura per la realizzazione del capitolato *C1 - Automated EN18031 Compliance Verification*, proposto da *Bluewind S.r.l.*

La scelta è maturata a seguito di un confronto interno tra i membri del gruppo, che ha valutato questo capitolato il più stimolante e idoneo ai propri interessi. In particolare riteniamo che i temi della sicurezza e della conformità dei sistemi radio rappresentino un'ottima occasione di crescita sotto il punto di vista sia tecnico che professionale, permettendoci di misurarci con uno standard reale e di acquisire nuove conoscenze e competenze inerenti a questo argomento.

#v(1em)
*Piano di lavoro*
#v(0.5em)
Il gruppo *Coderius* garantisce una disponibilità alta e un impegno costante per l'intera durata del capitolato, la cui conclusione è prevista per il giorno *18 Settembre 2026*. Per il raggiungimento di tale traguardo, ogni componente del team si impegna a dedicare *93 ore* produttive individuali, per un monte ore complessivo pari a *558 ore*. Sulla base di quanto scritto, il costo stimato per la realizzazione del progetto ammonta a *10680 €*.


Ulteriori informazioni riguardanti il gruppo e il progetto sono consultabili presso il nostro repository pubblico e sul sito di riferimento:

#set list(indent: 1em, marker: [$-$])
- #link("https://github.com/CoderiusGroup/Documentazione")[#text(fill: blue)[github.com/CoderiusGroup/Documentazione]] \
- #link("https://coderiusgroup.github.io/Documentazione/")[#text(fill: blue)[coderiusgroup.github.io/Documentazione]]


dove sono presenti:
#set list(indent: 1em, marker: [$-$])
- la Lettera di presentazione;
- la Dichiarazione d'impegni;
- l'Analisi dei capitolati e le motivazioni della scelta;
- i Verbali interni di coordinamento;
- i Verbali esterni

#v(2em)
Cordiali Saluti,

#v(1em)
*Il gruppo Coderius*\
Componenti del gruppo:
#set list(indent: 1em, marker: [•])
- Lorenzin Leonardo  [2116434]
- Bronte Giovanni Angelo Marco  [2041845]
- Canavese Alberto  [2076423]
- Hodja Edis  [2116422]
- Zonta Rocha Filippo [1149339]
- Iadadi Ines  [2113175]
