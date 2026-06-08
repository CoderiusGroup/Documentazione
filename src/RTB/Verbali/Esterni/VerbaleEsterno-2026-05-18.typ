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
    #text(size: 20pt)[*Versione 1.0.1*]
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
      [1.0.1], [2026/06/08], [Filippo Zonta Rocha], [Ines Iadadi], [Correzione numerazione codici decisioni],
      [1.0.0], [2026/05/18], [Giovanni Bronte], [], [Approvazione del verbale],
      [0.1.0], [2026/05/18], [Filippo Zonta Rocha], [Giovanni Bronte], [Prima stesura del verbale]
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
  data: "2026/05/18",
  ora_inizio: "15:00",
  ora_fine: "15:15",
  luogo: "Chiamata Zoom",
  scriba: "Alberto Canavese",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese\n Alessandro Zappia"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin

= Ordine del Giorno
+ Domande e chiarimenti riguardo l'Analisi dei requisiti.

= Svolgimento della Riunione
Durante la riunione, il team ha posto una serie di domande al referente aziendale per chiarire alcuni aspetti specifici dell'Analisi dei Requisiti. Di seguito viene riportato un resoconto dettagliato dello svolgimento della riunione.
== Domande e Risposte
Di seguito vengono riportate le domande poste dal team e le risposte fornite dal referente aziendale.

#heading(level: 3, numbering: none, outlined: false)[1. Dettagli tecnici per dispositivi e asset]
*Domanda:* Quali informazioni tecniche sono previste sia per un dispositivo che per un asset? \
*Risposta:* Per quanto riguarda il dispositivo, non sono necessarie informazioni tecniche aggiuntive, a condizione che il sistema ne garantisca un'identificazione univoca; ogni ulteriore dettaglio è considerato superfluo. Per l'asset, invece, i dati fondamentali richiesti sono: la tipologia, una descrizione e la classificazione esplicita che indichi se l'asset in questione è considerato sensibile o meno.

#heading(level: 3, numbering: none, outlined: false)[2. Gestione e modifica degli asset]
*Domanda:* Il gruppo ha ipotizzato che l'aggiunta o la modifica degli asset avvenga esclusivamente prima dell'avvio del test. Ritenete questa scelta adeguata, oppure preferite che tali operazioni siano consentite anche successivamente? \
*Risposta:* Permettere la modifica degli asset anche in fasi successive è una funzionalità ragionevole, ma richiede un'attenta gestione per lo scenario in cui la modifica avvenga dopo l'esecuzione del test. In linea di principio, una modifica post-esecuzione invalida il test. Si potrebbe tuttavia prevedere un'eccezione, non invalidando i risultati nel caso in cui la correzione riguardi errori minori, come refusi o piccoli aggiustamenti testuali, lasciando in tal caso la responsabilità della scelta all'utente.

#heading(level: 3, numbering: none, outlined: false)[3. Flusso di validazione degli asset]
*Domanda:* Durante l'esecuzione della validazione, preferite che l'utente selezioni manualmente quale asset valutare, oppure che il sistema proceda automaticamente in sequenza? \
*Risposta:* Poiché ogni asset è indipendente dagli altri, l'ordine di esecuzione della valutazione non genera conflitti o dipendenze logiche. Di conseguenza, lasciare all'utente la libertà di selezionare manualmente quale asset validare in un determinato momento è un approccio assolutamente valido.

#heading(level: 3, numbering: none, outlined: false)[4. Esportazione e salvataggio]
*Domanda:* Il gruppo ha valutato di offrire la possibilità di esportare i dati del dispositivo prima della sua eliminazione. Quali formati di file ritenete opportuno supportare? \
*Risposta:* Per il salvataggio o l'esportazione in fase di eliminazione, è sufficiente supportare gli stessi formati già previsti e utilizzati per la fase di importazione.

#heading(level: 3, numbering: none, outlined: false)[5. Scope delle modifiche ai Decision Tree]
*Domanda:* Riguardo alla modifica dei decision tree, essa influenza esclusivamente l'ambiente locale oppure l'intero sistema? \
*Risposta:* Le modifiche apportate ai decision tree possono avere un impatto limitato all'ambiente locale. Vi è accordo tra i referenti tecnici su questa impostazione.

#heading(level: 3, numbering: none, outlined: false)[6. Tempistiche di modifica dei Decision Tree]
*Domanda:* È preferibile che la modifica ai decision tree sia disponibile esclusivamente al termine della valutazione, oppure deve essere accessibile anche durante l'esecuzione del test? \
*Risposta:* La gestione dei decision tree deve essere intesa come indipendente dalla fase di test. Dato che gli standard normativi o i requisiti possono subire variazioni nel tempo, è fondamentale che i decision tree possano essere salvati, aggiornati e modificati. Tale funzionalità, che rimane un requisito opzionale, è utile a prescindere dal momento specifico del flusso di verifica in cui viene richiamata.

#heading(level: 3, numbering: none, outlined: false)[7. Condivisione UI mockup]
*Domanda:* Il gruppo intende realizzare un mockup dell'interfaccia utente e sottoporlo alla vostra valutazione per raccogliere un feedback preliminare. È possibile organizzare una riunione per tale revisione? \
*Risposta:* Sì, la proposta è approvata. Siete invitati a condividere il mockup per permetterci di fornire un feedback in merito all'interfaccia utente.

#pagebreak()


= Conclusione e Decisioni Prese
In conclusione, il proponente si è reso disponibile a fornire feedback sul mockup e sull'Analisi dei Requisiti, pianificando la prossima riunione per il giorno 2026-06-03 alle ore 15:00.


Al termine della riunione, il team si è riunito internamente tramite il canale di comunicazione Discord per discutere le risposte ricevute e consolidarne i contenuti in modo strutturato.

  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-4.1], [Portare a termini l'Analisi dei Requisiti],
    [VE-4.2], [Proseguire con la stesura del Piano di Qualifica],
    [VE-4.3], [Realizzazione mockup dell'applicazione],
  )



= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
  [TD-4.1], [Conclusione del documento Analisi dei Requisiti], [Filippo Zonta Rocha, \ Leonardo Lorenzin], [VE-4.1],
    [TD-4.2], [Continuazione del documento Piano di Qualifica], [Alberto Canavese], [VE-4.2],
    [TD-4.3], [Realizzazione mockup dell'applicazione], [Ines Iadadi], [VE-4.3],
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