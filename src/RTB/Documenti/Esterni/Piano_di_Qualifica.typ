#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Piano di Progetto], align(right)[Coderius Group],
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  },
)

#set text(font: "Libertinus Serif", size: 12pt, lang: "it")

#set heading(numbering: "1.")

#let scheda-rischio(id, nome, tipo, prob, impatto, prevenzione, risposta) = {
  set text(size: 11pt)
  block(
    width: 100%,
    stroke: 0.5pt + luma(100),
    inset: 0pt,
    clip: true,
    table(
      columns: (5.5cm, 1fr),
      stroke: (x, y) => (
        bottom: 0.5pt + luma(100),
        right: if x == 0 { 0.5pt + luma(10) } else { none },
      ),
      inset: (x: 10pt, y: 7pt),
      fill: (x, _) => if x == 0 { luma(240) } else { none },
      [*Codice*], [#id],
      [*Denominazione*], [#nome],
      [*Categoria*], [#tipo],
      [*Probabilità*], [#prob],
      [*Impatto*], [#impatto],
      [*Prevenzione*], [#prevenzione],
      [*Piano di risposta*], [#risposta],
    ),
  )
  v(0.8em)
}

#let tabella-ore(rows, caption-text: none) = {
  let role-header(name) = rotate(-60deg, reflow: true)[#name]
  figure(
    table(
      columns: (1.6fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, auto),
      align: (left, center, center, center, center, center, center, center),
      stroke: 0.5pt + luma(100),
      table.header(
        [*Componente*],
        role-header[*Responsabile*],
        role-header[*Amministratore*],
        role-header[*Analista*],
        role-header[*Progettista*],
        role-header[*Programmatore*],
        role-header[*Verificatore*],
        role-header[*Totale*],
      ),
      ..rows.flatten(),
    ),
    caption: caption-text,
  )
}

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Piano di Qualifica]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
]
#pagebreak()

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
    [0.1.0], [2026/04/21], [Giovanni Bronte], [], [Prima stesura del documento con sezione 1],
  )
]
#pagebreak()
#show outline.entry.where(level: 1): set block(above: 1.5em)
#show link: underline;
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 3)

#let nota(corpo) = text(size: 8pt, [#corpo])
#pagebreak()

#outline(
  title: [Elenco delle Tabelle],
  target: figure.where(kind: table),
)

#pagebreak()


#outline(
  title: [Elenco delle Figure],
  target: figure.where(kind: image),
)


#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)

= Introduzione

== Scopo del documento
Lo scopo di questo documento è quello di definire le strategie di verifica e validazione adottate dal gruppo Coderius, il quale scopo è quello di monitorare la qualità del software e dei processi correlatti per tutta la durata del progetto.\ 
Il seguente documento si divide in tre componenti essenziali:
- *Piano della Qualità*: Attività del sistema qualità mirate a fissare gli obbiettivi di qualità, insieme con i processi e le risorse necessarie per conseguirli.
- *Controllo della Qualità*: Sono le attività del sistema qualità pianificate e attuate per assicurare che il prodotto soddisfi le attese.
- *Miglioramento continuo*: Attività periodiche che analizzano i risultati, identificano criticità e ottimizzano i processi.
Il Piano di Qualifica dovrà essere revisionato più volte durante il progetto per fare fronte alle esigenze imposte dal committente e dal nostro stesso team per garantire una qualità elevata e un monitoraggio costante dello sviluppo del software.

== Glossario
#v(0.5em)
All'interno del *Piano di Qualifica*, così come negli altri documenti formali, i termini che trovano una definizione specifica nel relativo documento _Glossario_ verranno contrassegnati da una lettera "*G*" maiuscola a pedice (es. Termine#sub[G]). 

Questa convenzione permette al lettore di individuare immediatamente i vocaboli che possiedono un significato particolare nel contesto del progetto, invitandolo a consultarne la definizione per evitare ambiguità riguardo al linguaggio tecnico utilizzato e garantire così una migliore comprensione dei contenuti.

== Riferimenti
#v(0.5em)

=== Riferimenti Normativi
#v(0.5em)
- #link("https://www.math.unipd.it/~tullio/IS-1/2024/Progetto/C1.pdf")[*Capitolato C1 — Automated EN18031 Compliance Verification*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://it.wikipedia.org/wiki/ISO/IEC_9126")[*Standard ISO/IEC 9126*] #nota[(ultimo accesso: 2026-04-04)]

- #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.
pdf")[*Standard ISO/IEC 12207:1995*] #nota[(ultimo accesso: 2026-04-24)]
\
=== Riferimenti Informativi
#v(0.5em)
#list(
  marker: [•],
  indent: 0.5em,
  [Dispense del corso di Ingegneria del Software 2025/2026 riguardanti gli argomenti trattati nel Piano di Qualifica:
    #set list(marker: [-], indent: 1em)
    
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T07.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T09.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T10.pdf") #nota[(ultimo accesso: 2026-04-24)]
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T11.pdf") #nota[(ultimo accesso: 2026-04-24)]
  ]
)
#pagebreak()

= Metriche di qualità