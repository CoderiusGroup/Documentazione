#let verbale(
  titolo: "",
  data: "",
  ora_inizio: "",
  ora_fine: "",
  luogo: "",
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
        align(left)[Verbale Interno],
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
        *Luogo:* #luogo ]
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
      // aggiungi nuova riga quando aggiorni
      [0.1.0], [09/03/2026], [Ines Iadadi], [Edis Hodja], [Prima stesura del verbale],
    )
  ]

  pagebreak()

  //--- indice ---
  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text(weight: "bold")[Indice],
    indent: 2em,
    depth: 3
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  body
}

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "09/03/2026",
  ora_inizio: "9:00",
  ora_fine: "10:30",
  luogo: "Canale Vocale Discord"
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
+ Scelta del nome e del logo del gruppo
+ Discussione dei capitolati
+ Formulazione delle domande da rivolgere ai proponenti
#v(0.5cm)

= Svolgimento della Riunione

== Scelta del nome e del logo del gruppo
Il gruppo ha scelto all'unanimità il nome *Coderius* come identità del team per il progetto di Ingegneria del Software. È stato inoltre approvato il logo ufficiale e definito l'indirizzo email di riferimento: _coderius01\@gmail.com_.

#v(0.3cm)

== Discussione dei capitolati
Il gruppo ha analizzato i capitolati disponibili, confrontandosi sugli aspetti tecnici e organizzativi. L'attenzione si è concentrata sul supporto offerto dalle aziende durante lo sviluppo e sulla valutazione dei pro e dei contro di ciascuna proposta. Si è deciso di approfondire due progetti in particolare: *Automated EN18031 Compliance Verification* proposto da Bluewind e *NEXUM* proposto da Eggon. È emerso un interesse prevalente per il capitolato di Bluewind, ma il gruppo si riserva di raccogliere ulteriori informazioni durante i colloqui prima di ufficializzare la candidatura.

#v(0.3cm)

== Formulazione delle domande da rivolgere ai proponenti
Il gruppo ha redatto una lista di domande tecniche e organizzative da sottoporre ai team di Bluewind ed Eggon durante i rispettivi colloqui conoscitivi. Sono state inoltre redatte e approvate le bozze delle email per richiedere tali incontri.

#v(0.5cm)

= Conclusione e Decisioni Prese
Al termine della riunione è stata creata l'organizzazione GitHub *CoderiusGroup* e sono state inviate le comunicazioni alle aziende Bluewind ed Eggon per fissare gli incontri conoscitivi. 
Si è inoltre deciso di iniziare la stesura del documento di Analisi dei Capitolati, che verrà poi completato e revisionato alla luce delle risposte ottenute dalle aziende.
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-1.1], [Approvazione del nome "Coderius" e del logo ufficiale del gruppo.],
    [VI-1.2], [Apertura dell'organizzazione GitHub "CoderiusGroup" e dell'indirizzo email ufficiale.],
    [VI-1.3], [Decisione di approfondire i capitolati Bluewind ed Eggon tramite colloqui conoscitivi.],
    [VI-1.4], [Inizio della stesura preliminare del documento di Analisi dei Capitolati.]
  )
]
== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione:
+ Definizione del Way of Working.
+ Creazione dei template per i documenti ufficiali.
+ Pianificazione delle attività future.