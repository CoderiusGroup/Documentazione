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
// Inizio documento
// =========================================================================

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "2026/08/31",
  ora_inizio: "10:00",
  ora_fine: "11:15",
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
+ Assegnazione dei ruoli per lo Sprint 14
+ Aggiornamento sui documenti e sullo stato delle attività
+ Revisione dello stato dell'MVP e delle criticità architetturali
+ Organizzazione delle tempistiche e delle attività da completare
+ Comunicazioni esterne e pianificazione delle prossime azioni


= Svolgimento della Riunione

== Assegnazione dei ruoli per lo Sprint 14
Durante l'incontro, il team ha ricalibrato la suddivisione dei ruoli in vista dello Sprint 14, tenendo conto delle responsabilità da sostenere e della riduzione di ore assegnate al ruolo di progettista e verificatore, già concordata a livello di pianificazione. La nuova distribuzione dei ruoli è stata approvata all'unanimità, con l'obiettivo di garantire un equilibrio tra le responsabilità e le ore disponibili per ciascun membro del team.

== Aggiornamento sui documenti e sullo stato delle attività
Il team ha poi fatto il punto sui documenti in corso di aggiornamento e sulle attività da completare entro la prossima riunione.

Nonostante ciò, questa settimana si è deciso di strutturare un lavoro di aggiornamento di tutta la documentazione, con particolare attenzione alle Norme di Progetto, al Piano di Qualifica, al Piano di Progetto, alla Specifica Tecnica, al sito, al Glossario e al Manuale Utente, con l'obiettivo di raggiungere uno stato conclusivo anche per quest'ultimo documento. In questo contesto, si è rilevata la necessità di correggere alcune incongruenze già individuate dai progettisti dello sprint precedente e di aggiornare anche l'MVP, al fine di allineare meglio il prodotto e la documentazione allo stato attuale del progetto.

Si è concordato di proseguire in modo strutturato, in modo da evitare ritardi nella documentazione e garantire una coerenza continua tra i documenti di progetto e lo stato reale dello sviluppo.

== Revisione dello stato dell'MVP e delle criticità architetturali
La discussione si è concentrata anche sull'MVP e sulle criticità emerse legate alla progettazione del codice. In particolare, il gruppo ha individuato alcuni punti dell'architettura che necessitano di essere corretti per risultare conformi alle richieste espresse durante le lezioni del corso e alle indicazioni metodologiche del progetto. Si è quindi deciso di rivedere le scelte architetturali, con particolare attenzione alla corretta applicazione dei principi dell'OOP e dei principi SOLID, al fine di eliminare le incongruenze emerse.

È stato inoltre deciso di dedicare una sezione specifica al report, inteso come report finale relativo alla valutazione di un dispositivo e dei relativi asset in modo da rendere più chiaro il risultato delle informazioni e del flusso delle risposte della struttura dei requisiti. Sul fronte dell'interfaccia utente, si è stabilito che vada approfondita la parte UI, al fine di migliorare l'esperienza d'uso e allineare meglio il prodotto alla visione del cliente e alle aspettative del team.

== Organizzazione delle tempistiche e delle attività da completare
Il gruppo ha poi pianificato le attività da completare nei tempi rimanenti, con attenzione alle scadenze.

È stato deciso di mantenere una distribuzione chiara dei compiti, in modo da permettere un lavoro parallelo, ridurre i tempi di attesa e favorire una verifica costante del progresso delle singole parti.

== Comunicazioni esterne
L'ultimo punto ha riguardato le comunicazioni esterne, e in particolare la necessità di inviare una mail a BlueWind per chiedere un incontro entro la fine della settimana, con l'obiettivo di mostrare lo stato dell'MVP.

#pagebreak()

= Conclusione e Decisioni Prese
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-20.1], [Aggiornamento della Specifica Tecnica],
    [VI-20.2], [Aggiornamento delle Norme di Progetto e del Piano di Qualifica],
    [VI-20.3], [Aggiornamento del sito e del Glossario],
    [VI-20.4], [Aggiornamento del Piano di Progetto],
    [VI-20.5], [Aggiornamento dell'MVP con sezione dedicata al report e alla UI],
    [VI-20.6], [Contattare BlueWind per l'incontro di revisione],
  )
]

== Ordine del Giorno prossimo incontro
+ Verifica dello stato di avanzamento dei documenti
+ Verifica dello stato di avanzamento dell'MVP
+ Condivisione delle comunicazioni esterne

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-20.1], [Aggiornamento della Specifica Tecnica], [Ines Iadadi, \ Alberto Canavese, \ Edis Hodja], [VI-20.1],
    [TD-20.2], [Aggiornamento delle Norme di Progetto e del Piano di Qualifica], [Filippo Zonta Rocha], [VI-20.2],
    [TD-20.3], [Aggiornamento sito e Glossario], [Edis Hodja], [VI-20.3],
    [TD-20.4], [Aggiornamento del Piano di Progetto], [Giovanni Angelo Marco Bronte], [VI-20.4],
    [TD-20.5], [Aggiornamento dell'MVP: report e UI], [Leonardo Lorenzin, \ Alberto Canavese], [VI-20.5],
    [TD-20.6], [Contattare BlueWind per un incontro esterno], [Giovanni Angelo Marco Bronte], [VI-20.6],
  )
]