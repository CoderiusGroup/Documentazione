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
      [0.2.0], [2026/04/08], [Leonardo Lorenzin], [Filippo Zonta Rocha], [Correzione refusi],
      [0.1.0], [2026/04/03], [Ines Iadadi], [Leonardo Lorenzin], [Prima stesura del verbale]
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
  data: "2026/04/03",
  ora_inizio: "15:00",
  ora_fine: "15:15",
  luogo: "Chiamata Zoom",
  scriba: "Filippo Zonta Rocha",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin

= Ordine del Giorno
+ Domande riguardanti il progetto in seguito all'aggiudicazione dell'appalto

= Svolgimento della Riunione
La riunione si è focalizzata sul chiarimento di alcuni aspetti del progetto, in particolare riguardo ai requisiti funzionali e non funzionali e alle modalità di comunicazione con l'azienda. Di seguito vengono riportati i punti principali discussi durante l'incontro.

== Domande e Risposte
Di seguito vengono riportate le domande poste dal team e le risposte fornite dal referente aziendale.

#heading(level: 3, numbering: none, outlined: false)[1. Documentazione tecnica]
*Domanda:* Quando sarà possibile ottenere  la documentazione riguardante lo standard e il caso d’uso da voi proposto in modo da approcciare al meglio l’analisi dei requisiti? \
*Risposta:* La documentazione verrà condivisa subito dopo l'incontro tramite un link al cloud aziendale. Il materiale includerà un estratto dello standard EN 18031 e un file Excel di esempio contenente i dati sui dispositivi, gli asset e la struttura iniziale degli alberi decisionali.

#heading(level: 3, numbering: none, outlined: false)[2. Canali di Comunicazione]
*Domanda:* Come concordato in precedenza, le riunioni avverranno con una frequenza di circa 2 settimane, in caso di dubbi urgenti sarebbe possibile creare un canale di comunicazione per ottenere chiarimenti immediati, ad esempio su Telegram? \
*Risposta:* Il referente ha approvato l'uso di Telegram poiché è lo strumento utilizzato internamente dall'azienda. Il gruppo può essere creato dal team aggiungendo entrambi i referenti.

#heading(level: 3, numbering: none, outlined: false)[3. Tecnologie Frontend]
*Domanda:* Non vengono imposti vincoli sulle tecnologie da utilizzare per il frontend. Nonostante ciò, in base alla vostra esperienza, avete dei consigli o delle preferenze? \
*Risposta:* L'azienda non pone alcun vincolo tecnologico. Il consiglio del referente è di utilizzare framework già noti al gruppo per ottimizzare i tempi di sviluppo ed evitare le difficoltà legate all'apprendimento di nuovi strumenti da zero.

#heading(level: 3, numbering: none, outlined: false)[4. Flusso d'Uso dell'Applicazione]
*Domanda:* Come si svolge il flusso d’uso dell’applicazione dal punto di vista dell’utente? \
*Risposta:* Il flusso prevede l'importazione di un file strutturato contenente le informazioni del dispositivo e degli asset. L'utente naviga poi attraverso una User Interface che propone i decision tree per ogni asset. Una volta completato il percorso in base al risultato ottenuto, passato, fallito o non applicabile, si procede all'asset successivo fino alla generazione di un report finale di riepilogo esportabile.


#heading(level: 3, numbering: none, outlined: false)[5. Vincoli Tecnici per l'Applicazione Web-Based]
*Domanda:* In caso decidessimo di procedere con un'applicazione web-based, considerata preferibile, oltre alla compatibilità con più browser, che altre funzionalità o vincoli tecnici dovremmo tenere in considerazione? \
*Risposta:* Il referente ha confermato che l'azienda utilizza internamente sistemi Linux; pertanto, l'applicazione dovrà essere testata e pienamente funzionante in tale ambiente. È stata inoltre sottolineata l'importanza di garantire una gestione robusta della persistenza dei dati. A tal proposito, è stato suggerito l'impiego di tecnologie web standard come il Local Storage, riservandosi di approfondire i dettagli tecnici in un secondo momento.

= Conclusione e Decisioni Prese
In seguito alla discussione è stato fissato un primo incontro di follow-up per il 17 Aprile 2026, durante il quale si discuteranno eventuali dubbi emersi durante l'apprendimento della norma. Il referente aziendale ha espresso la propria disponibilità a fornire supporto continuo tramite il canale Telegram e durante le riunioni programmate.

Al termine della riunione il team si è trovato internamente su Discord per assegnare i ruoli per il primo sprint, della durata di due settimane, stabiliti come segue:

- Alberto Canavese: Responsabile
- Edis Hodja: Analista
- Filippo Zonta Rocha: Verificatore
- Giovanni Angelo Marco Bronte: Analista
- Ines Iadadi: Amministratore
- Leonardo Lorenzin: Verificatore

  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-3.1], [Apprendimento della norma EN 18031],
    [VE-3.2], [Assegnazione dei ruoli per il primo sprint],
    [VE-3.3], [Creazione del canale Telegram per comunicazioni asincrone],
  )


= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-3.1], [Studio e analisi della documentazione fornita riguardo alla norma EN 18031], [Team], [VE-3.1],
    [TD-3.2], [Iniziare la valutazione delle possibili tecnologie per lo sviluppo (web-based)], [Team], [VE-3.2],
    [TD-3.3], [Creazione del canale Telegram e aggiunta dei referenti aziendali], [Edis Hodja], [VE-3.3],
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