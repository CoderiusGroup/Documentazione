#let verbale_esterno(
  titolo: "",
  data: "",
  ora_inizio: "",
  ora_fine: "",
  luogo: "",
  azienda: "",
  scriba: "",
  partecipanti_esterni: "",
  body
) = {
  set document(title: titolo, author: "Coderius")
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[Verbale Esterno],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )
  set text(font: "Libertinus Serif", size: 11pt, lang: "it")
  set heading(numbering: "1.1.")

  // --- COPERTINA ---
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
    #v(2em)
    #text(size: 1.6em, weight: "bold")[Incontro con #azienda]
    #v(4em)
  ]
  pagebreak()

  // --- INDICE ---
  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text(weight: "bold")[Indice],
    indent: 2em,
    depth: 3
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)

  // --- INFORMAZIONI GENERALI ---
  heading[Informazioni Generali]
  v(1em)
  grid(
    columns: (130pt, 1fr),
    align: left,
    gutter: 1.2em,
    [*Data:*], [#data],
    [*Ora inizio:*], [#ora_inizio],
    [*Ora fine:*], [#ora_fine],
    [*Luogo:*], [#luogo],
    [*Scriba:*], [#scriba],
    [*Azienda:*], [#azienda],
    [*Partecipanti Esterni:*], [#partecipanti_esterni]
  )
  v(2em)
  body
}
#show: verbale_esterno.with(
  titolo: "Verbale Riunione Esterna",
  data: "2026/09/04",
  ora_inizio: "15:00",
  ora_fine: "15:30",
  luogo: "Chiamata Zoom",
  scriba: "Alberto Canavese",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese, Alessandro Zappia"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin

= Ordine del Giorno
+ Presentazione dell'MVP.
+ Illustrazione della struttura del codice.
+ Retrospettiva del team.

= Svolgimento della Riunione
La riunione ha avuto come obiettivo la presentazione del Minimum Viable Product alla proponente e la raccolta del suo feedback.

== Presentazione dell'MVP
Il team ha presentato tramite condivisione schermo una dimostrazione live dell'MVP dell'applicazione web, illustrandone tutte le funzionalità sviluppate.

In merito all'importazione di sessioni di valutazione salvate, è stato chiarito che le risposte di un decision tree già confermato non sono più modificabili e che la rivalutazione è possibile solo per i decision tree ancora in corso d'opera, come stabilito nelle riunioni precedenti. 

Riguardo alla gestione strutturale dei decision tree, il team ha specificato di aver realizzato le sole funzioni di importazione, esportazione ed eliminazione. I requisiti opzionali relativi alla modifica dei decision tree non sono stati implementati, in quanto il gruppo ha scelto di concentrarsi sulla solidità dei requisiti obbligatori e desiderabili.

== Illustrazione della struttura del codice
Il team ha presentato ai referenti di Bluewind la repository del MVP, illustrando l'organizzazione architetturale del prodotto e in particolare la separazione fra frontend e backend. Sono state inoltre esposte le tecnologie adottate, come documentate nella Specifica Tecnica.
È stato concordato che il team fornirà ai referenti il collegamento alla repository, così da consentire loro l'accesso diretto al codice sorgente.


== Retrospettiva del Team
Su richiesta della proponente, il team ha delineato un bilancio ampiamente positivo dell'esperienza. L'utilizzo di nuove tecnologie e l'ambiente stimolante hanno favorito la coesione del gruppo, rafforzata anche dal confronto costruttivo interno.


= Conclusione 
L'incontro si è concluso con esito positivo: i referenti di Bluewind hanno valutato positivamente l'MVP, confermando che l'applicativo soddisfa pienamente i requisiti concordati. 



#v(6em)
#align(right)[
  #text(weight: "bold")[Approvazione del Referente Aziendale] \
  #v(3em)
  *Nome:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]\ #h(1.5em)
  #v(2em)
  *Firma:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]
]