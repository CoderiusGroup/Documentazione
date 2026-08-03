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

  //copertina
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

    // dettagli della riunione
    #grid(
      columns: (1fr, 1fr),
      align: left,
      gutter: 2em,
      [ *Data:* #data \
        *Ora inizio:* #ora_inizio \
        *Ora fine:* #ora_fine \
        *Luogo:* #luogo ]
    )
    #v(4em)
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
      [1.0.0], [2026-07-13], [Leonardo Lorenzin], [], [Approvazione del verbale],
      [0.1.0], [2026-07-13], [Alberto Canavese], [Leonardo Lorenzin], [Prima stesura del verbale],
    )

  ]

  pagebreak()

  //--- indice ---
  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text( weight: "bold")[Indice],
    indent: 2em,
    depth: 3
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  body
}


// =========================================================================
// a meno di modifiche alla tabella di versionamento, tutto il resto va fatto da qui
// =========================================================================

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "13/07/2026",
  ora_inizio: "14:00",
  ora_fine: "17:00",
  luogo: "Canale vocale Discord"
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin


= Ordine del Giorno
+ Preparazione dell'esposizione per l'incontro con il professor Vardanega
+ Palestra personale e studio delle tecnologie in vista della fase di Product Baseline
+ Organizzazione dell'incontro di allineamento con l'azienda Bluewind


= Svolgimento della Riunione

== Preparazione dell'esposizione per l'incontro con il professor Vardanega
A seguito del "semaforo verde" ottenuto dal professor Cardin per la fase di Requirements and Technology Baseline, il team si è riunito per organizzare l'esposizione da presentare nel corso dell'incontro con il professor Vardanega, che costituirà la seconda parte della revisione RTB. La riunione è stata dedicata in larga parte alla preparazione e alla rifinitura di tale presentazione.

Il team ha innanzitutto ripercorso l'esito della revisione con il professor Cardin, così da individuare gli aspetti su cui porre maggiore attenzione durante l'esposizione. Si è quindi proceduto alla suddivisione dei contenuti tra i membri del gruppo, definendo per ciascuno l'argomento da illustrare e la porzione di presentazione di cui curare la stesura. Sono stati inoltre stabiliti l'ordine degli interventi e la tempistica complessiva, in modo da garantire un'esposizione chiara, coerente e contenuta nei tempi previsti.

Il team ha infine concordato di dedicare la parte conclusiva della riunione a una prova generale dell'esposizione, così da uniformare lo stile della presentazione e verificarne la scorrevolezza.

== Palestra personale e studio delle tecnologie in vista della fase di Product Baseline
In prospettiva dell'avvio della fase di Product Baseline, il team ha condiviso la necessità di consolidare le competenze tecniche di ciascun membro attraverso un'attività di palestra personale. Tale attività consiste in un percorso di studio e sperimentazione individuale sulle tecnologie che verranno impiegate nello sviluppo del prodotto, così da affrontare la fase realizzativa con maggiore consapevolezza e ridurre i tempi di apprendimento durante gli sprint successivi.

Il team ha discusso le principali tecnologie individuate nel corso della fase RTB e ha concordato che ciascun membro approfondisca autonomamente gli strumenti e i framework di riferimento, sperimentandone l'utilizzo su piccoli casi d'uso rappresentativi. L'obiettivo è arrivare all'inizio della fase di Product Baseline con una base tecnica comune e condivisa, evitando che eventuali lacune individuali rallentino l'avanzamento complessivo del progetto.

#pagebreak()
== Organizzazione dell'incontro di allineamento con l'azienda Bluewind
Il team ha infine affrontato il tema dell'allineamento con l'azienda proponente Bluewind. Considerata l'imminente transizione verso la fase di Product Baseline, si è ritenuto opportuno pianificare un incontro di allineamento con l'azienda, così da condividere lo stato di avanzamento del progetto, raccogliere eventuali indicazioni aggiuntive e assicurarsi che le scelte adottate siano coerenti con le aspettative della proponente.

È stato pertanto concordato di contattare l'azienda Bluewind per proporre la fissazione di un incontro, comunicando la disponibilità del team e individuando una data compatibile con le esigenze di entrambe le parti.



= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-14.1], [Approvazione della struttura della presentazione e suddivisione delle parti tra i membri per l'incontro con il professor Vardanega],
    [VI-14.2], [Svolgimento della palestra personale e studio delle tecnologie in vista della fase di Product Baseline],
    [VI-14.3], [Contattare l'azienda Bluewind per fissare l'incontro di allineamento],
  )
]
== Ordine del Giorno prossimo incontro
+ Esito dell'incontro con il professor Vardanega
+ Stato di avanzamento della palestra personale e dello studio delle tecnologie
+ Organizzazione delle attività per l'avvio della fase di Product Baseline

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-14.1], [Svolgimento della palestra personale e studio delle tecnologie in vista della fase di Product Baseline], [Team], [VI-14.2],
    [TD-14.2], [Contattare l'azienda Bluewind per fissare l'incontro di allineamento], [Edis Hodja], [VI-14.3],
  )
]
