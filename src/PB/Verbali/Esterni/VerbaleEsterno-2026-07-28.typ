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
    #image("../../../images/logoCoderius.jpg", width: 50%);
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
    #text(size: 20pt)[*Versione 1.0.0*]
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
  data: "2026/07/28",
  ora_inizio: "15:00",
  ora_fine: "15:15",
  luogo: "Chiamata Zoom",
  scriba: "Alberto Canavese",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin

= Ordine del Giorno
+ Allineamento sull'ingresso nella fase PB (Product Baseline) a seguito del superamento della revisione RTB.
+ Chiarimento sullo scope della modifica dei Decision Tree e sulle modalità di condivisione.
+ Definizione delle responsabilità per la progettazione delle strutture dati di importazione e report.
+ Pianificazione delle modalità di revisione asincrona e dei prossimi passi.

= Svolgimento della Riunione
La riunione ha avuto come obiettivo principale l'allineamento con il referente aziendale a seguito dell'ingresso nella fase di Product Baseline (PB), con particolare attenzione al chiarimento dei requisiti sulla gestione dei Decision Tree e alla definizione delle modalità di validazione della progettazione.

== Domande e Risposte
Di seguito vengono riportate le domande poste dal team e le relative risposte fornite dal referente aziendale.

#heading(level: 3, numbering: none, outlined: false)[1. Scope e sincronizzazione delle modifiche ai Decision Tree]
*Domanda:* Siamo entrati nella fase PB dopo il superamento della fase RTB, abbiamo modificato leggermente l'Analisi dei Requisiti. È risaltato che c’era un'incongruenza all’analisi dei Decision Tree: pensavamo di realizzare un'app che andava in un container locale, ma andava contro l’idea iniziale che la modifica dei DT andava a diffondersi e sincronizzarsi su tutte le istanze dell’app. Quindi abbiamo deciso di non implementare la modifica dei DT, a voi va bene? O preferite solo modifica in locale non distribuita? \
*Risposta:* Mantenere la funzionalità limitandola a una modifica esclusivamente locale è una soluzione considerata valida e preferibile rispetto alla sua rimozione totale. Non è necessario implementare un sistema di sincronizzazione distribuita: la condivisione dei Decision Tree aggiornati può essere gestita esternamente all'applicativo, permettendo agli utenti di esportare i file modificati in locale e distribuirli manualmente agli altri utilizzatori.

#heading(level: 3, numbering: none, outlined: false)[2. Struttura dei file per l'importazione del dispositivo]
*Domanda:* Riguardo la struttura dei file, in quanto c’è l'importazione del dispositivo, volete una struttura decisa da noi o preferite fornirci la struttura e procediamo noi all’implementazione? \
*Risposta:* È preferibile che sia il team di sviluppo a proporre e definire una bozza della struttura dati per i file di importazione. Tale proposta verrà successivamente analizzata e validata congiuntamente con l'azienda.

#heading(level: 3, numbering: none, outlined: false)[3. Struttura del report di conformità]
*Domanda:* Medesima situazione anche interessa anche il report di conformità? \
*Risposta:* Sì, l'approccio è confermato anche per il report di conformità: il team di sviluppo è incaricato di progettarne la struttura, che sarà poi sottoposta a revisione e validazione da parte dell'azienda.

#heading(level: 3, numbering: none, outlined: false)[4. Modalità di revisione e prossimi passi]
*Domanda:* Abbiamo iniziato la progettazione e pensavamo di ricontattarvi quando abbiamo qualcosa di concreto, completo e strutturato. Preferite ricevere le strutture dei file via mail o facciamo tutto durante la prossima call? \
*Risposta:* Se la definizione delle strutture dati (file di importazione e report) sarà pronta a breve, è preferibile inviarne un'anteprima (preview) tramite e-mail. Questo permetterà una valutazione preliminare asincrona, ottimizzando i tempi in vista del prossimo incontro di allineamento, che verrà fissato a valle di questa condivisione.

#pagebreak()

= Conclusione e Decisioni Prese
L'incontro si è concluso con esito positivo, chiarendo lo scope delle funzionalità locali e stabilendo la modalità di lavoro asincrona per la validazione della progettazione delle strutture dati.

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-7.1], [La modifica dei Decision Tree viene mantenuta con ambito esclusivamente locale senza sincronizzazione distribuita],
    [VE-7.2], [La definizione della struttura dati per l'importazione dei dispositivi è affidata al team di sviluppo, previa validazione di Bluewind S.r.l.],
    [VE-7.3], [La definizione della struttura del report di conformità è affidata al team di sviluppo, previa validazione di Bluewind S.r.l.],
    [VE-7.4], [Condivisione asincrona via e-mail delle anteprime delle strutture dati prima di fissare la prossima riunione],
  )
]

= TODO
Elenco dei compiti assegnati ai membri del team in vista delle prossime attività.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-7.1], [Progettazione della bozza della struttura dati JSON per l'importazione del dispositivo], [Alberto Canavese], [VE-7.2],
    [TD-7.3], [Invio delle anteprime via e-mail a Bluewind S.r.l. per revisione asincrona], [Team], [VE-7.4],
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