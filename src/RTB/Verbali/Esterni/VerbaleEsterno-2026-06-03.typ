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
      [0.1.0], [2026/06/03], [Alberto Canavese], [], [Prima stesura del verbale]
    )
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
// =========================================================================
// a meno di modifiche alla tabella di versionamento, tutto il resto va fatto da qui
// =========================================================================

#show: verbale_esterno.with(
  titolo: "Verbale Riunione Esterna",
  data: "2026/06/03",
  ora_inizio: "15:00",
  ora_fine: "15:15",
  luogo: "Chiamata Zoom",
  scriba: "Edis Hodja",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Leonardo Lorenzin

= Ordine del Giorno
+ Presentazione del mockup interattivo dell'applicazione.
+ Raccolta del feedback del proponente sull'interfaccia utente (UI/UX).
+ Pianificazione della condivisione del documento di Analisi dei Requisiti.

= Svolgimento della Riunione
La riunione è stata dedicata alla presentazione dei primi avanzamenti relativi all'interfaccia dell'applicazione e alla pianificazione della condivisione della documentazione con il proponente. Di seguito viene riportato un resoconto dello svolgimento dell'incontro.

== Presentazione del Mockup
Il team ha presentato al proponente un mockup interattivo dell'applicazione, realizzato utilizzando Vite. La dimostrazione ha permesso di illustrare concretamente le scelte di navigazione e di interazione previste per il prodotto.

== Feedback sull'Interfaccia Utente
Il referente aziendale, Tobia Fiorese, ha espresso apprezzamento per la semplicità della soluzione proposta, confermando che la direzione intrapresa per la UI/UX è corretta e suggerendo di proseguire lungo questa linea di sviluppo.

== Condivisione dell'Analisi dei Requisiti
Il team ha comunicato al referente che nei prossimi giorni verrà inviata una prima versione del documento di Analisi dei Requisiti. È stato inoltre richiesto a Bluewind di indicare, a seguito della lettura del documento, se ritenga necessaria un'ulteriore call di allineamento prima della scadenza della RTB oppure se sarà sufficiente un feedback asincrono fornito per iscritto.

= Conclusione e Decisioni Prese
L'incontro si è concluso con esito positivo: il proponente ha confermato la bontà dell'approccio adottato per l'interfaccia utente e si è reso disponibile a fornire un feedback sull'Analisi dei Requisiti una volta ricevuto il documento.

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-5.1], [Conferma della direzione adottata per la UI/UX, da proseguire nello sviluppo],
    [VE-5.2], [Invio al proponente della prima versione dell'Analisi dei Requisiti nei prossimi giorni],
    [VE-5.3], [Avvio della realizzazione del Proof of Concept],
  )
]

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-5.1], [Invio del documento "Analisi dei Requisiti" a Bluewind S.r.l.], [Giovanni Angelo Marco Bronte], [VE-5.2],
    [TD-5.2], [Realizzazione del documento "Proof of Concept"], [Edis Hodja], [VE-5.3],
  )
]

#v(6em)
#align(right)[
  #text(weight: "bold")[Approvazione del Referente Aziendale] \
  #v(3em)
  *Nome:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]\ #h(1.5em)
  #v(2em)
  *Firma:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]
]
