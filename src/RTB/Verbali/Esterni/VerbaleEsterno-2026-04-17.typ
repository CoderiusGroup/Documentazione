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
      [0.2.0], [2026/04/17], [Filippo Zonta Rocha], [Leonardo Lorenzin], [Correzione di errori e refusi presenti nella prima stesura del verbale],
      [0.1.0], [2026/04/17], [Edis Hodja], [Filippo Zonta Rocha], [Prima stesura del verbale]
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
  data: "2026/04/17",
  ora_inizio: "15:00",
  ora_fine: "15:15",
  luogo: "Chiamata Zoom",
  scriba: "Ines Iadadi",
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
+ Domande principalmente riguardanti la documentazione fornita dal proponente tramite il canale di comunicazione Telegram.

= Svolgimento della Riunione
La riunione è stata svolta a seguito dello studio della documentazione tecnica fornita dal proponente, da parte di tutti i membri del team, con il contributo in particolare degli _Analisti_. L’incontro con l’azienda ha lo scopo di chiarire i dubbi emersi, validare la comprensione dei requisiti e approfondire gli aspetti rilevanti per lo sviluppo del progetto.

== Domande e Risposte
Di seguito vengono riportate le domande poste dal team e le risposte fornite dal referente aziendale.

#heading(level: 3, numbering: none, outlined: false)[1. Identificazione del dispositivo]
*Domanda:* È necessario che il sistema identifichi automaticamente il tipo di dispositivo oppure è sufficiente richiedere all’utente il caricamento di un documento con le specifiche tecniche? È previsto anche un form per l’inserimento manuale di tali dati? \
*Risposta:* L'automazione non è necessaria, in quanto le specifiche tecniche hanno una finalità prevalentemente informativa rispetto alla compilazione dei decision tree. Per specifiche tecniche viene inteso ad esempio il sistema operativo utilizzato e altre informazioni di questo tipo specifiche del dispositivo.

#pagebreak()

#heading(level: 3, numbering: none, outlined: false)[2. Categorizzazione e guida introduttiva agli asset]
*Domanda:* Considerato che il flusso principale dell’applicazione è guidare l’utente attraverso i decision tree, ma per poter costruire i decision tree bisogna capire prima quali asset e quanti sono presenti nel dispositivo, è necessario fornire prima una guida introduttiva sulle tipologie di assets (security, network, privacy, financial)? Quali categorie sono previste e qual è il loro numero totale? \
*Risposta:* Una guida può anche non servire perché nel documento che verrà caricato all'inizio e che descrive il dispositivo si ipotizza ci sia una lista di asset relativi a quel dispositivo che sono divisi principalmente in _security asset_ e _network asset_, che sono presenti sostanzialmente nei requisiti forniti e sono divisi in categorie distinte: security function, security parameters, network function, network configuration. \
Alla fine ci saranno quattro tipi in totale con due liste dedicate a security asset e network asset, ciascuno potrà avere uno dei due tipi e uno dei due sottotipi.

#heading(level: 3, numbering: none, outlined: false)[3. Modalità di inserimento degli asset]
*Domanda:* In riferimento al workflow discusso nella riunione precedente: una volta che l’utente ha caricato il documento di specifiche del dispositivo radio, con quale modalità vengono inseriti gli asset? È previsto che vengano aggiunti singolarmente tramite input manuale, importati tramite file in uno dei formati supportati dall’applicazione, o è previsto che il sistema li suggerisca automaticamente? \
*Risposta:* Questo potrebbe rientrare nei requisiti opzionali e possiamo partire da un'idea secondo cui carichiamo tutto col file di configurazione iniziale. Magari col tempo sarà possibile prevedere anche l'inserimento da parte dell'utente che debba caricare un file vuoto o vuole partire da zero senza possedere un file di configurazione e di conseguenza permettergli di crearlo per il dispositivo testato inserendo le informazioni generali manualmente e poi la lista di asset. \ In ogni caso, questo viene considerato un requisito opzionale.

#heading(level: 3, numbering: none, outlined: false)[4. Verifica e lista di riferimento degli asset]
*Domanda:*  Sempre in merito agli asset, è richiesta una verifica della correttezza degli asset inseriti, ovvero una conferma che esistano? In tal caso esiste una lista di riferimento completa degli asset possibili per ciascuna tipologia di dispositivo? \
*Risposta:* No, l'unico controllo possibile è sul tipo, in riferimento ai quattro tipi di cui abbiamo discusso in precedenza. Per cui l'unica verifica fattibile è quella presente nel file di configurazione, quando viene preso in input e si controlla che non ci sia un asset che abbia un tipo differente.\
Riguardo al nome, alla descrizione e a tutti gli altri campi non è presente una lista di riferimento per cui controllare che siano effettivamente validi, perciò ci si affida al fatto che vengano scritti in maniera corretta.


