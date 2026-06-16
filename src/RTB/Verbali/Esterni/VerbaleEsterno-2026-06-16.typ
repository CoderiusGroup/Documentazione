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
      [0.1.0], [2026/06/16], [Ines Iadadi], [], [Prima stesura del verbale]
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
  data: "2026/06/16",
  ora_inizio: "14:00",
  ora_fine: "14:25",
  luogo: "Chiamata online",
  scriba: "Ines Iadadi",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Giovanni Angelo Marco Bronte
- Ines Iadadi

= Ordine del Giorno
+ Raccolta del feedback di Bluewind S.r.l. sull'Analisi dei Requisiti condivisa.
+ Chiarimento della gestione delle modifiche strutturali del decision tree.
+ Conferma della classificazione dei requisiti e dello stack tecnologico.

= Svolgimento della Riunione
La riunione ha avuto come obiettivo principale la raccolta del feedback del proponente sull'ultima versione del documento di Analisi dei Requisiti, con particolare attenzione ai casi d'uso relativi all'esecuzione del decision tree e alla gestione delle modifiche strutturali.

== Feedback sull'Analisi dei Requisiti
Il referente aziendale ha espresso una valutazione positiva sulla struttura generale del documento e sulla chiarezza dei requisiti. È stato sollevato un unico dubbio riguardante UC-22.6 (Modifica delle risposte durante l'esecuzione del decision tree): nella formulazione attuale, la modifica di una risposta comporta l'invalidazione di tutte le risposte successive, che risultava ambiguo in caso l'utente volesse rivalutare un requisito padre di altri. Il team ha chiarito che l'architettura corrente non prevede la rivalutazione dinamica per rami indipendenti, in quanto il sistema è progettato per una valutazione completa a partire dalla radice e renderà più chiaro il testo del caso d'uso.

== Gestione dei Nodi nel Decision Tree
Il proponente ha richiesto chiarimenti sulla gestione dei collegamenti quando un nodo viene inserito o eliminato. Il team ha illustrato che in fase di inserimento le connessioni sono gestite manualmente dall'utente, mentre per l'eliminazione era stata ipotizzata una riorganizzazione automatica da parte del sistema. Il proponente ha preferito che anche l'eliminazione lasci all'utente la gestione manuale dei collegamenti, al fine di evitare inconsistenze strutturali.

Riguardo al nodo radice, il proponente ha confermato che l'impostazione attuale è corretta: deve essere possibile inserire un nodo radice, ma non eliminarlo.

== UC-32.3: Nodo Scollegato
Il team ha illustrato il comportamento previsto dall'UC-32.3: se durante una modifica un nodo rimane privo di rami in uscita, il sistema costringe l'utente ad assegnargli un esito finale, trasformandolo in un nodo foglia. Il proponente ha confermato che tale comportamento è in linea con le aspettative.

== Esportazione del Report
Il team ha richiesto feedback riguardo alla classificazione dei requisiti relativi all'esportazione del report di conformità, classificati come obbligatori. Il proponente ha confermato che è necessario classificare come obbligatorio almeno un formato di esportazione, mentre i formati aggiuntivi possono essere classificati come opzionali o desiderabili.

== Creazione Manuale di Dispositivi e Asset
Il proponente ha confermato che, ai fini del corretto funzionamento della web app, è sufficiente la possibilità di importare i dati tramite file. L'inserimento manuale da interfaccia di dispositivi e asset è da considerarsi una comodità aggiuntiva e deve pertanto essere classificato come desiderabile.

== Conferma dello Stack Tecnologico e della Classificazione dei Requisiti
Il proponente ha confermato e approvato la suddivisione dei requisiti in obbligatori, desiderabili e opzionali adottata nel documento.
Il proponente ha inoltre confermato e approvato lo stack tecnologico proposto dal team: 
- React per il frontend;
- Flask (framework Python) per il backend;
- Docker per il containerization;
- GitHub per il versionamento.  
Il proponente non ha espresso vincoli aggiuntivi sulle tecnologie adottate, confermando che le scelte effettuate dal team sono coerenti con le aspettative e con i requisiti del capitolato.


== Use Case di Modifica del Decision Tree
Il team ha richiesto conferma sugli scenari operativi attesi per i casi d'uso di modifica del decision tree. Il proponente ha indicato di aspettarsi la copertura di: modifica dei testi delle domande, aggiunta o rimozione strutturale dei nodi e ridirezione dei collegamenti per i nodi disconnessi. Il proponente ha confermato che i casi d'uso già redatti coprono pienamente tali necessità.

= Conclusione e Decisioni Prese
L'incontro si è concluso positivamente. Il proponente ha confermato la validità dell'impostazione generale dell'Analisi dei Requisiti e il team ha comunicato l'intenzione di candidarsi per la revisione RTB entro la fine della settimana successiva.

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-6.1], [L'eliminazione di un nodo lascia all'utente la gestione manuale dei collegamenti residui],
    [VE-6.2], [Almeno un formato di esportazione del report deve essere classificato come obbligatorio],
    [VE-6.3], [L'inserimento manuale di dispositivi e asset è classificato come desiderabile],
    [VE-6.4], [Confermata la suddivisione dei requisiti in obbligatori, desiderabili e opzionali],
    [VE-6.5], [Confermato lo stack tecnologico: React, Flask, Docker e GitHub],
  )
]

= TODO
Elenco dei compiti assegnati ai membri del team a seguito della riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-6.1], [Aggiornare l'AdR in conformità alle decisioni prese], [Edis Hodja], [VE-6.1, VE-6.2, VE-6.3],
  )
]

#v(6em)
#align(right)[
  #text(weight: "bold")[Approvazione del Referente Aziendale] \
  #v(3em)
  *Nome:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]\ 
  #h(1.5em)
  #v(2em)
  *Firma:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]
]
