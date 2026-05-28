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
    #text(size: 20pt)[*Versione 0.1.1*]
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
      [0.1.1], [2026/05/26], [Edis Hodja], [Giovanni Bronte], [Correzione codici e decisione di riferimento],
      [0.1.0], [2026/05/18], [Filippo Zonta Rocha], [Giovanni Bronte], [Prima stesura del verbale],
      // aggiungi nuova riga quando viene aggiornato
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

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "18/05/2026",
  ora_inizio: "14:30",
  ora_fine: "16:00",
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
+ Verifica avanzamento e pianificazione lavori.
+ Riunione di allineamento per lo sprint
+ Tecnologie adottate

= Svolgimento della Riunione

== Conclusione del documento Analisi dei Requisiti
Durante l'incontro si è sottolineata l'importanza di portare a termine l'Analisi dei Requisiti, in quanto rappresenta una base fondamentale per la pianificazione e l'esecuzione delle attività successive. Attualmente, la stesura dei casi d'uso è giunta allo UC-34 (Esportazione Decision Tree). Si è proceduto inoltre a suddividere tra i membri del team il lavoro di modellazione dei diagrammi UML, per i quali è stato scelto di adottare lo strumento PlantUML.

== Proseguimento della stesura del Piano di Qualifica
Il team ha concordato di riprendere e far avanzare la stesura del Piano di Qualifica, al fine di definire dettagliatamente le strategie e le metodologie che verranno adottate per garantire la qualità del progetto. Il documento si trova attualmente nelle fasi iniziali (è stata redatta solo l'introduzione), poiché in precedenza si era scelto di dare priorità al completamento di altri documenti, come le Norme di Progetto.

== Realizzazione Mock-up dell'applicazione
Il gruppo ha evidenziato la necessità di avviare la realizzazione del Mock-up dell'applicazione. Lo scopo è quello di visualizzare concretamente l'interfaccia utente e le funzionalità previste, utilizzando Figma come strumento di design collaborativo. Per questo motivo, si è deciso di inserire la figura del Progettista nella rotazione dei ruoli del corrente sprint.

== Pianificazione presentazione RTB
Il team si è confrontato sulla necessità di pianificare una data per la candidatura del progetto ai committenti in vista della RTB. Stabilire questa scadenza è essenziale per organizzare il lavoro a breve termine e chiudere l'attuale fase di progetto, assicurando il corretto consumo del monte ore preventivato nel documento di Dichiarazione degli Impegni.

== Rotazione dei ruoli
In linea con quanto stabilito nella Dichiarazione degli Impegni e con le pratiche degli sprint precedenti, è stata effettuata una rotazione interna dei ruoli, per permettere a tutti i membri di maturare esperienza in diverse aree di progetto. Come anticipato nel punto sulla realizzazione dei mock-up, si è deciso di introdurre un Progettista al fine di presentare una prima bozza di design dell'applicazione all'azienda nel corso della prossima riunione.

== Analisi e gestione del monte ore
Il team ha valutato le ore impiegate durante il 3° sprint e il tempo a disposizione per rispettare quanto preventivato nella Dichiarazione degli Impegni, ponendo particolare attenzione al ruolo dell'Analista. Poiché il documento di Analisi dei Requisiti è in via di conclusione, il budget orario rimanente per questa figura è ormai limitato. Il gruppo ha pertanto discusso come ottimizzare al meglio la distribuzione delle ore residue.


= Conclusione e Decisioni Prese

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-6.1], [Conclusione del documento Analisi dei Requisiti],
    [VI-6.2], [Proseguimento della stesura del Piano di Qualifica],
    [VI-6.3], [Realizzazione Mock-up dell'applicazione],
    [VI-6.4], [Pianificazione presentazione RTB],
    [VI-6.5], [Rotazione dei ruoli],
    [VI-6.6], [Analisi e gestione del monte ore]
  )
]

== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nella prossima riunione interna:
+ Verifica avanzamento lavori.
+ Pianificazione presentazione RTB al proponente.

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-6.1], [Conclusione del documento Analisi dei Requisiti], [Filippo Zonta Rocha, \ Leonardo Lorenzin], [VI-6.1],
    [TD-6.2], [Continuazione del documento Piano di Qualifica], [Alberto Canavese], [VI-6.2],
    [TD-6.3], [Realizzazione Mock-up dell'applicazione], [Ines Iadadi], [VI-6.3],
    [TD-6.4], [Pianificazione presentazione RTB], [Team], [VI-6.4]
  )
]