#heading(level: 3, numbering: none, outlined: false)[5. Validazione del tipo di asset in fase di caricamento del file di configurazione]
*Domanda:* Considerato che gli asset possono appartenere a categorie diverse (security, network, ecc.), è prevista una validazione del tipo di ciascun asset in fase di caricamento? Se sì, come verrebbe implementata? \
*Risposta:* Si ipotizza che il file di configurazione del dispositivo sia in un formato strutturato (JSON, XML o simile). All'interno di tale file, ogni asset dovrebbe avere un campo dedicato alla propria tipologia. In fase di caricamento, il sistema effettuerebbe il parsing del file e verificherebbe che il tipo dichiarato per ciascun asset sia tra quelli ammessi. In caso contrario, il sistema blocca il caricamento e mostra un messaggio di errore che segnala la non validità del file, impedendo all'utente di proseguire.


#heading(level: 3, numbering: none, outlined: false)[6. Reperibilità di esempi di documenti tecnici compilati]
*Domanda:* Sareste in grado di fornirci ulteriori esempi di documenti tecnici già compilati o indicarci dove è possibile reperirli? \
*Risposta:* È possibile fornire documenti di esempio, precisando che non è necessario che i dati siano reali, è sufficiente che il flusso risulti corretto. Il punto di partenza è definire la struttura del file di input, dopodiché la lista degli asset e un dispositivo di esempio potranno essere stabiliti congiuntamente oppure elaborati autonomamente dal team di sviluppo, con la libertà di inventare campi laddove necessario.


#heading(level: 3, numbering: none, outlined: false)[7. Tipologie di documenti generati dall'applicazione]
*Domanda:*  Quali sono esattamente i documenti che l’applicazione deve generare? Solo il documento tecnico oppure anche i seguenti:  Technical Documentation, GEC-1 Technical Documentation, Test Plans, Test Reports? \
*Risposta:* L'applicazione non deve generare l'intera documentazione normativa. È sufficiente produrre il documento tecnico di riferimento e sarebbe tuttavia utile prevedere la possibilità di esportare una pagina di riepilogo finale, sotto forma di report.


#heading(level: 3, numbering: none, outlined: false)[8. Caratteristiche degli utenti finali]
*Domanda:*  Il sistema è pensato per un unico tipo di utente o esistono diversi profili? Ce lo chiediamo perché per l’analisi dei requisiti dobbiamo definire le caratteristiche degli utenti e capire il loro livello di familiarità con la normativa.
\
*Risposta:* Il sistema è destinato a un utilizzo interno, pertanto si può assumere che gli utenti abbiano già una certa familiarità con la normativa e con il dominio applicativo.

= Conclusione e Decisioni Prese
In conclusione, il proponente ha richiesto un riscontro in merito alla chiarezza e comprensibilità della norma analizzata, al fine di valutare il livello di allineamento del gruppo rispetto ai contenuti presentati. Il gruppo ha fornito un riscontro complessivamente positivo, ritenendo la norma nel complesso chiara. \
È stata inoltre manifestata la disponibilità a pianificare un successivo incontro, indicativamente dopo il 2026-05-01, per proseguire le attività di confronto e approfondimento.

Al termine della riunione, il team si è riunito internamente tramite il canale di comunicazione, Discord, per discutere le attività da svolgere, con l’obiettivo di allinearsi rispetto a quanto emerso.

  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-4.1], [Approfondimento backend tra Flask e FastAPI],
    [VE-4.2], [Aggiornamento del contenuto e della terminologia all'interno del glossario di progetto],
    [VE-4.3], [Definire un template standard per la creazione delle issue su GitHub],
    [VE-4.4], [Individuazione documenti necessari per la RTB]
  )

#pagebreak()


= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-4.1], [Ricerca e relativo studio dei framework backend tra Flask e FastAPI], [Team], [VE-4.1],
    [TD-4.2], [Aggiornamento della terminologia all'interno del glossario], [Giovanni Bronte], [VE-4.2],
    [TD-4.3], [Stabilire un formato unico e coerente per le issue], [Edis Hodja], [VE-4.3],
    [TD-4.4], [Individuare quali ulteriori documenti è necessario iniziare a produrre in vista della RTB], [Team], [VE-4.4],
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