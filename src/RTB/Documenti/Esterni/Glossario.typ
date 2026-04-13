#set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Analisi dei Requisiti],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )

#set text(font: "Libertinus Serif",size: 12pt,lang: "it")

#set heading(numbering: "1.")

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Glossario]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
  #v(3em)
  #text(size: 20pt)[*Versione 0.1.0*]
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
    [0.1.0], [2026/04/11], [Bronte Giovanni], [],[Redazione preliminare del documento]
  )
]
#pagebreak()

#show outline.entry.where(level: 1): set block(above: 1.5em)
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 2)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)


= Introduzione
Lo scopo di questo documento è di tenere in una lista tutte le definizioni e i termini specifici riguardanti al progetto che potrebbero causare ambiguità o dubbi.
Sono esposti in ordine alfabetico per poter facilitare la navigazione del documento.

#pagebreak()

= Abbreviazioni
Qui vengono riportate tutte le abbreviazioni usate nei vari documenti: 
- DT = Decision Tree
- IoT = Internet of things
- RED DA = Radio Equipment Delegated Act
- VI = Verbale interno
- VE = Verbale esterno

#pagebreak()
= A
Asset: Termine inglese che si traduce in "risorsa". Gli asset nel contesto dello standard EN18031 sono: dati in equipaggiamenti, in cui il loro accesso, manipolazione o divulgazione può influenzare sull'apparecchiatura.   

Agile (?)
#pagebreak()
= B
Backend (?)
#pagebreak()
= C
Cybersecurity: È la pratica di proteggere persone, sistemi e dati dagli attacchi informatici utlizzando varie tecnologie, processi e regole. Il RED DA impone i requisiti minimi ad dispositivi radio per proteggere da attacchi esterni i vari asset.

#pagebreak()
= D
Decision Tree: struttura ad albero usata per determinare il successo, fallimento o non applicabilità di un requisito per un determinato asset.\

Dispositivo radio connesso a internet: un dispositivo radio è considerato connesso ad internet se ha un qualunque percorso per i quali passano dei dati che sono trasmessi o ricevuti dalla rete.\

#pagebreak()
= E
EN18031: È una serie ufficiali di standard per il RED DA. È composto da tre standard: 
- EN18031-1 -> 3.3(d) 
- EN18031-2->3.3(e)
- EN18031-3->3.3(f) 

#pagebreak()
= F
FrontEnd(?)

#pagebreak()
= G

#pagebreak()
= H

#pagebreak()
= I
Iot: È l'abbreviazione di Internet of things che fa riferimento all'estensione di internet al mondo degli oggetti e dei luoghi concreti.

#pagebreak()
= J

#pagebreak()
= K

#pagebreak()
= L

#pagebreak()
= M

#pagebreak()
= N

#pagebreak()
= O

#pagebreak()
= P

#pagebreak()
= Q

#pagebreak()
= R
RED DA: Abbreviazione di Radio Equipment Delegated Act, è una legislazione progettata per garantire che gli apparecchi radio venduti nel mercato europeo soddisfino i requisiti in materia di salute, sicurezza e compatibilità elettromagnetica.

#pagebreak()
= S

#pagebreak()
= T

#pagebreak()
= U

#pagebreak()
= V

#pagebreak()
= W

#pagebreak()
= X

#pagebreak()
= Y

#pagebreak()
= Z