#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Analisi dei Requisiti], align(right)[Coderius Group],
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  },
)

#set text(font: "Libertinus Serif", size: 12pt, lang: "it")

#set heading(numbering: "1.1.")
#show link: it => underline(text(fill: blue, it))
#show figure: set figure(supplement: none)

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Analisi dei Requisiti]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*]
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
  #v(3em)
  #text(size: 20pt)[*Versione 0.7.0*]
]

#pagebreak()

#heading(numbering: none, outlined: false)[Tabella di versionamento]
#v(0.5cm)
#align(center)[
  #table(
    columns: (auto, auto, auto, 0.5fr, 1fr),
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
    [0.7.0], [2026/06/12], [Giovanni Bronte], [], [Modifiche a sintassi di alcuni UC, aggiunta di link mancanti e modificati alcuni UC nei requisiti],
    [0.6.0], [2026/06/05], [Ines Iadadi], [], [Eliminato UC-44, revisione generale del documento e applicate correzioni ai diagrammi UML],
    [0.5.4], [2026/06/04], [Giovanni Bronte], [Ines Iadadi], [Modificati vari UC da obbligatori a desiderabili],
    [0.5.3], [2026/06/03], [Giovanni Bronte], [Ines Iadadi], [Caricamento dei diagrammi UML],
    [0.5.2], [2026/06/03], [Giovanni Bronte], [Ines Iadadi], [Aggiunti UC-43 e UC-44, modificato UC-31],
    [0.5.1], [2026/05/28], [Leonardo Lorenzin], [Giovanni Bronte], [Aggiornamento sezioni e correzione refusi],
    [0.5.0], [2026/05/26], [Leonardo Lorenzin], [Giovanni Bronte], [Aggiunta sezione 4 Requisiti],
    [0.4.0], [2026/05/22], [Leonardo Lorenzin], [Giovanni Bronte], [Integrazione casi d'uso: da UC-35 a UC-42 ],
    [0.3.0], [2026/05/20], [Leonardo Lorenzin], [Giovanni Bronte], [Aggiornamento sezioni e correzione refusi],
    [0.2.2], [2026/05/15], [Ines Iadadi], [Leonardo Lorenzin], [Integrazione casi d'uso: da UC-27 a UC-34],
    [0.2.1], [2026/05/14], [Alberto Canavese], [Leonardo Lorenzin], [Aggiornamento struttura del documento fino al UC-27],
    [0.2.0], [2026/05/05], [Ines Iadadi], [Leonardo Lorenzin], [Aggiornamento struttura del documento fino al UC-18],
    [0.1.6], [2026/04/30], [Ines Iadadi], [Alberto Canavese], [Integrazione casi d'uso: da UC-22 a UC-25],
    [0.1.5], [2026/04/28], [Edis Hodja], [Alberto Canavese], [Aggiornamento UML e struttura della documentazione.],
    [0.1.4], [2026/04/24], [Giovanni Bronte], [Filippo Zonta Rocha], [Integrazione casi d'uso: da UC-2 a UC-7 e UC-18 con le appropriate sottosezioni e diagrammi UML. Modificate le numerazioni di vari use case  assieme ai loro diagrammi UML],
    [0.1.3], [2026/04/21], [Giovanni Bronte], [Filippo Zonta Rocha], [Integrazione casi d'uso: UC9 a UC13],
    [0.1.2], [2026/04/13], [Edis Hodja], [Filippo Zonta Rocha], [Integrazione casi d'uso: UC1 a UC8],
    [0.1.1], [2026/04/10], [Edis Hodja], [Filippo Zonta Rocha], [Integrazione descrizione del prodotto],
    [0.1.0], [2026/04/07], [Edis Hodja], [Filippo Zonta Rocha], [Redazione preliminare del documento],
  )
]
#pagebreak()

#show outline.entry.where(level: 1): set block(above: 1.5em)
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 5)

#outline(
  title: [Elenco delle Figure],
  target: figure.where(kind: image),
)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)

= Introduzione

== Scopo
#v(1em)
Il presente documento ha lo scopo di descrivere in maniera chiara e strutturata i requisiti del sistema software da sviluppare, a partire dall’analisi delle esigenze individuate nel contesto progettuale.

La definizione dei requisiti si basa sullo studio preliminare della documentazione fornita dal proponente, con particolare attenzione allo standard _EN 18031_, per individuare le funzionalità richieste e le modalità di interazione tra utente e sistema.

Il documento costituisce un riferimento fondamentale lungo l’intero ciclo di vita del progetto, supportando le attività di progettazione, sviluppo e verifica.

Il documento di Analisi dei Requisiti è redatto dagli _Analisti_ del gruppo ed è destinato a diverse categorie di stakeholder:
- al committente, che può verificare la corretta interpretazione delle esigenze espresse;
- al team di sviluppo, per il quale rappresenta una guida operativa durante la realizzazione del sistema;
- al team di verifica, che utilizzerà le informazioni contenute per definire i criteri di validazione e accertare la conformità del prodotto ai requisiti stabiliti.
In considerazione della natura incrementale del processo di sviluppo adottato, il documento sarà soggetto a revisioni periodiche, al fine di recepire eventuali aggiornamenti o modifiche dei requisiti.

== Glossario
Per garantire che ogni termine tecnico sia compreso correttamente e per evitare qualsiasi confusione, la documentazione è supportata da un glossario che raccoglie le definizioni dei vocaboli più specifici. Le parole incluse in questo elenco sono segnalate nel testo dalla lettera G posta a pedice (parola#sub[G]). Cliccando su questo simbolo, l'utente viene indirizzato alla sezione della pagina web del glossario dove può consultare la definizione del termine cercato.


== Riferimenti
Il presente documento è stato redatto facendo riferimento, ove applicabile, alle linee guida per la specifica dei requisiti software definite dallo standard IEEE 830:1998, adattandone struttura e contenuti alle esigenze del progetto.

Sono state inoltre considerate le indicazioni metodologiche fornite nell’ambito del corso di Ingegneria del Software, al fine di garantire coerenza nella definizione, organizzazione e tracciabilità dei requisiti.

#heading(level: 3, numbering: none)[Riferimenti Normativi]
#v(2pt)
- #text(blue)[#underline(link(
    "https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1p.pdf",
  )[C1: Automated EN18031 Compliance Verification - Bluewind S.r.l.])]
#v(2pt)
- #text(blue)[#underline(link(
    "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf",
  )[Regolamento del Progetto Didattico a.a. 2025-2026])]
#v(2pt)

#heading(level: 3, numbering: none)[Riferimenti Informativi]
#v(2pt)
- #text(blue)[#underline([Glossario di Progetto])] //da aggiungere quando si inizierà la stesura
#v(2pt)
- Dispense del corso di Ingegneria del Software 2025/2026:#v(1pt)
  - #text(blue)[#underline(link(
      "https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf",
    )[Analisi dei Requisiti])] #v(3pt)
  - #text(blue)[#underline(link(
      "https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf",
    )[Diagrammi degli Use Case (UML)])] #v(3pt)
  - #text(blue)[#underline(link(
      "https://kurzy.kpi.fei.tuke.sk/zsi/resources/CockburnBookDraft.pdf",
    )[A. Cockburn, Writing Effective Use Cases])] #v(3pt)
  - #text(blue)[#underline(link("https://www.omg.org/spec/UML/2.5.1/PDF")[OMG UML 2.5.1 Specification])]

= Descrizione del prodotto

== Panoramica
#v(1em)
Il software oggetto di sviluppo è un’applicazione web finalizzata alla verifica della conformità di dispositivi connessi ai requisiti di sicurezza definiti dallo standard EN 18031.

Il sistema si basa sull’utilizzo di decision tree che guidano l’utente attraverso una sequenza strutturata di domande, al fine di valutare l’implementazione di specifici meccanismi di sicurezza, quali autenticazione e controllo degli accessi. Tali verifiche consentono di determinare se il dispositivo analizzato soddisfa i requisiti previsti dalla normativa.

Il contesto di applicazione è quello dei dispositivi IoT e delle apparecchiature radio connesse, che devono rispettare i requisiti introdotti dalla direttiva RED in ambito di sicurezza informatica. In questo scenario, la complessità e la natura interconnessa dei requisiti rendono difficoltosa una valutazione manuale da parte dell'utente finale.

L’applicazione nasce quindi con l’obiettivo di semplificare il processo di analisi, offrendo uno strumento dedicato che consenta di:
- identificare i requisiti applicabili;
- guidare l’utente nella valutazione tramite decision tree;
- fornire un esito finale di conformità (PASS, FAIL, NOT APPLICABLE).

Il sistema si propone di rendere il processo di verifica più strutturato, tracciabile e accessibile, supportando sia utenti esperti sia utenti con conoscenze limitate del dominio normativo.

== Funzionalità
#v(1em)
Il prodotto da realizzare deve fornire un insieme di funzionalità volte a supportare l’utente nel processo di verifica della conformità ai requisiti dello standard EN 18031, garantendo un’interazione semplice e guidata.

In particolare, il sistema dovrà consentire:

- la possibilità di importare o inserire i dati relativi al dispositivo da analizzare, necessari per l’avvio del processo di verifica;

- la possibilità di individuare e selezionare i requisiti applicabili in base alle caratteristiche del sistema in esame;

- la possibilità di navigare in modo chiaro e strutturato all’interno dei decision tree associati ai requisiti, seguendo un percorso guidato basato su domande;

- la possibilità di visualizzare in tempo reale lo stato della verifica e il percorso seguito all’interno del decision tree;

- la possibilità di ottenere un esito finale per ciascun requisito analizzato, espresso in termini di PASS, FAIL o NOT APPLICABLE;

- la possibilità di consultare e riesaminare le risposte fornite, al fine di comprendere e giustificare il risultato ottenuto;

Il sistema dovrà inoltre garantire un’esperienza d’uso fluida e intuitiva, facilitando la comprensione dei requisiti anche da parte di utenti non esperti del dominio normativo e supportando efficacemente l’intero processo di valutazione.

== Classificazione degli utenti
Gli utenti del sistema possono essere classificati in base al livello di competenze tecniche e alla familiarità con il dominio della sicurezza informatica e delle normative europee.

La categoria principale di riferimento è costituita da utenti esperti, quali professionisti del settore della cybersecurity, consulenti o tecnici coinvolti nei processi di verifica della conformità normativa.

Il sistema può essere utilizzato anche da utenti con competenze tecniche intermedie, che pur non avendo una conoscenza approfondita della normativa, con l’applicazione viene fornito un supporto guidato attraverso l’utilizzo di _decision tree_, semplificando il processo di verifica.

== Vincoli generali
#v(1em)
Lo sviluppo, l'architettura e l'utilizzo del sistema sono soggetti a determinati vincoli tecnici e operativi, in particolare:
- *Vincoli tecnologici e di piattaforma*: il sistema deve essere sviluppato sotto forma di applicazione web interattiva, accessibile e pienamente funzionante tramite i principali browser moderni (Google Chrome, Mozilla Firefox, Apple Safari, Microsoft Edge). L'architettura del sistema dovrà essere di tipo _data-driven_, in cui la logica decisionale e i flussi di navigazione sono definiti dinamicamente sulla base di dati forniti in input (file JSON o CSV).
- *Vincoli normativi*: la logica di valutazione, la struttura dei questionari e i criteri di conformità devono aderire in modo rigoroso ai requisiti di sicurezza informatica per i dispositivi radio e IoT stabiliti dallo standard europeo EN 18031 e dalla direttiva RED.
- *Vincoli operativi e d'uso*: il sistema deve poter operare garantendo un'esperienza utente fluida, intuitiva e guidata. L'interfaccia deve semplificare e mascherare la complessità della normativa, permettendo anche ad utenti con competenze tecniche intermedie o non prettamente esperti della direttiva di portare a termine l'analisi di conformità.

Ulteriori vincoli di dettaglio, incluse le specifiche implementative e prestazionali, saranno definiti in maniera puntuale e tracciati all'interno della sezione dedicata ai Requisiti di vincolo.

= Casi d'Uso

== Introduzione
#v(1em)
La presente sezione descrive i casi d'uso del sistema Automated EN18031
Compliance Verification, identificando le interazioni tra gli attori esterni
e il sistema al fine di soddisfare i requisiti funzionali definiti nel
capitolo precedente.

Il sistema ha lo scopo di guidare l'utente nella valutazione di conformità
di un dispositivo radio ai requisiti della norma EN 18031, con particolare
riferimento ai meccanismi di controllo accessi (ACM) e autenticazione (AUM).

== Attori
#v(1em)
Gli attori di un sistema rappresentano i soggetti esterni (umani o altri sistemi informatici) che interagiscono direttamente con l'applicazione per usufruire delle sue funzionalità.

A seguito dell'analisi del capitolato e per mantenere il sistema focalizzato sugli obiettivi principali, si è stabilito che l'attore che interagisce con l'applicazione è uno solo. Non si prevedono, allo stato attuale, interazioni con servizi esterni o attori secondari.

- *Utente*: è l'unico attore primario del sistema. Rappresenta l'utente finale dell'applicazione, ovvero il tecnico, il consulente o il professionista del settore della cybersecurity incaricato di verificare la conformità di un dispositivo radio o IoT. L'Utente interagisce con il sistema per svolgere tutte le operazioni necessarie all'analisi, tra cui:
  - importare, creare e gestire i dati del dispositivo e i relativi asset;
  - navigare all'interno dei decision tree fornendo le risposte in modo interattivo;
  - salvare i progressi per riprendere valutazioni in sospeso;
  - consultare, generare ed esportare i report contenenti i risultati finali dell'analisi di conformità.

== Elenco dei Casi d'Uso
#v(1em)
- *Attori:* soggetti esterni al sistema che interagiscono con esso
  nell'ambito del caso d'uso, siano essi persone o altri sistemi;

- *Precondizioni:* condizioni che devono essere verificate affinché il caso
  d'uso possa essere avviato;

- *Postcondizioni:* stato del sistema al termine dell'esecuzione del caso
  d'uso, in seguito al completamento con successo dello scenario principale;

- *Scenario principale:* sequenza ordinata di passi che descrive
  l'interazione nominale tra l'attore e il sistema, ovvero il flusso atteso
  in assenza di errori o eccezioni;

- *Scenari alternativi:* varianti del flusso principale che si verificano
  in presenza di condizioni particolari, errori o scelte diverse da parte
  dell'attore; ciascuno scenario alternativo è identificato dal numero del
  passo.

#v(2em)
#pagebreak()

#set heading(numbering: none)


== UC-1 : Inserimento del dispositivo <uc1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC1.png", width: 100%),
  caption: [UC-1 : Inserimento del dispositivo],
)

- *Attore primario:* Utente

- *Precondizioni:* Il sistema è attivo e si trova allo stato iniziale.

- *Postcondizioni:* Il dispositivo è stato inserito.

- *Scenario principale:*
  + L'utente inserisce il dispositivo.
  + Il sistema acquisisce le informazioni relative al dispositivo.

- *Scenari alternativi:*
  - *1a.* L'utente annulla l'inserimento del dispositivo. #link(<uc6>)[(UC-6)]

- *Specializzazioni:*
  - #link(<uc2>)[UC-2: Importazione del dispositivo]
  - #link(<uc4>)[UC-4: Creazione del dispositivo]

- *Estensioni:*
  - #link(<uc6>)[UC-6: Annullamento inserimento del dispositivo]


== UC-2: Importazione del dispositivo <uc2>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC2.png", width: 100%),
  caption: [UC-2 : Importazione del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema è attivo e si trova allo stato iniziale.

- *Postcondizioni:* Il sistema ha registrato il dispositivo con le informazioni importate.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di importazione del dispositivo.
  + L'utente seleziona il file di configurazione del dispositivo. #link(<uc2.1>)[(UC-2.1)]
  + Il sistema acquisisce le informazioni sul dispositivo.
  + Il sistema conferma l'avvenuta importazione.

- *Scenari alternativi:*
  - *2a.* Il file di configurazione non è valido. #link(<uc3>)[(UC-3)]

- *Inclusioni:*
  - #link(<uc2.1>)[UC-2.1: Selezione file del dispositivo]

- *Estensioni:*
  - #link(<uc3>)[UC-3: Formato file non valido]

=== UC-2.1: Selezione file del dispositivo <uc2.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC2.1.png", width: 100%),
  caption: [UC-2.1 : Selezione file del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di importazione del dispositivo. #link(<uc2>)[(UC-2)]

- *Postcondizioni:* Il sistema ha acquisito il file di configurazione del
  dispositivo.

- *Scenario principale:*
  + L'utente seleziona il file di configurazione del dispositivo.
  + Il sistema acquisisce il file.

- *Specializzazioni:*
  - #link(<uc2.1.1>)[UC-2.1.1: Selezione file JSON]
  - #link(<uc2.1.2>)[UC-2.1.2: Selezione file CSV]


==== UC-2.1.1: Selezione file JSON <uc2.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta selezionando il file sorgente per
  l'importazione del dispositivo. #link(<uc2.1>)[(UC-2.1)]

- *Postcondizioni:* Il sistema ha acquisito il file JSON di configurazione del dispositivo.

- *Scenario principale:*
  + L'utente seleziona un file in formato JSON come sorgente per
    l'importazione del dispositivo.


==== UC-2.1.2: Selezione file CSV <uc2.1.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta selezionando il file sorgente per
  l'importazione del dispositivo. #link(<uc2.1>)[(UC-2.1)]

- *Postcondizioni:* Il sistema ha acquisito il file CSV di configurazione del dispositivo.

- *Scenario principale:*
  + L'utente seleziona un file in formato CSV come sorgente per l'importazione del dispositivo.

== UC-3: Formato file non valido <uc3>
#v(1em)
- *Attore primario*: Utente

- *Precondizioni*:
  - Il sistema è attivo.
  - L'utente ha selezionato un file da caricare nel sistema.

- *Postcondizioni*:
  - L'operazione di caricamento del file è stata annullata.
  - L'utente ha visualizzato un messaggio di errore.

- *Scenario principale*:
  + Il sistema rileva un file con un errore strutturale o di contenuto.
  + Il sistema interrompe il processo di caricamento.
  + Il sistema mostra un messaggio di errore.


== UC-4 : Creazione del dispositivo <uc4>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC4.png", width: 80%),
  caption: [UC-4 : Creazione del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema è attivo e si trova allo stato iniziale.

- *Postcondizioni:* Il sistema ha registrato il dispositivo con le informazioni fornite.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di creazione di un nuovo dispositivo.
  + L'utente compila i campi richiesti per il dispositivo. #link(<uc4.1>)[(UC-4.1)]
  + Il sistema registra il dispositivo.

- *Inclusioni:*
  - #link(<uc4.1>)[UC-4.1: Inserimento dati dispositivo]

=== UC-4.1: Inserimento dati dispositivo <uc4.1>
#figure(
  image("../../../images/diagrammiUML/UC4.1a.png", width: 100%),
  caption: [UC-4.1 : Inserimento dati dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo #link(<uc4>)[(UC-4)]. 

- *Postcondizioni:* Il sistema ha registrato i dati relativi al dispositivo.

- *Scenario principale:*
  + L'utente inserisce il nome del dispositivo. #link(<uc4.1.1>)[(UC-4.1.1)]
  + L'utente inserisce il sistema operativo del dispositivo. #link(<uc4.1.2>)[(UC-4.1.2)]
  + L'utente inserisce la descrizione del dispositivo. #link(<uc4.1.3>)[(UC-4.1.3)]

- *Scenari alternativi:*
  - L'utente inserisce dati non validi in uno o più campi. #link(<uc5>)[(UC-5)]

- *Inclusioni:*
  - #link(<uc4.1.1>)[UC-4.1.1: Inserimento nome dispositivo]
  - #link(<uc4.1.2>)[UC-4.1.2: Inserimento sistema operativo dispositivo]
  - #link(<uc4.1.3>)[UC-4.1.3: Inserimento descrizione dispositivo]

- *Estensioni:*
  - #link(<uc5>)[UC-5: Inserimento dati non validi]

#figure(
  image("../../../images/diagrammiUML/UC4.1b.png", width: 80%),
  caption: [UC-4.1 : Inserimento dati nome, sistema operativo e descrizione],
)
=== UC-4.1.1: Inserimento nome dispositivo <uc4.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo #link(<uc4>)[(UC-4)].

- *Postcondizioni:* Il sistema ha registrato il nome del dispositivo.

- *Scenario principale:*
  + L'utente inserisce un nome per il nuovo dispositivo.


=== UC-4.1.2: Inserimento sistema operativo dispositivo <uc4.1.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo #link(<uc4>)[(UC-4)].

- *Postcondizioni:* Il sistema ha registrato il sistema operativo del dispositivo.

- *Scenario principale:*
  + L'utente inserisce un sistema operativo per il nuovo dispositivo.


=== UC-4.1.3: Inserimento descrizione dispositivo  <uc4.1.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo #link(<uc4>)[(UC-4)].

- *Postcondizioni:* Il sistema ha registrato la descrizione del dispositivo.

- *Scenario principale:*
  + L'utente inserisce una descrizione per il nuovo dispositivo.


== UC-5: Inserimento dati non validi <uc5>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha compilato uno o più campi di un form con valori non validi o assenti.

- *Postcondizioni:* Il sistema ha segnalato l'errore all'utente.

- *Scenario principale:*
  + L'utente tenta di confermare l'inserimento con uno o più campi non validi o nulli.
  + Il sistema mostra un messaggio di errore che indica i campi non validi.
  + Il sistema non procede con l'operazione.

== UC-6: Annullamento inserimento del dispositivo <uc6>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta eseguendo l'inserimento di un dispositivo.

- *Postcondizioni:* Il sistema torna allo stato iniziale.

- *Scenario principale:*
  + L'utente seleziona la funzione di annullamento dell'inserimento del dispositivo.
  + Il sistema scarta i dati del dispositivo.



== UC-7: Visualizzazione dati dispositivo <uc7>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC7.png", width: 90%),
  caption: [UC-7 : Visualizzazione dati dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha inserito il dispositivo.

- *Postcondizioni:* L'utente ha visualizzato i dati del dispositivo.

- *Scenario principale:*
  + L'utente visualizza il nome del dispositivo. #link(<uc7.1>)[(UC-7.1)]
  + L'utente visualizza il sistema operativo del dispositivo. #link(<uc7.2>)[(UC-7.2)]
  + L'utente visualizza la descrizione del dispositivo. #link(<uc7.3>)[(UC-7.3)]
  + L'utente visualizza lo stato aggregato di valutazione del dispositivo. #link(<uc7.4>)[(UC-7.4)]

- *Inclusioni:*
  - #link(<uc7.1>)[UC-7.1: Visualizzazione nome dispositivo]
  - #link(<uc7.2>)[UC-7.2: Visualizzazione sistema operativo dispositivo]
  - #link(<uc7.3>)[UC-7.3: Visualizzazione descrizione dispositivo]
  - #link(<uc7.4>)[UC-7.4: Visualizzazione stato aggregato dispositivo]

=== UC-7.1: Visualizzazione nome dispositivo <uc7.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando i dati del dispositivo #link(<uc7>)[(UC-7)].

- *Postcondizioni:* L'utente ha visualizzato il nome del dispositivo.

- *Scenario principale:*
  + L'utente visualizza il nome del dispositivo.

=== UC-7.2: Visualizzazione sistema operativo dispositivo <uc7.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando i dati del dispositivo #link(<uc7>)[(UC-7)].

- *Postcondizioni:* L'utente ha visualizzato il sistema operativo del dispositivo.

- *Scenario principale:*
  + L'utente visualizza il sistema operativo del dispositivo.

=== UC-7.3: Visualizzazione descrizione dispositivo <uc7.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando i dati del dispositivo #link(<uc7>)[(UC-7)].

- *Postcondizioni:* L'utente ha visualizzato la descrizione del dispositivo.

- *Scenario principale:*
  + L'utente visualizza la descrizione del dispositivo.

=== UC-7.4: Visualizzazione stato aggregato dispositivo <uc7.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando i dati del dispositivo #link(<uc7>)[(UC-7)].

- *Postcondizioni:* L'utente ha visualizzato lo stato aggregato di valutazione del dispositivo.

- *Scenario principale:*
  + L'utente visualizza lo stato aggregato del dispositivo.

== UC-8: Modifica dati dispositivo <uc8>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC8a.png", width: 100%),
  caption: [UC-8 : Modifica dati del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* 
  - L'utente ha inserito il dispositivo.
  - L'utente sta visualizzando i dati del dispositivo.

- *Postcondizioni:* Il sistema ha aggiornato i dati del dispositivo secondo le modifiche apportate.

- *Scenario principale:*
  + L'utente seleziona la funzione di modifica dei dati del dispositivo.
  + L'utente modifica i campi del dispositivo nel form, eventualmente modificando:
    - il nome del dispositivo; #link(<uc8.1>)[(UC-8.1)]
    - il sistema operativo del dispositivo; #link(<uc8.2>)[(UC-8.2)]
    - la descrizione del dispositivo. #link(<uc8.3>)[(UC-8.3)]
  + L'utente conferma le modifiche.
  + Il sistema registra le modifiche.

- *Scenari alternativi:*
  - *3a.* L'utente inserisce dati non validi in uno o più campi. #link(<uc5>)[(UC-5)]
  -  L'utente annulla la modifica. #link(<uc9>)[(UC-9)]

- *Inclusioni:*
  - #link(<uc8.1>)[UC-8.1: Modifica nome dispositivo]
  - #link(<uc8.2>)[UC-8.2: Modifica sistema operativo dispositivo]
  - #link(<uc8.3>)[UC-8.3: Modifica descrizione dispositivo]

- *Estensioni:*
  - #link(<uc5>)[UC-5: Inserimento dati non validi]
  - #link(<uc9>)[UC-9: Annullamento modifica dati dispositivo]

#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC8b.png", width: 80%),
  caption: [UC-8 : Modifica dati dispositivo],
)

=== UC-8.1: Modifica nome dispositivo <uc8.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando i dati del dispositivo #link(<uc8>)[(UC-8)].

- *Postcondizioni:* Il sistema ha aggiornato il nome del dispositivo.

- *Scenario principale:*
  + Il sistema carica il nome del dispositivo nel campo corrispondente.
  + L'utente inserisce il nuovo nome del dispositivo.
  + Il sistema registra il valore.

=== UC-8.2: Modifica sistema operativo dispositivo <uc8.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando i dati del dispositivo #link(<uc8>)[(UC-8)].

- *Postcondizioni:* Il sistema ha aggiornato il sistema operativo del dispositivo.

- *Scenario principale:*
  + Il sistema carica il sistema operativo del dispositivo nel campo corrispondente.
  + L'utente inserisce il nuovo sistema operativo del dispositivo.
  + Il sistema registra il valore.

=== UC-8.3: Modifica descrizione dispositivo <uc8.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando i dati del dispositivo #link(<uc8>)[(UC-8)].

- *Postcondizioni:* Il sistema ha aggiornato la descrizione del dispositivo.

- *Scenario principale:*
  + Il sistema carica la descrizione del dispositivo nel campo corrispondente.
  + L'utente inserisce la nuova descrizione del dispositivo.
  + Il sistema registra il valore.


== UC-9: Annullamento modifica dati dispositivo <uc9>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando i dati del dispositivo.

- *Postcondizioni:* Il sistema ha annullato le modifiche ai dati del dispositivo e i dati sono tornati al loro stato precedente.

- *Scenario principale:*
  + L'utente seleziona la funzione di annullamento della modifica dei dati del dispositivo.
  + Il sistema scarta le modifiche.
  + Il sistema torna alla visualizzazione del dispositivo.

== UC-10: Esportazione del dispositivo <uc10>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC10.png", width: 90%),
  caption: [UC-10 : Esportazione del dispositivo],
)

- *Attore primario:* Utente

- *Precondizioni:* 
  - L'utente sta visualizzando il dispositivo.
  - Non è in corso la sessione di valutazione.

- *Postcondizioni:* Il sistema ha reso disponibile per il download un file contenente i dati del dispositivo e degli asset associati.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di esportazione dei dati del dispositivo.
  + Il sistema raccoglie i dati di configurazione del dispositivo e degli asset associati.
  + Il sistema genera il file nel formato richiesto.
  + Il sistema mette a disposizione il file per il download.

- *Specializzazioni:*
  - #link(<uc10.1>)[UC-10.1: Esportazione del dispositivo in JSON]
  - #link(<uc10.2>)[UC-10.2: Esportazione del dispositivo in CSV]


=== UC-10.1: Esportazione del dispositivo in JSON <uc10.1>
- *Attore primario:* Utente
- *Precondizioni:* L'utente ha selezionato la funzionalità di esportazione
  dei dati del dispositivo. #link(<uc10>)[(UC-10)]
- *Postcondizioni:* Il sistema ha generato il file JSON contenente i dati
  del dispositivo e degli asset associati.
- *Scenario principale:*
  + L'utente seleziona il formato JSON.
  + Il sistema mette a disposizione il file per il download.


=== UC-10.2: Esportazione del dispositivo in CSV <uc10.2>
- *Attore primario:* Utente
- *Precondizioni:* L'utente ha selezionato la funzionalità di esportazione
  dei dati del dispositivo. #link(<uc10>)[(UC-10)]
- *Postcondizioni:* Il sistema ha generato il file CSV contenente i dati
  del dispositivo e degli asset associati.
- *Scenario principale:*
  + L'utente seleziona il formato CSV.
  + Il sistema mette a disposizione il file per il download.

== UC-11: Eliminazione del dispositivo <uc11>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC11.png", width: 90%),
  caption: [UC-11 : Eliminazione del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* 
  - L'utente sta visualizzando il dispositivo.
  - Non è in corso la sessione di valutazione.

- *Postcondizioni:* Il sistema ha rimosso il dispositivo, gli asset associati e gli eventuali risultati di valutazione.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di eliminazione del dispositivo.
  + L'utente conferma l'operazione.
  + Il sistema rimuove il dispositivo, gli asset associati e gli eventuali risultati di valutazione.

- *Specializzazioni:*
  - #link(<uc11.1>)[UC-11.1: Eliminazione dispositivo senza backup]
  - #link(<uc11.2>)[UC-11.2: Eliminazione dispositivo con backup]

=== UC-11.1: Eliminazione dispositivo senza backup <uc11.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di eliminazione del dispositivo #link(<uc11>)[(UC-11)].

- *Postcondizioni:* Il sistema ha rimosso il dispositivo, tutti gli asset
  associati e gli eventuali risultati di valutazione, senza produrre alcun
  file di backup.

- *Scenario principale:*
  + L'utente seleziona l'opzione di eliminazione diretta senza backup.
  + L'utente conferma l'eliminazione.
  + Il sistema rimuove il dispositivo, tutti gli asset associati e i
    relativi risultati di valutazione.

=== UC-11.2: Eliminazione dispositivo con backup <uc11.2>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC11.2.png", width: 90%),
  caption: [UC-11.2 : Eliminazione dispositivo con backup],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di eliminazione del dispositivo #link(<uc11>)[(UC-11)].

- *Postcondizioni:* Il sistema ha esportato i dati del dispositivo e degli
  asset associati, e successivamente ha rimosso il dispositivo,
  gli asset e gli eventuali risultati di valutazione.

- *Scenario principale:*
  + L'utente seleziona l'opzione di eliminazione con backup.
  + Il sistema avvia l'esportazione dei dati del dispositivo #link(<uc10>)[(UC-10)].
  + Il sistema rimuove il dispositivo, tutti gli asset associati e i
    relativi risultati di valutazione.

- *Inclusioni:*
  - #link(<uc10>)[UC-10: Esportazione del dispositivo]


#pagebreak()

== UC-12: Inserimento asset <uc12>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC12.png", width: 100%),
  caption: [UC-12 : Inserimento asset],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente si trova nella schermata di visualizzazione del dispositivo.

- *Postcondizioni:* Il sistema ha aggiunto un nuovo asset alla lista degli assets del dispositivo.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di inserimento asset.
  + L'utente inserisce i dati dell'asset. #link(<uc12.1>)[(UC-12.1)]
  + L'utente conferma l'inserimento dell'asset.
  + Il sistema aggiunge l'asset al dispositivo.

- *Scenari alternativi:*
  - L'utente annulla l'inserimento dell'asset. #link(<uc13>)[(UC-13)]
  - *3a.* L'utente inserisce dati non validi in uno o più campi. #link(<uc5>)[(UC-5)]

- *Inclusioni:*
  - #link(<uc12.1>)[UC-12.1: Inserimento dati asset]

- *Estensioni:*
  - #link(<uc13>)[UC-13: Annullamento inserimento asset]

=== UC-12.1: Inserimento dati asset <uc12.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC12.1a.png", width: 100%),
  caption: [UC-12.1 : Inserimento dati asset],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset #link(<uc12>)[(UC-12)].

- *Postcondizioni:* Il sistema ha registrato i dati del nuovo asset.

- *Scenario principale:*
  + L'utente inserisce il nome dell'asset. #link(<uc12.1.1>)[(UC-12.1.1)]
  + L'utente seleziona il tipo dell'asset. #link(<uc12.1.2>)[(UC-12.1.2)]
  + L'utente inserisce una descrizione per l'asset. #link(<uc12.1.3>)[(UC-12.1.3)]
  + L'utente seleziona la sensibilità dell'asset. #link(<uc12.1.4>)[(UC-12.1.4)]

- *Scenari alternativi:*
  - L'utente inserisce dati non validi in uno o più campi. #link(<uc5>)[(UC-5)]

- *Inclusioni:*
  - #link(<uc12.1.1>)[UC-12.1.1: Inserimento nome asset]
  - #link(<uc12.1.2>)[UC-12.1.2: Selezione tipo asset]
  - #link(<uc12.1.3>)[UC-12.1.3: Inserimento descrizione asset]
  - #link(<uc12.1.4>)[UC-12.1.4: Selezione sensibilità asset]

- *Estensioni:*
  - #link(<uc5>)[UC-5: Inserimento dati non validi]
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC12.1b.png", width: 80%),
  caption: [UC-12.1 : Inclusioni caso d'uso UC-12.1],
)
==== UC-12.1.1: Inserimento nome asset <uc12.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset #link(<uc12.1>)[(UC-12.1)].

- *Postcondizioni:* Il sistema ha registrato il nome dell'asset.

- *Scenario principale:*
  + L'utente inserisce il nome dell'asset.

==== UC-12.1.2: Selezione tipo asset <uc12.1.2>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset #link(<uc12.1>)[(UC-12.1)].

- *Postcondizioni:* Il sistema ha registrato il tipo dell'asset.

- *Scenario principale:*
  + L'utente seleziona il tipo dell'asset tra le opzioni disponibili:
    - Network;
    - Security;
    - Privacy;
    - Financial.

==== UC-12.1.3: Inserimento descrizione asset <uc12.1.3>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di inserimento asset #link(<uc12.1>)[(UC-12.1)].

- *Postcondizioni:* Il sistema ha registrato la descrizione dell'asset.

- *Scenario principale:*
  + L'utente inserisce una descrizione per l'asset.

==== UC-12.1.4: Selezione sensibilità asset <uc12.1.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset #link(<uc12.1>)[(UC-12.1)].

- *Postcondizioni:* Il sistema ha registrato la sensibilità dell'asset.

- *Scenario principale:*
  + L’utente specifica se l’asset è sensibile mediante selezione affermativa o negativa.

== UC-13: Annullamento inserimento asset <uc13>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset.

- *Postcondizioni:* Il sistema ha ripristinato lo stato precedente.

- *Scenario principale:*
  + L'utente ha selezionato l'opzione di annullamento di inserimento dell'asset.
  + Il sistema scarta i dati inseriti.


== UC-14: Visualizzazione lista assets <uc14>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC14.png", width: 80%),
  caption: [UC-14 : Visualizzazione lista assets],
)

- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente sta visualizzando il dispositivo.
  - Il dispositivo possiede almeno un asset.

- *Postcondizioni:* L'utente ha visualizzato la lista degli assets del dispositivo.

- *Scenario principale:*
  + Il sistema mostra la lista degli assets del dispositivo.
  + Per ogni asset nella lista l'utente visualizza le informazioni del singolo asset. #link(<uc14.1>)[(UC-14.1)]

- *Inclusioni:*
  - #link(<uc14.1>)[UC-14.1: Visualizzazione singolo asset nella lista]

=== UC-14.1: Visualizzazione singolo asset nella lista <uc14.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC14.1.png", width: 100%),
  caption: [UC-14.1 : Visualizzazione singolo asset nella lista],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto di visualizzare la lista degli assets #link(<uc14>)[(UC-14)].

- *Postcondizioni:* L'utente ha visualizzato le informazioni essenziali di un singolo asset.

- *Scenario principale:*
  + Il sistema mostra il nome dell'asset. #link(<uc14.1.1>)[(UC-14.1.1)]
  + Il sistema mostra il tipo di asset. #link(<uc14.1.2>)[(UC-14.1.2)]
  + Il sistema mostra lo stato di valutazione dell'asset. #link(<uc14.1.3>)[(UC-14.1.3)]

- *Inclusioni:*
  - #link(<uc14.1.1>)[UC-14.1.1: Visualizzazione nome asset nella lista]
  - #link(<uc14.1.2>)[UC-14.1.2: Visualizzazione tipo asset nella lista]
  - #link(<uc14.1.3>)[UC-14.1.3: Visualizzazione stato valutazione asset nella lista]

==== UC-14.1.1: Visualizzazione nome asset nella lista <uc14.1.1>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista degli assets #link(<uc14.1>)[(UC-14.1)].

- *Postcondizioni:* L'utente ha visualizzato il nome dell'asset.

- *Scenario principale:*
  + L'utente visualizza il nome dell'asset.

==== UC-14.1.2: Visualizzazione tipo asset nella lista <uc14.1.2>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista degli assets #link(<uc14.1>)[(UC-14.1)].

- *Postcondizioni:* L'utente ha visualizzato il tipo dell'asset.

- *Scenario principale:*
  + L'utente visualizza il tipo dell'asset.

==== UC-14.1.3: Visualizzazione stato valutazione asset nella lista <uc14.1.3>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista degli assets #link(<uc14.1>)[(UC-14.1)].

- *Postcondizioni:* L'utente ha visualizzato lo stato di valutazione dell'asset.

- *Scenario principale:*
  + L'utente visualizza lo stato di valutazione dell'asset.

== UC-15: Visualizzazione in dettaglio asset <uc15>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC15.png", width: 100%),
  caption: [UC-15 : Visualizzazione in dettaglio asset],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista degli assets.

- *Postcondizioni:* L'utente ha visualizzato le informazioni in dettaglio di un singolo asset.

- *Scenario principale:*
  + L'utente seleziona un asset dalla lista.
  + Il sistema mostra il nome dell'asset. #link(<uc15.1>)[(UC-15.1)]
  + Il sistema mostra il tipo dell'asset. #link(<uc15.2>)[(UC-15.2)]
  + Il sistema mostra la descrizione dell'asset. #link(<uc15.3>)[(UC-15.3)]
  + Il sistema mostra la sensibilità dell'asset. #link(<uc15.4>)[(UC-15.4)]
  + Il sistema mostra lo stato di valutazione dell'asset. #link(<uc15.5>)[(UC-15.5)]
  + Il sistema mostra la lista dei requisiti dell'asset. #link(<uc15.6>)[(UC-15.6)]

- *Inclusioni:*
  - #link(<uc15.1>)[UC-15.1: Visualizzazione nome asset in dettaglio]
  - #link(<uc15.2>)[UC-15.2: Visualizzazione tipo asset in dettaglio]
  - #link(<uc15.3>)[UC-15.3: Visualizzazione descrizione asset in dettaglio]
  - #link(<uc15.4>)[UC-15.4: Visualizzazione sensibilità asset]
  - #link(<uc15.5>)[UC-15.5: Visualizzazione stato valutazione asset]
  - #link(<uc15.6>)[UC-15.6: Visualizzazione lista requisiti asset]

=== UC-15.1: Visualizzazione nome asset in dettaglio <uc15.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset #link(<uc15>)[(UC-15)].

- *Postcondizioni:* L'utente ha visualizzato il nome dell'asset.

- *Scenario principale:*
  + L'utente visualizza il nome dell'asset.

=== UC-15.2: Visualizzazione tipo asset in dettaglio <uc15.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset #link(<uc15>)[(UC-15)].

- *Postcondizioni:* L'utente ha visualizzato il tipo dell'asset.

- *Scenario principale:*
  + L'utente visualizza il tipo dell'asset.

=== UC-15.3: Visualizzazione descrizione asset in dettaglio <uc15.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset #link(<uc15>)[(UC-15)].

- *Postcondizioni:* L'utente ha visualizzato la descrizione dell'asset.

- *Scenario principale:*
  + L'utente visualizza la descrizione dell'asset.

=== UC-15.4: Visualizzazione sensibilità asset in dettaglio <uc15.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset #link(<uc15>)[(UC-15)].

- *Postcondizioni:* L'utente ha visualizzato la sensibilità dell'asset.

- *Scenario principale:*
  + L’utente visualizza l’indicazione relativa alla sensibilità dell’asset.

=== UC-15.5: Visualizzazione stato valutazione asset in dettaglio <uc15.5>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset #link(<uc15>)[(UC-15)].

- *Postcondizioni:* L'utente ha visualizzato lo stato complessivo di valutazione dell'asset.

- *Scenario principale:*
  + L'utente visualizza lo stato di valutazione dell'asset.


=== UC-15.6: Visualizzazione lista requisiti asset <uc15.6>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC15.6.png", width: 80%),
  caption: [UC-15.6 : Visualizzazione lista requisiti asset],
)
- *Attore primario:* Utente
- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset #link(<uc15>)[(UC-15)].
- *Postcondizioni:* L'utente ha visualizzato la lista dei requisiti da valutare
  per l'asset.
- *Scenario principale:*
  + Il sistema mostra la lista dei requisiti associati all'asset.
  + Per ogni requisito il sistema mostra il codice e lo stato di valutazione.
    #link(<uc15.6.1>)[(UC-15.6.1)]

- *Inclusioni:*
  - #link(<uc15.6.1>)[UC-15.6.1: Visualizzazione singolo requisito nella lista]

==== UC-15.6.1: Visualizzazione singolo requisito nella lista <uc15.6.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista dei requisiti dell'asset #link(<uc15.6>)[(UC-15.6)].

- *Postcondizioni:* L'utente ha visualizzato il codice e lo stato di valutazione del requisito (Non valutato, In corso, PASS, FAIL, NOT APPLICABLE).

- *Scenario principale:*
  + L'utente visualizza il codice del requisito.
  + L'utente visualizza lo stato di valutazione del requisito.


== UC-16: Modifica asset <uc16>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC16a.png", width: 100%),
  caption: [UC-16 : Modifica asset],
)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un asset.

- *Postcondizioni:* Il sistema ha aggiornato le informazioni dell'asset secondo le modifiche effettuate.

- *Scenario principale:*
  + L'utente seleziona la funzione di modifica dell'asset.
  + L'utente modifica i campi dell'asset nel form, eventualmente modificando:
    - il nome dell'asset; #link(<uc16.1>)[(UC-16.1)]
    - il tipo dell'asset; #link(<uc16.2>)[(UC-16.2)]
    - la descrizione dell'asset; #link(<uc16.3>)[(UC-16.3)]
    - la sensibilità dell'asset. #link(<uc16.4>)[(UC-16.4)]
  + L'utente conferma le modifiche.
  + Il sistema registra le modifiche.

- *Scenari alternativi:*
  - *3a.* L'utente inserisce dati non validi in uno o più campi. #link(<uc5>)[(UC-5)]
  - L'utente annulla la modifica dell'asset. #link(<uc17>)[(UC-17)]

- *Inclusioni:*
  - #link(<uc16.1>)[UC-16.1: Modifica nome asset]
  - #link(<uc16.2>)[UC-16.2: Modifica tipo asset]
  - #link(<uc16.3>)[UC-16.3: Modifica descrizione asset]
  - #link(<uc16.4>)[UC-16.4: Modifica sensibilità asset]

- *Estensioni:*
  - #link(<uc5>)[UC-5: Inserimento dati non validi]
  - #link(<uc17>)[UC-17: Annullamento modifica asset]
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC16b.png", width: 80%),
  caption: [UC-16 : Inclusioni caso d'uso UC-16],
)
=== UC-16.1: Modifica nome asset <uc16.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset #link(<uc16>)[(UC-16)].

- *Postcondizioni:* Il sistema ha aggiornato il nome dell'asset.

- *Scenario principale:*
  + Il sistema carica il nome dell'asset nel campo corrispondente.
  + L'utente inserisce il nuovo nome dell'asset.
  + Il sistema registra il nuovo valore.

=== UC-16.2: Modifica tipo asset <uc16.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset #link(<uc16>)[(UC-16)].

- *Postcondizioni:* Il sistema ha aggiornato il tipo dell'asset.

- *Scenario principale:*
  + Il sistema carica la selezione del tipo dell'asset precedentemente effettuata.
  + L'utente seleziona il nuovo tipo dell'asset tra le opzioni disponibili.
  + Il sistema registra la nuova selezione.

=== UC-16.3: Modifica descrizione asset  <uc16.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset #link(<uc16>)[(UC-16)].

- *Postcondizioni:* Il sistema ha aggiornato la descrizione dell'asset.

- *Scenario principale:*
  + Il sistema carica la descrizione dell'asset nel campo corrispondente.
  + L'utente inserisce la nuova descrizione dell'asset.
  + Il sistema registra il nuovo valore.

=== UC-16.4: Modifica sensibilità asset <uc16.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset #link(<uc16>)[(UC-16)].

- *Postcondizioni:* Il sistema ha aggiornato la sensibilità dell'asset.

- *Scenario principale:*
  + Il sistema carica la selezione della sensibilità dell'asset precedentemente effettuata.
 + L'utente seleziona se l'asset è sensibile o no.
+ Il sistema registra la nuova selezione.


== UC-17: Annullamento modifica asset <uc17>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset #link(<uc16>)[(UC-16)].

- *Postcondizioni:* Il sistema ha annullato le modifiche all'asset e i dati sono tornati al loro stato precedente.

- *Scenario principale:*
  + L'utente seleziona la funzione di annullamento della modifica dell'asset.
  + Il sistema scarta le modifiche.
  + Il sistema ritorna alla visualizzazione in dettaglio dell'asset.


== UC-18: Eliminazione asset <uc18>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente sta visualizzando il dettaglio di un asset.

- *Postcondizioni:* 
  - Il sistema ha eliminato l'asset selezionato.
  - La lista degli asset del dispositivo è stata aggiornata.

- *Scenario principale:*
  + L'utente seleziona la funzione di eliminazione dell'asset.
  + Il sistema mostra un messaggio di conferma.
  + L'utente conferma l'eliminazione.
  + Il sistema elimina l'asset selezionato.


#pagebreak()

== UC-19: Esecuzione valutazione dispositivo <uc19>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC19a.png", width: 100%),
  caption: [UC-19 : Esecuzione valutazione dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente ha inserito il dispositivo.
  - Il dispositivo ha almeno un asset.

- *Postcondizioni:* La sessione di valutazione è stata completata.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di avvio della valutazione del dispositivo.
  + Il sistema mostra la dashboard di valutazione. #link(<uc19.1>)[(UC-19.1)]
  + L'utente seleziona un asset dalla dashboard.
  + Il sistema avvia la valutazione dell'asset selezionato. #link(<uc20>)[(UC-20)]
  + I passi 2-4 si ripetono fino alla valutazione di tutti gli asset.

- *Scenari alternativi:*
  - L'utente interrompe la sessione. #link(<uc24>)[(UC-24)]
  - L'utente salva la sessione di valutazione. #link(<uc25>)[(UC-25)]

- *Inclusioni:*
  - #link(<uc19.1>)[UC-19.1: Visualizzazione dashboard di valutazione]
  - #link(<uc20>)[UC-20: Valutazione di un asset]

- *Estensioni:*
  - #link(<uc24>)[UC-24: Uscita anticipata dal test]
  - #link(<uc25>)[UC-25: Salvataggio sessione di valutazione]

#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC19b.png", width: 80%),
  caption: [UC-19 : Inclusioni caso d'uso UC-19],
)
=== UC-19.1: Visualizzazione dashboard di valutazione <uc19.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* La sessione di valutazione è attiva #link(<uc19>)[(UC-19)].

- *Postcondizioni:* L'utente ha visualizzato lo stato complessivo della
  valutazione.

- *Scenario principale:*
  + L'utente visualizza la lista degli assets del dispositivo.
  + Per ogni asset il sistema mostra il nome, il tipo e lo stato di valutazione
    corrente.
  + Il sistema mostra l'asset e il requisito correnti in esame.
  + Il sistema mostra il numero di asset completati rispetto al totale.
  + Il sistema mostra il numero di requisiti completati per l'asset corrente.


== UC-20: Valutazione di un asset <uc20>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC20.png", width: 100%),
  caption: [UC-20 : Valutazione di un asset],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva.
  - L'utente ha selezionato un asset dalla dashboard.

- *Postcondizioni:* I requisiti dell'asset sono stati valutati e i relativi esiti registrati.

- *Scenario principale:*
  + Il sistema mostra le informazioni dell'asset. #link(<uc20.1>)[(UC-20.1)]
  + Il sistema mostra la lista dei requisiti da valutare. #link(<uc20.2>)[(UC-20.2)]
  + L'utente seleziona un requisito da valutare.
  + I passi 2-3 si ripetono fino alla valutazione di tutti i requisiti.

- *Inclusioni:*
  - #link(<uc20.1>)[UC-20.1: Visualizzazione asset in valutazione]
  - #link(<uc20.2>)[UC-20.2: Visualizzazione lista requisiti in valutazione]

=== UC-20.1: Visualizzazione asset in valutazione <uc20.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva
  - L'utente ha selezionato un asset dalla dashboard.

- *Postcondizioni:* L'utente ha visualizzato le informazioni
  dell'asset selezionato.

- *Scenario principale:*
  + Il sistema mostra le informazioni dell'asset:
    - il nome;
    - il tipo;
    - la descrizione;
    - la sensibilità;
    - lo stato di valutazione.

=== UC-20.2: Visualizzazione lista requisiti in valutazione <uc20.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* 
  - La sessione di valutazione è attiva
  - L'utente sta valutando l'asset. #link(<uc20>)[(UC-20)]

- *Postcondizioni:* L'utente ha visualizzato la lista dei requisiti
  da valutare per l'asset corrente.

- *Scenario principale:*
  + Il sistema mostra la lista dei requisiti associati
    all'asset.
  + Per ogni requisito il sistema mostra il codice e lo stato
    di valutazione. #link(<uc20.2.1>)[(UC-20.2.1)]

- *Inclusioni:*
  - #link(<uc20.2.1>)[UC-20.2.1: Visualizzazione singolo requisito nella lista in valutazione]

==== UC-20.2.1: Visualizzazione singolo requisito nella lista in valutazione <uc20.2.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista dei requisiti
  in valutazione. #link(<uc20.2>)[(UC-20.2)]

- *Postcondizioni:* L'utente ha visualizzato il codice e lo stato di valutazione del requisito (Non valutato, In corso, PASS, FAIL, NOT APPLICABLE).

- *Scenario principale:*
  + Il sistema mostra il codice del requisito.
  + Il sistema mostra lo stato di valutazione del requisito.

== UC-21: Visualizzazione dettaglio requisito <uc21>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC21.png", width: 100%),
  caption: [UC-21 : Visualizzazione dettaglio requisito],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva.
  - L'utente sta visualizzando la lista dei requisiti in valutazione #link(<uc20>)[(UC-20)].

- *Postcondizioni:* L'utente ha visualizzato le informazioni del
  requisito.

- *Scenario principale:*
  + Il sistema mostra il codice e il nome del requisito.
  + Il sistema mostra le dipendenze del requisito. #link(<uc21.1>)[(UC-21.1)]

- *Scenari alternativi:*
  - *2a.* L'utente avvia l'esecuzione del decision tree. #link(<uc22>)[(UC-22)]

- *Inclusioni:*
  - #link(<uc21.1>)[UC-21.1: Visualizzazione dipendenze del requisito]

- *Estensioni:*
  - #link(<uc22>)[UC-22: Esecuzione decision tree per un requisito]


=== UC-21.1: Visualizzazione dipendenze del requisito <uc21.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un
  requisito. #link(<uc21>)[(UC-21)]

- *Postcondizioni:* L'utente ha visualizzato la lista delle dipendenze
  del requisito corrente.

- *Scenario principale:*
  + Il sistema mostra la lista dei requisiti da cui dipende il
    requisito corrente.
  + Per ogni dipendenza il sistema mostra il codice del requisito
    e il suo stato di valutazione.


== UC-22: Esecuzione decision tree per un requisito <uc22>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/uc22a.png", width: 90%),
  caption: [UC-22 : Esecuzione decision tree per un requisito],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva.
  - L'utente sta visualizzando il dettaglio del requisito. #link(<uc21>)[(UC-21)]

- *Postcondizioni:* Il sistema ha registrato l'esito del decision tree (PASS, FAIL o NOT APPLICABLE) per la coppia asset-requisito corrente.

- *Scenario principale:*
  + L'utente avvia l'esecuzione del decision tree per il requisito selezionato.
  + Il sistema mostra la domanda del nodo corrente. #link(<uc22.1>)[(UC-22.1)]
  + Il sistema mostra il grafo con il nodo corrente evidenziato. #link(<uc22.2>)[(UC-22.2)]
  + L'utente risponde alla domanda del nodo corrente. #link(<uc22.3>)[(UC-22.3)]
  + Il sistema avanza al nodo successivo in base alla risposta fornita.
  + I passi 2-5 si ripetono fino al raggiungimento di un nodo foglia.
  + Il sistema mostra e registra l'esito raggiunto. #link(<uc23>)[(UC-23)]

- *Scenari alternativi:*
  - L'utente naviga al nodo precedente per rivedere la risposta già fornita.
    #link(<uc22.4>)[(UC-22.4)]

- *Inclusioni:*
  - #link(<uc22.1>)[UC-22.1: Visualizzazione nodo corrente del decision tree]
  - #link(<uc22.2>)[UC-22.2: Visualizzazione grafo decision tree durante esecuzione]
  - #link(<uc22.3>)[UC-22.3: Risposta alla domanda del nodo corrente]
  - #link(<uc23>)[UC-23: Visualizzazione nodo foglia del decision tree]

- *Estensioni:*
  - #link(<uc22.4>)[UC-22.4: Visualizzazione risposta al nodo precedente]

#v(1em)
#figure(
  image("../../../images/diagrammiUML/uc22b.png", width: 80%),
  caption: [UC-22 : Esecuzione decision tree per un requisito],
)


=== UC-22.1: Visualizzazione nodo corrente del decision tree <uc22.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema sta eseguendo il decision tree per un requisito #link(<uc22>)[(UC-22)].

- *Postcondizioni:* L'utente ha visualizzato le informazioni del nodo corrente.

- *Scenario principale:*
  + Il sistema mostra il codice univoco del nodo corrente.
  + Il sistema mostra il testo della domanda associata al nodo corrente.


=== UC-22.2: Visualizzazione grafo decision tree durante esecuzione <uc22.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema sta eseguendo il decision tree per un requisito #link(<uc22>)[(UC-22)].

- *Postcondizioni:* L'utente ha visualizzato il grafo del decision tree con lo stato corrente dell'esecuzione evidenziato.

- *Scenario principale:*
  + Il sistema mostra il grafo completo del decision tree associato al requisito in esame.
  + Il sistema evidenzia il nodo corrente nel grafo.
  + Il sistema evidenzia il percorso già visitato dall'utente fino al nodo corrente.

=== UC-22.3: Risposta alla domanda del nodo corrente <uc22.3>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC22.3.png", width: 90%),
  caption: [UC-22.3 : Risposta alla domanda del nodo corrente],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente del decision tree.

- *Postcondizioni:* Il sistema ha registrato la risposta e avanzato al nodo successivo.

- *Scenario principale:*
  + L'utente seleziona la risposta.
  + Il sistema registra la risposta.

- *Specializzazioni:*
  - #link(<uc22.3.1>)[UC-22.3.1: Risposta affermativa al nodo corrente]
  - #link(<uc22.3.2>)[UC-22.3.2: Risposta negativa al nodo corrente]


==== UC-22.3.1: Risposta affermativa al nodo corrente <uc22.3.1>
#v(1em)
- *Attore primario:* Utente
- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente.
- *Postcondizioni:* Il sistema ha registrato "Yes" e avanzato nel ramo
  affermativo.
- *Scenario principale:*
  + L'utente seleziona "Yes" come risposta.
  + Il sistema registra la risposta e avanza al nodo successivo del ramo
    affermativo.


==== UC-22.3.2: Risposta negativa al nodo corrente <uc22.3.2>
#v(1em)
- *Attore primario:* Utente
- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente.
- *Postcondizioni:* Il sistema ha registrato "No" e avanzato nel ramo
  negativo.
- *Scenario principale:*
  + L'utente seleziona "No" come risposta.
  + Il sistema registra la risposta e avanza al nodo successivo del ramo
    negativo.


=== UC-22.4: Visualizzazione risposta al nodo precedente <uc22.4>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC22.4.png", width: 100%),
  caption: [UC-22.4 : Visualizzazione risposta al nodo precedente],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - Il sistema sta eseguendo il decision tree per un requisito.
  - Il nodo corrente non è il nodo radice del decision tree.

- *Postcondizioni:* Il sistema ha riportato l'utente al nodo precedente mostrando la risposta già fornita.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di navigazione al nodo precedente.
  + Il sistema torna al nodo precedente mostrando la risposta già fornita.

- *Scenari alternativi:*
  - L'utente avanza al nodo successivo mantenendo la stessa risposta. #link(<uc22.5>)[(UC-22.5)]
  - L'utente modifica la risposta. #link(<uc22.6>)[(UC-22.6)]

- *Estensioni:*
  - #link(<uc22.5>)[UC-22.5: Navigazione al nodo successivo già risposto]
  - #link(<uc22.6>)[UC-22.6: Modifica risposta al nodo precedente]

=== UC-22.5: Navigazione al nodo successivo già risposto <uc22.5>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:*
  - Il sistema sta eseguendo il decision tree per un requisito.
  - L'utente si trova su un nodo già risposto in precedenza. #link(<uc22.4>)[(UC-22.4)]
  - Esiste un nodo successivo nella cronologia delle risposte.

- *Postcondizioni:* Il sistema ha avanzato al nodo successivo mostrando la risposta già fornita.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di avanzamento al nodo successivo.
  + Il sistema avanza al nodo successivo mostrando la risposta già fornita.


=== UC-22.6: Modifica risposta al nodo precedente <uc22.6>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:*
  - Il sistema sta eseguendo il decision tree per un requisito.
  - L'utente si trova su un nodo già risposto in precedenza. #link(<uc22.4>)[(UC-22.4)]

- *Postcondizioni:* Il sistema ha registrato la nuova risposta e invalidato tutte le risposte successive al nodo corrente.

- *Scenario principale:*
  + L'utente seleziona una risposta diversa da quella precedentemente fornita.
  + Il sistema registra la nuova risposta.
  + Il sistema invalida tutte le risposte successive al nodo corrente.
  + Il sistema riprende l'esecuzione dal nodo successivo al corrente.


== UC-23: Visualizzazione nodo foglia del decision tree <uc23>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC23.png", width: 100%),
  caption: [UC-23 : Visualizzazione nodo foglia del decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema ha raggiunto un nodo foglia del decision tree.

- *Postcondizioni:* L'utente ha visualizzato l'esito del requisito per l'asset corrente (PASS, FAIL o NOT APPLICABLE).

- *Scenario principale:*
  + Il sistema mostra l'esito del requisito per l'asset corrente.

- *Scenari alternativi:*
  - L'utente inserisce una giustificazione per l'esito. #link(<uc23.1>)[(UC-23.1)]

- *Estensioni:*
  - #link(<uc23.1>)[UC-23.1: Inserimento giustificazione esito]

=== UC-23.1: Inserimento giustificazione esito <uc23.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'esito del decision
  tree per la coppia asset-requisito corrente. #link(<uc23>)[(UC-23)]

- *Postcondizioni:* Il sistema ha registrato la giustificazione
  fornita dall'utente per l'esito della coppia asset-requisito.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di inserimento giustificazione.
  + L'utente inserisce il testo della giustificazione.
  + Il sistema registra la giustificazione associandola alla coppia
    asset-requisito corrente.

== UC-24: Uscita anticipata dal test <uc24>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC24.png", width: 100%),
  caption: [UC-24 : Uscita anticipata dal test],
)

- *Attore primario:* Utente

- *Precondizioni:* La sessione di valutazione è attiva. #link(<uc19>)[(UC-19)]

- *Postcondizioni:* La sessione di valutazione è terminata.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di uscita dal test.
  + Il sistema chiede all'utente se desidera salvare la sessione.
  + L'utente sceglie di non salvare.
  + Il sistema termina la sessione di valutazione scartandone i dati.

- *Scenari alternativi:*
  - *3a.* L'utente seleziona la funzionalità di salvare la sessione. #link(<uc25>)[(UC-25)]
  - *3b.* L'utente annulla l'uscita e riprende il test.

- *Estensioni:*
  - #link(<uc25>)[UC-25: Salvataggio sessione di valutazione]

== UC-25: Salvataggio sessione di valutazione <uc25>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* La sessione di valutazione è attiva. #link(<uc19>)[(UC-19)]

- *Postcondizioni:* Il sistema ha prodotto il file di salvataggio contenente lo stato corrente della sessione.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di salvataggio della sessione.
  + Il sistema raccoglie i dati della sessione corrente:
    - dati del dispositivo e degli asset;
    - esiti già registrati per le coppie asset-requisito completate;
    - asset corrente, requisito corrente e nodo corrente;
    - risposte già fornite nel decision tree corrente.
  + Il sistema genera il file di salvataggio.
  + Il sistema mette a disposizione il file per il download.

== UC-26: Ripresa sessione di valutazione <uc26>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC26.png", width: 100%),
  caption: [UC-26 : Ripresa sessione di valutazione],
)
- *Attore primario:* Utente

- *Precondizioni:* 
  - Il sistema è attivo e si trova allo stato iniziale.
  - L'utente dispone di un file, salvato in precedenza, relativo a una sessione di valutazione interrotta.

- *Postcondizioni:* Il sistema carica la sessione e il test riprende dal punto di interruzione.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di caricamento sessione.
  + L'utente carica il file della sessione salvata.
  + Il sistema ripristina i dati della sessione:
    - dati del dispositivo e degli asset;
    - esiti già registrati per le coppie asset-requisito completate;
    - asset corrente, requisito corrente e nodo corrente;
    - risposte già fornite nel decision tree corrente.
  + Il sistema riprende l'esecuzione dal punto in cui era stata interrotta.

- *Scenari alternativi:*
  - *2a.* Il file non rispetta il formato atteso. #link(<uc3>)[(UC-3)]

- *Estensioni:*
  - #link(<uc3>)[UC-3: Formato file non valido]


== UC-27: Visualizzazione risultati test <uc27>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC27.png", width: 100%),
  caption: [UC-27 : Visualizzazione risultati test],
)
- *Attore primario:* Utente

- *Precondizioni:* La sessione di valutazione è stata completata.

- *Postcondizioni:* L'utente ha visualizzato il riepilogo complessivo degli esiti del test per ogni coppia asset-requisito.

- *Scenario principale:*
  + L'utente visualizza la lista degli asset con il relativo esito aggregato.

- *Scenari alternativi:*
  - L'utente seleziona un asset per visualizzarne il dettaglio. #link(<uc27.1>)[(UC-27.1)]

- *Estensioni:*
  - #link(<uc27.1>)[UC-27.1: Visualizzazione riepilogo risultati per asset]


=== UC-27.1: Visualizzazione riepilogo risultati per asset <uc27.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC27.1.png", width: 100%),
  caption: [UC-27.1 : Visualizzazione riepilogo risultati per asset],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando i risultati del test. #link(<uc27>)[(UC-27)]

- *Postcondizioni:* L'utente ha visualizzato il riepilogo degli esiti per
  un singolo asset.

- *Scenario principale:*
  + L'utente seleziona un asset dalla lista dei risultati.
  + Il sistema mostra il nome e il tipo dell'asset.
  + Il sistema mostra l'esito aggregato dell'asset (PASS, FAIL o NOT APPLICABLE).
  + Il sistema mostra la lista dei requisiti valutati per l'asset con il relativo codice e l'esito di ciascuno.

- *Scenari alternativi:*
  - L'utente seleziona un requisito per visualizzarne il dettaglio. #link(<uc27.1.1>)[(UC-27.1.1)]

- *Estensioni:*
  - #link(<uc27.1.1>)[UC-27.1.1: Visualizzazione dettaglio requisito con esito]


==== UC-27.1.1: Visualizzazione dettaglio requisito con esito <uc27.1.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC27.1.1.png", width: 100%),
  caption: [UC-27.1.1 : Visualizzazione singolo requisito con esito],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il riepilogo risultati per un asset. #link(<uc27.1>)[(UC-27.1)]

- *Postcondizioni:* L'utente ha visualizzato il dettaglio di un requisito con l'esito raggiunto e il percorso logico seguito.

- *Scenario principale:*
  + L'utente visualizza il codice del requisito.
  + L'utente visualizza l'esito del requisito per l'asset corrente (PASS, FAIL o NOT APPLICABLE).
  + L'utente visualizza il percorso logico seguito nel decision tree. #link(<uc27.1.1.1>)[(UC-27.1.1.1)]

- *Inclusioni:*
  - #link(<uc27.1.1.1>)[UC-27.1.1.1: Visualizzazione percorso logico del requisito]

===== UC-27.1.1.1: Visualizzazione percorso logico del requisito <uc27.1.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un singolo
  requisito con il relativo esito. #link(<uc27.1.1>)[(UC-27.1.1)]

- *Postcondizioni:* L'utente ha visualizzato la sequenza ordinata delle risposte
  fornite durante la valutazione del requisito.

- *Scenario principale:*
  + Il sistema mostra la sequenza delle domande affrontate durante l'esecuzione
    del decision tree per il requisito selezionato.
  + Per ogni domanda il sistema mostra il testo del nodo e la risposta fornita.
  + Il sistema evidenzia il nodo foglia raggiunto e l'esito corrispondente.


== UC-28: Esportazione report di conformità <uc28>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC28.png", width: 100%),
  caption: [UC-28 : Esportazione report di conformità],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è stata completata.
  - L'utente sta visualizzando i risultati del test.

- *Postcondizioni:* Il sistema ha generato e messo a disposizione il report
  di conformità per il download.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di esportazione del report.
  + Il sistema raccoglie le informazioni del dispositivo e per ogni coppia asset-requisito:
    - l'esito del singolo requisito;
    - l'esito aggregato del decision tree;
    - la traccia del percorso logico seguito (sequenza ordinata delle risposte
      fornite durante la valutazione).
  + L'utente seleziona il formato di esportazione.
  + Il sistema genera il report nel formato selezionato.
  + Il sistema mette a disposizione il file per il download.

- *Specializzazioni:*
  - #link(<uc28.1>)[UC-28.1: Esportazione report di conformità in PDF]
  - #link(<uc28.2>)[UC-28.2: Esportazione report di conformità in JSON]
  - #link(<uc28.3>)[UC-28.3: Esportazione report di conformità in CSV]

=== UC-28.1: Esportazione report di conformità in PDF <uc28.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'esportazione del report. #link(<uc28>)[(UC-28)]

- *Postcondizioni:* Il sistema ha generato il report in formato PDF.

- *Scenario principale:*
  + L'utente seleziona il formato PDF.
  + Il sistema genera il file PDF contenente, per ogni coppia asset-requisito,
    l'esito del requisito, l'esito aggregato del decision tree e il percorso
    logico seguito, organizzati come riepilogo di conformità del dispositivo
    rispetto allo standard EN 18031.
  + Il sistema mette a disposizione il file per il download.

=== UC-28.2: Esportazione report di conformità in JSON <uc28.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'esportazione del report. #link(<uc28>)[(UC-28)]

- *Postcondizioni:* Il sistema ha generato il report in formato JSON.

- *Scenario principale:*
  + L'utente seleziona il formato JSON.
  + Il sistema genera il file JSON contenente, per ogni coppia asset-requisito, l'esito del requisito, l'esito aggregato del decision tree e il percorso
    logico seguito.
  + Il sistema mette a disposizione il file per il download.

=== UC-28.3: Esportazione report di conformità in CSV <uc28.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'esportazione del report. #link(<uc28>)[(UC-28)]

- *Postcondizioni:* Il sistema ha generato il report in formato CSV.

- *Scenario principale:*
  + L'utente seleziona il formato CSV.
  + Il sistema genera il file CSV contenente, per ogni coppia asset-requisito,
    l'esito del requisito, l'esito aggregato del decision tree e il percorso
    logico seguito, in formato tabellare.
  + Il sistema mette a disposizione il file per il download.

== UC-29: Visualizzazione elenco decision tree <uc29>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC29.png", width: 100%),
  caption: [UC-29 : Visualizzazione elenco decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* 
  - Il sistema è attivo.
  - Non è in corso una sessione di valutazione.

- *Postcondizioni:* L'utente ha visualizzato l'elenco dei decision tree disponibili.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di visualizzazione dei decision tree.
  + Il sistema mostra l'elenco ordinato dei decision tree. #link(<uc29.1>)[(UC-29.1)]

- *Scenari alternativi:*
  - L'utente seleziona la funzionalità di importazione di un decision tree. #link(<uc42>)[(UC-42)]

- *Inclusioni:*
  - #link(<uc29.1>)[UC-29.1: Visualizzazione singolo decision tree nell'elenco]

- *Estensioni:*
  - #link(<uc42>)[UC-42: Importazione decision tree]


=== UC-29.1: Visualizzazione singolo decision tree nell'elenco <uc29.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'elenco dei decision tree. #link(<uc29>)[(UC-29)] 

- *Postcondizioni:* L'utente ha visualizzato le informazioni essenziali del singolo decision tree.

- *Scenario principale:*
  + Il sistema mostra l'id del requisito associato al decision tree.
  + Il sistema mostra il nome del requisito associato al decision tree.


== UC-30: Visualizzazione dettaglio decision tree <uc30>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC30a.png", width: 100%),
  caption: [UC-30 : Visualizzazione dettaglio decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'elenco dei decision tree. 

- *Postcondizioni:* L'utente ha visualizzato il dettaglio del decision tree selezionato.

- *Scenario principale:*
  + L'utente seleziona un decision tree dall'elenco.
  + Il sistema mostra il codice del requisito associato al decision tree.
  + Il sistema mostra il nome del requisito associato al decision tree.
  + Il sistema mostra il grafo del decision tree. #link(<uc30.1>)[(UC-30.1)]
  + Il sistema mostra le dipendenze del decision tree. #link(<uc30.2>)[(UC-30.2)]

- *Scenari alternativi:*
  - L'utente seleziona la funzionalità di modifica del decision tree. #link(<uc31>)[(UC-31)]
  - L'utente seleziona la funzionalità di esportazione del decision tree. #link(<uc38>)[(UC-38)]
  - L'utente seleziona la funzionalità di eliminazione del decision tree. #link(<uc43>)[(UC-43)]

- *Inclusioni:*
  - #link(<uc30.1>)[UC-30.1: Visualizzazione grafo del decision tree]
  - #link(<uc30.2>)[UC-30.2: Visualizzazione dipendenze del decision tree]

- *Estensioni:*
  - #link(<uc31>)[UC-31: Modifica decision tree]
  - #link(<uc38>)[UC-38: Esportazione decision tree]
  - #link(<uc43>)[UC-43: Eliminazione decision tree]
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC30b.png", width: 80%),
  caption: [UC-30 : Inclusioni caso d'uso UC-30],
)

=== UC-30.1: Visualizzazione grafo del decision tree <uc30.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC30.1.png", width: 100%),
  caption: [UC-30.1 : Visualizzazione grafo del decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un decision tree. #link(<uc30>)[(UC-30)]

- *Postcondizioni:* L'utente ha visualizzato il grafo del decision tree.

- *Scenario principale:*
  + Il sistema mostra i nodi interni del decision tree. #link(<uc30.1.1>)[(UC-30.1.1)]
  + Il sistema mostra i nodi foglia del decision tree. #link(<uc30.1.2>)[(UC-30.1.2)]
  + Il sistema mostra i collegamenti fra nodi. #link(<uc30.1.3>)[(UC-30.1.3)]

- *Inclusioni:*
  - #link(<uc30.1.1>)[UC-30.1.1: Visualizzazione nodi interni del decision tree]
  - #link(<uc30.1.2>)[UC-30.1.2: Visualizzazione nodi foglia del decision tree]
  - #link(<uc30.1.3>)[UC-30.1.3: Visualizzazione collegamenti fra nodi]

==== UC-30.1.1: Visualizzazione nodi interni del decision tree <uc30.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il grafo del decision tree. #link(<uc30.1>)[(UC-30.1)]

- *Postcondizioni:* L'utente ha visualizzato i nodi interni del
  decision tree.

- *Scenario principale:*
  + Per ogni nodo interno il sistema mostra il codice univoco.
  + Per ogni nodo interno il sistema mostra il testo della domanda.

==== UC-30.1.2: Visualizzazione nodi foglia del decision tree <uc30.1.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il grafo del decision tree. #link(<uc30.1>)[(UC-30.1)]

- *Postcondizioni:* L'utente ha visualizzato i nodi foglia del
  decision tree.

- *Scenario principale:*
  + Per ogni nodo foglia il sistema mostra l'esito assegnato (PASS, FAIL o NOT APPLICABLE).

==== UC-30.1.3: Visualizzazione collegamenti fra nodi <uc30.1.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il grafo del decision tree. #link(<uc30.1>)[(UC-30.1)]

- *Postcondizioni:* L'utente ha visualizzato i collegamenti fra i nodi del decision tree.

- *Scenario principale:*
  + Per ogni collegamento il sistema mostra l'etichetta Yes/No che indica la risposta associata al ramo.

=== UC-30.2: Visualizzazione dipendenze del decision tree <uc30.2>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC30.2.png", width: 100%),
  caption: [UC-30.2 : Visualizzazione dipendenze del decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un decision tree. #link(<uc30>)[(UC-30)]

- *Postcondizioni:* L'utente ha visualizzato le dipendenze del
  decision tree corrente.

- *Scenario principale:*
  + Il sistema mostra la lista dei requisiti da cui dipende il
    decision tree corrente.
  + Per ogni dipendenza il sistema mostra il codice del requisito.

- *Scenari alternativi:*
  - L'utente seleziona la funzionalità di aggiunta di una nuova dipendenza. #link(<uc40>)[(UC-40)]
  - L'utente seleziona la funzionalità di rimozione di una dipendenza esistente. #link(<uc41>)[(UC-41)]

- *Estensioni:*
  - #link(<uc40>)[UC-40: Aggiunta dipendenza]
  - #link(<uc41>)[UC-41: Eliminazione dipendenza]


== UC-31: Modifica decision tree <uc31>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC31.png", width: 100%),
  caption: [UC-31 : Modifica decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un decision tree. #link(<uc30>)[(UC-30)]

- *Postcondizioni:* Il sistema ha salvato il decision tree con le modifiche apportate dall'utente.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di modifica del decision tree.
  + Il sistema mostra il grafo del decision tree selezionato.
  + L'utente seleziona il tipo di modifica da effettuare.
  + L'utente conferma le modifiche apportate al decision tree.
  + Il sistema salva le modifiche apportate al decision tree.

- *Scenari alternativi:*
  - *5a.* La struttura risultante non supera la validazione. #link(<uc36>)[(UC-36)]
  - L'utente annulla la modifica. #link(<uc37>)[(UC-37)]

- *Estensioni:*
  - #link(<uc36>)[UC-36: Validazione fallita modifica decision tree]
  - #link(<uc37>)[UC-37: Annullamento modifica decision tree]

- *Specializzazioni:*
  - #link(<uc32>)[UC-32: Aggiunta nodo al decision tree]
  - #link(<uc33>)[UC-33: Eliminazione nodo dal decision tree]
  - #link(<uc34>)[UC-34: Modifica destinazione collegamento del decision tree]


== UC-32: Aggiunta nodo al decision tree <uc32>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC32a.png", width: 100%),
  caption: [UC-32 : Aggiunta nodo al decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. #link(<uc31>)[(UC-31)]

- *Postcondizioni:* Un nuovo nodo è stato aggiunto al decision tree e le modifiche sono state salvate.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di aggiunta di un nuovo nodo in una specifica posizione del decision tree.
  + Il sistema crea un nuovo nodo vuoto.
  + L'utente inserisce il codice univoco del nodo. #link(<uc32.1>)[(UC-32.1)]
  + L'utente inserisce il testo della domanda del nodo. #link(<uc32.2>)[(UC-32.2)]
  + L'utente collega il nuovo nodo al decision tree.
  + Il sistema aggiunge il nodo al decision tree e aggiorna la
    visualizzazione.

- *Scenari alternativi:*
  - *6a.* Il nodo ha meno di due rami collegati. #link(<uc32.3>)[(UC-32.3)]

- *Inclusioni:*
  - #link(<uc32.1>)[UC-32.1: Inserimento codice univoco del nodo]
  - #link(<uc32.2>)[UC-32.2: Inserimento testo domanda del nodo]

- *Estensioni:*
  - #link(<uc32.3>)[UC-32.3: Assegnazione esito ramo non collegato]
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC32b.png", width: 80%),
  caption: [UC-32 : Inclusioni caso d'uso UC-32],
)

=== UC-32.1: Inserimento codice univoco del nodo <uc32.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC32.1.png", width: 100%),
  caption: [UC-32.1 : Inserimento codice univoco del nodo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta aggiungendo un nuovo nodo al decision tree. #link(<uc32>)[(UC-32)]

- *Postcondizioni:* Il sistema ha registrato il codice univoco del nuovo nodo.

- *Scenario principale:*
  + L'utente inserisce il codice univoco del nuovo nodo nel rispettivo campo.
  + Il sistema salva il valore inserito.

- *Scenari alternativi:*
  - *2a.* Il codice inserito è già presente nel decision tree. #link(<uc32.1.1>)[(UC-32.1.1)]

- *Estensioni:*
  - #link(<uc32.1.1>)[UC-32.1.1: Inserimento codice univoco non valido]

==== UC-32.1.1: Inserimento codice univoco non valido <uc32.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta inserendo un codice univoco per un nuovo nodo. #link(<uc32.1>)[(UC-32.1)]

- *Postcondizioni:* Il sistema mostra un messaggio di errore e consente all'utente di inserire un nuovo codice.

- *Scenario principale:*
  + Il sistema rileva che il codice inserito è già presente nel decision tree.
  + Il sistema mostra un messaggio di errore e consente all'utente di inserire un nuovo codice.

=== UC-32.2: Inserimento testo domanda del nodo <uc32.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta aggiungendo un nuovo nodo al decision tree. #link(<uc32>)[(UC-32)]

- *Postcondizioni:* Il sistema ha registrato il testo della domanda del
  nuovo nodo.

- *Scenario principale:*
  + L'utente inserisce il testo della domanda del nuovo nodo nel rispettivo
    campo.
  + Il sistema memorizza il testo della domanda inserita dall'utente.

=== UC-32.3: Assegnazione esito ramo non collegato <uc32.3>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC32.3.png", width: 100%),
  caption: [UC-32.3 : Assegnazione esito ramo non collegato],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha modificato un collegamento o aggiunto un nodo al decision tree causando un ramo privo di collegamento. #link(<uc32>)[(UC-32)]

- *Postcondizioni:* Il sistema ha registrato l'esito assegnato ai rami non collegati del nodo.

- *Scenario principale:*
  + Il sistema identifica i rami del nodo privi di collegamento.
  + L'utente seleziona l'esito da assegnare a ciascun ramo non collegato.
  + Il sistema registra l'esito per ciascun ramo non collegato,
    trasformandolo in un nodo foglia.

- *Specializzazioni:*
  - #link(<uc32.3.1>)[UC-32.3.1: Assegnazione esito PASS]
  - #link(<uc32.3.2>)[UC-32.3.2: Assegnazione esito FAIL]
  - #link(<uc32.3.3>)[UC-32.3.3: Assegnazione esito NOT APPLICABLE]

==== UC-32.3.1: Assegnazione esito PASS <uc32.3.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta assegnando un esito a un ramo non collegato. #link(<uc32.3>)[(UC-32.3)]

- *Postcondizioni:* Il ramo non collegato diventa un nodo foglia con esito PASS.

- *Scenario principale:*
  + L'utente seleziona PASS come esito del ramo non collegato.
  + Il sistema crea un nodo foglia PASS collegato al ramo.

==== UC-32.3.2: Assegnazione esito FAIL <uc32.3.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta assegnando un esito a un ramo non collegato. #link(<uc32.3>)[(UC-32.3)]

- *Postcondizioni:* Il ramo non collegato diventa un nodo foglia con esito FAIL.

- *Scenario principale:*
  + L'utente seleziona FAIL come esito del ramo non collegato.
  + Il sistema crea un nodo foglia FAIL collegato al ramo.

==== UC-32.3.3: Assegnazione esito NOT APPLICABLE <uc32.3.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta assegnando un esito a un ramo non collegato. #link(<uc32.3>)[(UC-32.3)]

- *Postcondizioni:* Il ramo non collegato diventa un nodo foglia con esito NOT APPLICABLE.

- *Scenario principale:*
  + L'utente seleziona NOT APPLICABLE come esito del ramo non collegato.
  + Il sistema crea un nodo foglia NOT APPLICABLE collegato al ramo.


== UC-33: Eliminazione nodo dal decision tree <uc33>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC33.png", width: 100%),
  caption: [UC-33 : Eliminazione nodo dal decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. #link(<uc31>)[(UC-31)]

- *Postcondizioni:* Il nodo selezionato è rimosso dal decision tree e i collegamenti sono aggiornati.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di eliminazione di un nodo.
  + L'utente seleziona il nodo da eliminare.
  + Il sistema mostra un messaggio di conferma.
  + L'utente conferma l'eliminazione.
  + Il sistema rimuove il nodo e aggiorna i collegamenti.

- *Scenari alternativi:*
  - *2a.* L'utente seleziona il nodo radice. #link(<uc39>)[(UC-39)]

- *Estensioni:*
  - #link(<uc39>)[UC-39: Tentativo eliminazione nodo radice]


== UC-34: Modifica destinazione collegamento del decision tree <uc34>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC34.png", width: 100%),
  caption: [UC-34 : Modifica destinazione collegamento del decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. #link(<uc31>)[(UC-31)]

- *Postcondizioni:* Il collegamento selezionato è stato aggiornato
  con la nuova destinazione e le modifiche apportate sono state salvate.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di modifica di un collegamento.
  + L'utente seleziona il collegamento da modificare.
  + L'utente seleziona il nuovo nodo di destinazione.
  + Il sistema aggiorna il grafo.

- *Scenari alternativi:*
  - *3a.* Il collegamento che l'utente sta tentando di creare è già presente. #link(<uc35>)[(UC-35)]
  - *4a.* Il collegamento lascia un ramo privo di destinazione. #link(<uc32.3>)[(UC-32.3)]

- *Estensioni:*
  - #link(<uc32.3>)[UC-32.3: Assegnazione esito ramo non collegato]
  - #link(<uc35>)[UC-35: Tentativo di creazione collegamento duplicato]


== UC-35: Tentativo di creazione collegamento duplicato <uc35>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando la destinazione di un collegamento
  del decision tree. #link(<uc34>)[(UC-34)]

- *Postcondizioni:* Il sistema ha notificato l'errore all'utente e la sessione di modifica rimane attiva.

- *Scenario principale:*
  + L'utente seleziona un nodo di destinazione per il collegamento.
  + Il sistema rileva che il collegamento che l'utente sta tentando di creare
    è già presente nel decision tree.
  + Il sistema mostra un messaggio di errore.
  + Il sistema mantiene aperta la schermata di modifica per consentire
    all'utente di selezionare una destinazione diversa.


== UC-36: Validazione fallita modifica decision tree <uc36>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha apportato una modifica al decision tree. #link(<uc31>)[(UC-31)]

- *Postcondizioni:* 
  - Il sistema ha notificato l'errore di validazione all'utente. 
  - La sessione di modifica rimane attiva.

- *Scenario principale:*
  + L'utente tenta di salvare le modifiche apportate al decision tree.
  + Il sistema verifica che la struttura rispetti i seguenti vincoli:
    - l'albero è binario (ogni nodo interno ha esattamente due rami);
    - è presente almeno un nodo foglia con esito PASS;
    - è presente almeno un nodo foglia con esito FAIL.
  + Il sistema rileva una violazione di uno o più vincoli e mostra un messaggio di errore.


== UC-37: Annullamento modifica decision tree <uc37>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. #link(<uc31>)[(UC-31)]

- *Postcondizioni:* Il sistema ha annullato la modifica e ripristinato lo
  stato precedente del decision tree.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di annullamento durante il processo
    di modifica.
  + Il sistema scarta le modifiche non salvate.
  + Il sistema ripristina lo stato precedente del decision tree.


== UC-38: Esportazione decision tree <uc38>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC38.png", width: 100%),
  caption: [UC-38 : Esportazione decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un decision tree. #link(<uc30>)[(UC-30)]

- *Postcondizioni:* Il decision tree è stato esportato nel formato
  selezionato e reso disponibile per il download.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di esportazione del decision tree.
  + L'utente seleziona il formato di esportazione.
  + Il sistema serializza il decision tree nel formato selezionato.
  + Il sistema mette a disposizione il file per il download.

- *Specializzazioni:*
  - #link(<uc38.1>)[UC-38.1: Esportazione decision tree in JSON]
  - #link(<uc38.2>)[UC-38.2: Esportazione decision tree in CSV]

=== UC-38.1: Esportazione decision tree in JSON <uc38.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di esportazione del decision tree. #link(<uc38>)[(UC-38)]

- *Postcondizioni:* Il sistema ha generato il file JSON contenente la struttura del decision tree e lo ha reso disponibile per il download.

- *Scenario principale:*
  + L'utente seleziona il formato JSON.
  + Il sistema serializza il decision tree in formato JSON.

=== UC-38.2: Esportazione decision tree in CSV <uc38.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di esportazione del decision tree. #link(<uc38>)[(UC-38)]

- *Postcondizioni:* Il sistema ha generato il file CSV contenente la struttura del decision tree e lo ha reso disponibile per il download.

- *Scenario principale:*
  + L'utente seleziona il formato CSV.
  + Il sistema serializza il decision tree in formato CSV.


== UC-39: Tentativo eliminazione nodo radice <uc39>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha cercato di eliminare il nodo radice del decision tree.

- *Postcondizioni:* Il sistema ha notificato l'errore e l'eliminazione non
  è stata eseguita.

- *Scenario principale:*
  + Il sistema mostra un messaggio di errore che comunica all'utente che il
    nodo radice non può essere eliminato.


== UC-40: Aggiunta dipendenza <uc40>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC40.png", width: 100%),
  caption: [UC-40 : Aggiunta dipendenza],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando le dipendenze
  del decision tree. #link(<uc30.2>)[(UC-30.2)]

- *Postcondizioni:* Il requisito selezionato è stato aggiunto alle
  dipendenze del decision tree corrente.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di aggiunta di una dipendenza.
  + Il sistema mostra la lista dei requisiti disponibili che possono
    essere aggiunti come dipendenza.
  + L'utente seleziona il requisito da aggiungere come dipendenza.
  + Il sistema aggiunge il requisito alle dipendenze del decision tree
    e salva la modifica apportata.

- *Scenari alternativi:*
  - *3a.* L'aggiunta del requisito crea una dipendenza circolare. #link(<uc40.1>)[(UC-40.1)]

- *Estensioni:*
  - #link(<uc40.1>)[UC-40.1: Errore dipendenza circolare]


=== UC-40.1: Errore dipendenza circolare <uc40.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un requisito da aggiungere come dipendenza. #link(<uc40>)[(UC-40)]

- *Postcondizioni:* L'utente viene notificato dell'errore e la lista delle dipendenze rimane invariata.

- *Scenario principale:*
  + Il sistema rileva che il requisito selezionato crea una dipendenza
    circolare.
  + Il sistema blocca l'aggiunta.
  + Il sistema mostra un messaggio di errore.


== UC-41: Eliminazione dipendenza <uc41>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando le dipendenze
  del decision tree. #link(<uc30.2>)[(UC-30.2)]

- *Postcondizioni:* Il requisito selezionato è stato rimosso dalle
  dipendenze del decision tree corrente.

- *Scenario principale:*
  + L'utente seleziona il requisito da rimuovere dalle dipendenze.
  + Il sistema rimuove il requisito dalla lista delle dipendenze.
  + Il sistema salva la modifica apportata.

== UC-42: Importazione decision tree <uc42>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC42.png", width: 100%),
  caption: [UC-42 : Importazione decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'elenco dei decision tree.
  #link(<uc29>)[(UC-29)]

- *Postcondizioni:* Il sistema ha caricato il decision tree contenuto nel
  file importato e lo ha reso disponibile per le sessioni di
  valutazione successive.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di importazione di un nuovo
    decision tree.
  + L'utente seleziona il file da importare. #link(<uc42.1>)[(UC-42.1)]
  + Il sistema carica il decision tree e lo salva.
  + Il sistema aggiorna l'elenco dei decision tree disponibili.

- *Scenari alternativi:*
  - *3a.* Il file non rispetta il formato atteso o i vincoli strutturali. #link(<uc3>)[(UC-3)]

- *Inclusioni:*
  - #link(<uc42.1>)[UC-42.1: Selezione file sorgente decision tree]

- *Estensioni:*
  - #link(<uc3>)[UC-3: Formato file non valido]

=== UC-42.1: Selezione file sorgente decision tree <uc42.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC42.1.png", width: 100%),
  caption: [UC-42.1 : Selezione file sorgente decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di importazione di un nuovo decision tree. #link(<uc42>)[(UC-42)]

- *Postcondizioni:* Il sistema ha acquisito il file del decision tree.

- *Scenario principale:*
  + L'utente seleziona il file da importare.
  + Il sistema acquisisce il file.

- *Specializzazioni:*
  - #link(<uc42.1.1>)[UC-42.1.1: Importazione decision tree da file JSON]
  - #link(<uc42.1.2>)[UC-42.1.2: Importazione decision tree da file CSV]

==== UC-42.1.1: Importazione decision tree da file JSON <uc42.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta selezionando il file sorgente per l'importazione del decision tree. #link(<uc42.1>)[(UC-42.1)]

- *Postcondizioni:* Il sistema ha acquisito il file JSON del decision tree.

- *Scenario principale:*
  + L'utente seleziona un file in formato JSON come sorgente per l'importazione del decision tree.

==== UC-42.1.2: Importazione decision tree da file CSV <uc42.1.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta selezionando il file sorgente per l'importazione del decision tree. #link(<uc42.1>)[(UC-42.1)]

- *Postcondizioni:* Il sistema ha acquisito il file CSV del decision tree.

- *Scenario principale:*
  + L'utente seleziona un file in formato CSV come sorgente per l'importazione del decision tree.


== UC-43: Eliminazione decision tree <uc43>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un
  decision tree. #link(<uc30>)[(UC-30)]

- *Postcondizioni:* Il decision tree selezionato è stato rimosso dal sistema.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di eliminazione del decision tree.
  + Il sistema mostra un messaggio di conferma.
  + L'utente conferma l'eliminazione.
  + Il sistema rimuove il decision tree e aggiorna l'elenco.

- *Scenari alternativi:*
  - *3a.* L'utente annulla l'operazione.

#pagebreak()
#set heading(numbering: "1.1.")
= Requisiti

In questa sezione vengono presentati e catalogati i requisiti emersi dall'analisi dei casi d'uso, dallo studio approfondito del capitolato d'appalto e del dominio tecnologico di riferimento, nonché dalle indicazioni e dai vincoli concordati durante i frequenti incontri di confronto con l'azienda proponente.

== Requisiti Funzionali

I requisiti funzionali definiscono in modo atomico le capacità, i comportamenti e le specifiche azioni che il sistema software deve essere in grado di eseguire in risposta a determinati input, eventi o stati della sessione utente. Al fine di garantire una corretta pianificazione delle attività di sviluppo, essi sono stati classificati in base alla loro priorità:

- *Obbligatori (RF-Ob):* requisiti fondamentali e imprescindibili, la cui implementazione è strettamente necessaria per soddisfare i bisogni primari del core business aziendale espressi dalla proponente;
- *Desiderabili (RF-D):* requisiti che arricchiscono il sistema introducendo funzionalità a valore aggiunto per l'utente, non strettamente bloccanti ma importanti per la fluidità del flusso operativo;
- *Opzionali (RF-Op):* requisiti che estendono la piattaforma con funzionalità ausiliarie e di raffinamento, gradite ma non essenziali ai fini della validazione dell'applicazione.

=== Requisiti Funzionali Obbligatori

#table(
  columns: (1.2fr, 3fr, 1fr),
  align: (center, left, center),
  stroke: 0.5pt + luma(150),
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  table.header(
    [*Codice*], [*Descrizione*], [*Fonti*],
  ),

  // --- AREA GESTIONE DISPOSITIVI (UC-1 a UC-11) ---
  [RF-Ob01], [Il sistema deve permettere l'inserimento di un nuovo dispositivo all'interno della piattaforma.], [#link(<uc1>)[UC-1]],
  [RF-Ob02], [Il sistema deve permettere l'importazione di un dispositivo tramite un file di configurazione in formato JSON o CSV.], [#link(<uc2>)[UC-2]],
  [RF-Ob03], [Il sistema deve permettere la selezione del file sorgente per l'importazione del dispositivo.], [#link(<uc2.1>)[UC-2.1]],
  [RF-Ob04], [Il sistema deve supportare la selezione di un file in formato JSON come sorgente per l'importazione del dispositivo.], [#link(<uc2.1.1>)[UC-2.1.1]],
  [RF-Ob05], [Il sistema deve supportare la selezione di un file in formato CSV come sorgente per l'importazione del dispositivo.], [#link(<uc2.1.2>)[UC-2.1.2]],
  [RF-Ob06], [Il sistema deve verificare la validità strutturale e la conformità del file di configurazione caricato.], [#link(<uc2>)[UC-2]],
  [RF-Ob07], [Il sistema deve bloccare l'importazione e mostrare un messaggio di errore se il file ha un formato non valido.], [#link(<uc3>)[UC-3]],
  [RF-Ob08], [Il sistema deve permettere la creazione manuale di un nuovo dispositivo.], [#link(<uc4>)[UC-4]],
  [RF-Ob09], [Il sistema deve richiedere l'inserimento dei dati identificativi del dispositivo durante la creazione manuale.], [#link(<uc4.1>)[UC-4.1]],
  [RF-Ob10], [Il sistema deve permettere l'inserimento del nome identificativo del dispositivo.], [#link(<uc4.1.1>)[UC-4.1.1]],
  [RF-Ob11], [Il sistema deve permettere l'inserimento del sistema operativo del dispositivo.], [#link(<uc4.1.2>)[UC-4.1.2]],
  [RF-Ob12], [Il sistema deve permettere l'inserimento di una descrizione testuale del dispositivo.], [#link(<uc4.1.3>)[UC-4.1.3]],
  [RF-Ob13], [Il sistema deve validare i dati inseriti nei form e mostrare un errore in caso di campi vuoti o non conformi.], [#link(<uc5>)[UC-5]],
  [RF-Ob14], [Il sistema deve permettere la visualizzazione delle informazioni e dei dati relativi al dispositivo.], [#link(<uc7>)[UC-7]],
  [RF-Ob15], [Il sistema deve mostrare in dettaglio il nome del dispositivo registrato.], [#link(<uc7.1>)[UC-7.1]],
  [RF-Ob16], [Il sistema deve mostrare in dettaglio il sistema operativo del dispositivo registrato.], [#link(<uc7.2>)[UC-7.2]],
  [RF-Ob17], [Il sistema deve mostrare in dettaglio la descrizione del dispositivo registrato.], [#link(<uc7.3>)[UC-7.3]],
  [RF-Ob18], [Il sistema deve calcolare e mostrare lo stato aggregato di valutazione del dispositivo (non valutato, PASS, FAIL).], [#link(<uc7.4>)[UC-7.4]],
  [RF-Ob19], [Il sistema deve permettere l'esportazione di tutti i dati di un dispositivo in formato JSON o CSV.], [#link(<uc10>)[UC-10]],
  [RF-Ob20], [Il sistema deve consentire l'esportazione dei dati del dispositivo e degli asset associati in formato JSON.], [#link(<uc10.1>)[UC-10.1]],
  [RF-Ob21], [Il sistema deve consentire l'esportazione dei dati del dispositivo e degli asset associati in formato CSV.], [#link(<uc10.2>)[UC-10.2]],
  [RF-Ob22], [Il sistema deve permettere l'eliminazione definitiva di un dispositivo dal sistema.], [#link(<uc11>)[UC-11]],
  [RF-Ob23], [Il sistema deve consentire l'eliminazione diretta di un dispositivo senza effettuare il backup dei dati.], [#link(<uc11.1>)[UC-11.1]],
  [RF-Ob24], [Il sistema deve consentire l'eliminazione del dispositivo previa esportazione automatica di backup dei dati.], [#link(<uc11.2>)[UC-11.2]],

  // --- AREA GESTIONE ASSET (UC-12 a UC-18) ---
  [RF-Ob25], [Il sistema deve permettere l'inserimento di un nuovo asset all'interno di un dispositivo.], [#link(<uc12>)[UC-12]],
  [RF-Ob26], [Il sistema deve richiedere la compilazione dei dati dell'asset nel form di creazione.], [#link(<uc12.1>)[UC-12.1]],
  [RF-Ob27], [Il sistema deve permettere l'inserimento del nome dell'asset nel form di creazione.], [#link(<uc12.1.1>)[UC-12.1.1]],
  [RF-Ob28], [Il sistema deve permettere la selezione del tipo di asset tra Network, Security, Privacy e Financial.], [#link(<uc12.1.2>)[UC-12.1.2]],
  [RF-Ob29], [Il sistema deve permettere l'inserimento della descrizione dell'asset nel form di creazione.], [#link(<uc12.1.3>)[UC-12.1.3]],
  [RF-Ob30], [Il sistema deve permettere di impostare la sensibilità dell'asset (SI o NO).], [#link(<uc12.1.4>)[UC-12.1.4]],
  [RF-Ob31], [Il sistema deve permettere la visualizzazione della lista degli asset associati ad un determinato dispositivo.], [#link(<uc14>)[UC-14]],
  [RF-Ob32], [Il sistema deve mostrare le informazioni essenziali del singolo asset all'interno della lista.], [#link(<uc14.1>)[UC-14.1]],
  [RF-Ob33], [Il sistema deve mostrare il nome del singolo asset all'interno della lista.], [#link(<uc14.1.1>)[UC-14.1.1]],
  [RF-Ob34], [Il sistema deve mostrare il tipo del singolo asset all'interno della lista.], [#link(<uc14.1.2>)[UC-14.1.2]],
  [RF-Ob35], [Il sistema deve mostrare lo stato di valutazione del singolo asset all'interno della lista.], [#link(<uc14.1.3>)[UC-14.1.3]],
  [RF-Ob36], [Il sistema deve permettere la visualizzazione in dettaglio di tutte le informazioni di un singolo asset selezionato.], [#link(<uc15>)[UC-15]],
  [RF-Ob37], [Il sistema deve mostrare nel dettaglio il nome dell'asset selezionato.], [#link(<uc15.1>)[UC-15.1], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob38], [Il sistema deve mostrare nel dettaglio il tipo dell'asset selezionato.], [#link(<uc15.2>)[UC-15.2], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob39], [Il sistema deve mostrare nel dettaglio la descrizione dell'asset selezionato.], [#link(<uc15.3>)[UC-15.3], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob40], [Il sistema deve mostrare nel dettaglio il livello di sensibilità dell'asset selezionato.], [#link(<uc15.4>)[UC-15.4], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob41], [Il sistema deve mostrare lo stato complessivo di valutazione dell'asset selezionato.], [#link(<uc15.5>)[UC-15.5], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob42], [Il sistema deve mostrare la lista dei requisiti da valutare associati all'asset.], [#link(<uc15.6>)[UC-15.6], #link(<uc20.2>)[UC-20.2]],
  [RF-Ob43], [Il sistema deve mostrare il codice identificativo e lo stato di valutazione di ogni requisito nella lista.], [#link(<uc15.6.1>)[UC-15.6.1], #link(<uc20.2.1>)[UC-20.2.1]],
  [RF-Ob44], [Il sistema deve permettere l'eliminazione definitiva di un asset da un dispositivo.], [#link(<uc18>)[UC-18]],

  // --- AREA ESECUZIONE VALUTAZIONE (UC-19 a UC-28) ---
  [RF-Ob45], [Il sistema deve permettere l'esecuzione di una sessione di
  valutazione di conformità per un dispositivo.], [#link(<uc19>)[UC-19]],
  [RF-Ob46], [Il sistema deve mostrare una dashboard di valutazione con la lista degli asset, il loro stato, e il progresso della sessione in tempo reale.], [#link(<uc19.1>)[UC-19.1]],
  [RF-Ob47], [Il sistema deve consentire la selezione e l'avvio della valutazione dei requisiti di un singolo asset.], [#link(<uc20>)[UC-20]],
  [RF-Ob48], [Il sistema deve mostrare il codice e il nome del requisito selezionato prima dell'avvio dell'esecuzione del decision tree.], [#link(<uc21>)[UC-21]],
  [RF-Ob49], [Il sistema deve mostrare le dipendenze del requisito selezionato e il loro stato di valutazione prima dell'esecuzione.], [#link(<uc21.1>)[UC-21.1]],
  [RF-Ob50], [Il sistema deve guidare l'utente eseguendo il decision tree associato al requisito selezionato.], [#link(<uc22>)[UC-22]],
  [RF-Ob51], [Il sistema deve mostrare il codice univoco e il testo della domanda del nodo corrente dell'albero.], [#link(<uc22.1>)[UC-22.1]],
  [RF-Ob52], [Il sistema deve registrare la risposta dell'utente avanzandone il percorso sul grafo.], [#link(<uc22.3>)[UC-22.3]],
  [RF-Ob53], [Il sistema deve gestire la risposta affermativa ("Yes") spostando il flusso sul relativo ramo.], [#link(<uc22.3.1>)[UC-22.3.1]],
  [RF-Ob54], [Il sistema deve gestire la risposta negativa ("No") spostando il flusso sul relativo ramo.], [#link(<uc22.3.2>)[UC-22.3.2]],
  [RF-Ob55], [Il sistema deve visualizzare a schermo il grafo completo del decision tree durante l'esecuzione.], [#link(<uc22.2>)[UC-22.2]],
  [RF-Ob56], [Il sistema deve evidenziare graficamente nel grafo il nodo corrente e il percorso già intrapreso.], [#link(<uc22.2>)[UC-22.2]],
  [RF-Ob57], [Il sistema deve mostrare un nodo foglia al termine del percorso con l'esito (PASS, FAIL, NOT APPLICABLE).], [#link(<uc23>)[UC-23]],
  [RF-Ob58], [Il sistema deve generare un file JSON contenente lo stato della sessione di valutazione per il download.], [#link(<uc25>)[UC-25]],
  [RF-Ob59], [Il sistema deve permettere il caricamento di un file di sessione per riprendere un test interrotto.], [#link(<uc26>)[UC-26]],
  [RF-Ob60], [Il sistema deve mostrare una schermata finale con il riepilogo complessivo di tutti gli esiti del test.], [#link(<uc27>)[UC-27]],
  [RF-Ob61], [Il sistema deve mostrare per ogni asset la lista dei requisiti completati e il percorso logico seguito.], [#link(<uc27.1.1>)[UC-27.1.1]],
  [RF-Ob62], [Il sistema deve mostrare la sequenza ordinata di domande e risposte fornite per un requisito completato.], [#link(<uc27.1.1.1>)[UC-27.1.1.1]],

  // --- AREA GESTIONE DECISION TREE (UC-29 a UC-43) ---
  [RF-Ob63], [Il sistema deve mostrare l'elenco dei decision tree disponibili memorizzati nel backend.], [#link(<uc29>)[UC-29]],
  [RF-Ob64], [Il sistema deve mostrare l'ID e il nome del requisito per ogni decision tree in elenco.], [#link(<uc29.1>)[UC-29.1]],
  [RF-Ob65], [Il sistema deve permettere la visualizzazione in dettaglio di un decision tree esistente, mostrandone l'identificativo e il nome del requisito associato.], [#link(<uc30>)[UC-30]],
  [RF-Ob66], [Il sistema deve permettere all'utente di uscire anticipatamente da una sessione di valutazione in corso.], [#link(<uc24>)[UC-24]],
  [RF-Ob67], [Il sistema deve mostrare il riepilogo degli esiti per ogni singolo asset al termine del test.], [#link(<uc27.1>)[UC-27.1]],
  [RF-Ob68], [Il sistema deve permettere il salvataggio della sessione di valutazione in corso, generando un file con lo stato della sessione.], [#link(<uc25>)[UC-25]],
  [RF-Ob69], [Il sistema deve visualizzare il grafo del decision tree nel dettaglio, mostrando nodi interni, nodi foglia con esito e collegamenti fra nodi.], [#link(<uc30.1>)[UC-30.1]],
  [RF-Ob70], [Il sistema deve mostrare i nodi interni del grafo del decision tree, con il relativo codice univoco e il testo della domanda.], [#link(<uc30.1.1>)[UC-30.1.1]],
  [RF-Ob71], [Il sistema deve mostrare i nodi foglia del grafo del decision tree, con l'esito associato (PASS, FAIL, NOT APPLICABLE).], [#link(<uc30.1.2>)[UC-30.1.2]],
  [RF-Ob72], [Il sistema deve mostrare i collegamenti fra i nodi del grafo del decision tree, con l'etichetta Yes/No associata a ciascun ramo.], [#link(<uc30.1.3>)[UC-30.1.3]],
  [RF-Ob73], [Il sistema deve mostrare le dipendenze del decision tree, elencando i requisiti da cui esso dipende con il relativo codice.], [#link(<uc30.2>)[UC-30.2]],
  [RF-Ob74], [Il sistema deve permettere l'esportazione di un file di un decision tree in formato JSON o CSV.], [#link(<uc38>)[UC-38]],
  [RF-Ob75], [Il sistema deve consentire l'esportazione di un decision tree in formato JSON.], [#link(<uc38.1>)[UC-38.1]],
  [RF-Ob76], [Il sistema deve consentire l'esportazione di un decision tree in formato CSV.], [#link(<uc38.2>)[UC-38.2]],
  [RF-Ob77], [Il sistema deve generare un report di conformità finale contenente, per ogni coppia asset-requisito, l'esito del requisito, l'esito aggregato del decision tree e il percorso logico seguito.], [#link(<uc28>)[UC-28], Verbale esterno],
)

#pagebreak()

=== Requisiti Funzionali Desiderabili

#table(
  columns: (1.2fr, 3fr, 1fr),
  align: (center, left, center),
  stroke: 0.5pt + luma(150),
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  table.header(
    [*Codice*], [*Descrizione*], [*Fonti*],
  ),

  [RF-D01], [Il sistema deve permettere l'annullamento della procedura di inserimento di un dispositivo, ripristinando lo stato precedente.], [#link(<uc6>)[UC-6]],
  [RF-D02], [Il sistema deve permettere l'annullamento della procedura di modifica di un dispositivo, scartando i dati inseriti e mantenendo invariati quelli preesistenti.], [#link(<uc9>)[UC-9]],
  [RF-D03], [Il sistema deve permettere l'annullamento della procedura di eliminazione di un dispositivo durante la fase di richiesta di conferma.], [#link(<uc11>)[UC-11]],
  [RF-D04], [Il sistema deve permettere l'annullamento della procedura di inserimento di un asset, ripristinando lo stato precedente.], [#link(<uc13>)[UC-13]],
  [RF-D05], [Il sistema deve permettere l'annullamento della procedura di modifica di un asset, scartando le modifiche non salvate.], [#link(<uc17>)[UC-17]],
  [RF-D06], [Il sistema deve permettere l'annullamento della procedura di eliminazione di un asset durante la fase di richiesta di conferma.], [#link(<uc18>)[UC-18]],
  [RF-D07], [Il sistema deve permettere la navigazione al nodo precedente del decision tree, mostrando la risposta già fornita senza invalidare le risposte successive.], [#link(<uc22.4>)[UC-22.4]],
  [RF-D08], [Il sistema deve permettere il salvataggio intermedio dello stato della sessione di valutazione.], [#link(<uc25>)[UC-25]],
  [RF-D09], [Il sistema deve permettere all'utente di navigare verso il nodo successivo precedentemente già risposto durante l'esecuzione del decision tree.], [#link(<uc22.5>)[UC-22.5]],
  [RF-D10], [Il sistema deve permettere la modifica della risposta a un nodo già risposto, invalidando le risposte successive al nodo corrente.], [#link(<uc22.6>)[UC-22.6]],
  [RF-D11], [Il sistema deve mostrare la giustificazione testuale del risultato raggiunto al termine dell'esecuzione del decision tree.], [#link(<uc23>)[UC-23]],
  [RF-D12], [Il sistema deve permettere l'inserimento di una giustificazione testuale per l'esito della coppia asset-requisito al termine dell'esecuzione del decision tree.], [#link(<uc23.1>)[UC-23.1]],

  [RF-D13], [Il sistema deve permettere la modifica delle informazioni anagrafiche di un dispositivo esistente.], [#link(<uc8>)[UC-8]],
  [RF-D14], [Il sistema deve consentire la modifica del nome del dispositivo.], [#link(<uc8.1>)[UC-8.1]],
  [RF-D15], [Il sistema deve consentire la modifica del sistema operativo del dispositivo.], [#link(<uc8.2>)[UC-8.2]],
  [RF-D16], [Il sistema deve consentire la modifica della descrizione del dispositivo.], [#link(<uc8.3>)[UC-8.3]],
  [RF-D17], [Il sistema deve permettere la modifica delle informazioni di un asset esistente.], [#link(<uc16>)[UC-16]],
  [RF-D18], [Il sistema deve consentire la modifica del nome dell'asset.], [#link(<uc16.1>)[UC-16.1]],
  [RF-D19], [Il sistema deve consentire la modifica del tipo dell'asset tramite opzioni predefinite.], [#link(<uc16.2>)[UC-16.2]],
  [RF-D20], [Il sistema deve consentire la modifica della descrizione dell'asset.], [#link(<uc16.3>)[UC-16.3]],
  [RF-D21], [Il sistema deve consentire la modifica della sensibilità dell'asset.], [#link(<uc16.4>)[UC-16.4]],
  [RF-D22], [Il sistema deve permettere l'importazione e la validazione strutturale di un nuovo decision tree da file.], [#link(<uc42>)[UC-42]],
  [RF-D23], [Il sistema deve permettere la selezione del file sorgente per l'importazione di un decision tree.], [#link(<uc42.1>)[UC-42.1]],
  [RF-D24], [Il sistema deve supportare l'importazione di un decision tree da file in formato JSON.], [#link(<uc42.1.1>)[UC-42.1.1]],
  [RF-D25], [Il sistema deve supportare l'importazione di un decision tree da file in formato CSV.], [#link(<uc42.1.2>)[UC-42.1.2]],
)

#pagebreak()

=== Requisiti Funzionali Opzionali

#table(
  columns: (1.2fr, 3fr, 1fr),
  align: (center, left, center),
  stroke: 0.5pt + luma(150),
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  table.header(
    [*Codice*], [*Descrizione*], [*Fonti*],
  ),

  [RF-Op01], [Il sistema deve mostrare la notifica dell'avvenuto salvataggio intermedio della sessione di valutazione.], [#link(<uc25>)[UC-25]],
  [RF-Op02], [Il sistema deve permettere l'aggiunta manuale di una dipendenza tra requisiti all'interno di un decision tree.], [#link(<uc40>)[UC-40]],
  [RF-Op03], [Il sistema deve permettere la rimozione di una dipendenza tra requisiti da un decision tree.], [#link(<uc41>)[UC-41]],
  [RF-Op04], [Il sistema deve bloccare l'aggiunta e notificare l'utente se il requisito selezionato crea una dipendenza circolare.], [#link(<uc40.1>)[UC-40.1]],
  [RF-Op05], [Il sistema deve permettere l'aggiunta di un nuovo nodo all'interno di un decision tree.], [#link(<uc32>)[UC-32]],
  [RF-Op06], [Il sistema deve permettere l'inserimento di un codice univoco per il nuovo nodo.], [#link(<uc32.1>)[UC-32.1]],
  [RF-Op07], [Il sistema deve permettere l'inserimento del testo della domanda del nuovo nodo.], [#link(<uc32.2>)[UC-32.2]],
  [RF-Op08], [Il sistema deve permettere l'eliminazione di un nodo esistente da un decision tree.], [#link(<uc33>)[UC-33]],
  [RF-Op09], [Il sistema deve impedire la creazione di collegamenti duplicati mostrando una notifica di errore.], [#link(<uc35>)[UC-35]],
  [RF-Op10], [Il sistema deve validare la struttura dell'albero modificato secondo i vincoli di consistenza predefiniti.], [#link(<uc36>)[UC-36]],
  [RF-Op11], [Il sistema deve impedire il salvataggio e mostrare un errore se l'albero non è binario o mancano foglie PASS/FAIL.], [#link(<uc36>)[UC-36]],
  [RF-Op12], [Il sistema deve impedire l'eliminazione del nodo radice di un decision tree mostrando un errore.], [#link(<uc39>)[UC-39]],
  [RF-Op13], [Il sistema deve consentire l'eliminazione definitiva di un decision tree dal backend.], [#link(<uc43>)[UC-43]],
  [RF-Op14], [Il sistema deve bloccare l'inserimento e mostrare un messaggio di errore se il codice del nodo è già presente nel decision tree.], [#link(<uc32.1.1>)[UC-32.1.1]],
  [RF-Op15], [Il sistema deve permettere all'utente di assegnare un esito (PASS, FAIL o NOT APPLICABLE) ai rami non collegati di un nodo appena aggiunto o modificato nel decision tree, trasformandoli in nodi foglia.], [#link(<uc32.3>)[UC-32.3]],
  [RF-Op16], [Il sistema deve permettere l'annullamento delle modifiche effettuate su un decision tree, ripristinando lo stato iniziale del grafo.], [#link(<uc37>)[UC-37]],
  [RF-Op17], [Il sistema deve permettere la modifica della destinazione di un collegamento tra nodi (Yes/No).], [#link(<uc34>)[UC-34]],
  [RF-Op18], [Il sistema deve permettere la modifica strutturale di un decision tree esistente.], [#link(<uc31>)[UC-31]],
  [RF-Op19], [Il sistema deve consentire il download del report di conformità in formato PDF.], [#link(<uc28.1>)[UC-28.1]],
  [RF-Op20], [Il sistema deve consentire il download del report di conformità in formato JSON.], [#link(<uc28.2>)[UC-28.2]],
  [RF-Op21], [Il sistema deve consentire il download del report di conformità in formato CSV.], [#link(<uc28.3>)[UC-28.3]],
)

== Requisiti di Qualità

I requisiti di qualità definiscono i criteri di validazione, gli standard metrici e gli obblighi di verifica che il team e il prodotto software devono soddisfare in conformità con i criteri di completamento e consegna stabiliti nel capitolato d'appalto e nei documenti di qualifica interni. In linea con l'approccio dei documenti di riferimento, tutti i requisiti di qualità individuati sono da considerarsi strettamente obbligatori.

#table(
  columns: (1.2fr, 3fr, 1.2fr),
  align: (center, left, center),
  stroke: 0.5pt + luma(150),
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  table.header(
    [*Codice*], [*Descrizione*], [*Fonti*],
  ),

  [RQ-Ob01], [Il codice sorgente e la gestione dei processi di sviluppo devono rispettare tassativamente le convenzioni e gli standard definiti nelle Norme di Progetto.], [Norme di Progetto],
  [RQ-Ob02], [Il sistema e i deliverable di progetto devono essere conformi alle metriche, agli indici e agli obiettivi di verifica stabiliti all'interno del Piano di Qualifica.], [Piano di Qualifica],
  [RQ-Ob03], [Il prodotto software deve essere corredato da una suite di test automatizzati (di Unità, Integrazione, Sistema e Regressione) per verificarne il corretto funzionamento complessivo.], [Capitolato C1, Piano di Qualifica],
  [RQ-Ob04], [Il prodotto software deve superare i Test di Accettazione finali in sede di revisione per dimostrare la piena conformità alle richieste della proponente.], [Capitolato C1],
  [RQ-Ob05], [Il sistema software deve essere accompagnato da un Manuale Utente che descriva in modo chiaro le funzionalità dell'applicazione.], [Capitolato C1],
  [RQ-Ob06], [Il codice sorgente del prodotto deve essere documentato tramite un Manuale Tecnico, e deve essere prodotta una documentazione di progetto comprendente requisiti, architettura, scelte tecnologiche e metodologia di sviluppo.], [Capitolato C1],
  [RQ-Ob07], [La gestione del ciclo di vita del progetto e l'organizzazione delle attività del team devono adottare un approccio Agile, garantendo iterazioni regolari e flessibilità.], [Norme di Progetto],
)

== Requisiti di Vincolo

I requisiti di vincolo definiscono le restrizioni tecniche, le piattaforme e gli standard implementativi che circoscrivono le scelte progettuali del sistema. Essi si suddividono in obbligatori, se imposti espressamente dal capitolato d'appalto, e opzionali, se derivanti da accordi successivi o preferenze tecnologiche del team.

=== Requisiti di Vincolo Obbligatori

#table(
  columns: (1.2fr, 3fr, 1.2fr),
  align: (center, left, center),
  stroke: 0.5pt + luma(150),
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  table.header(
    [*Codice*], [*Descrizione*], [*Fonti*],
  ),

  [RV-Ob01], [La logica di backend deve essere sviluppata in linguaggio Python 3.x e la gestione dei relativi pacchetti software deve essere strutturata tramite Python Packaging utilizzando il file pyproject.toml.], [Capitolato C1],
  [RV-Ob02], [L'applicazione deve essere distribuita e fruibile sotto forma di applicazione web locale accessibile all'indirizzo localhost, garantendo la piena compatibilità operativa sui principali browser moderni (Google Chrome, Mozilla Firefox, Apple Safari, Microsoft Edge).], [Capitolato C1],
  [RV-Ob03], [L'interfaccia utente (frontend) dell'applicazione web deve essere realizzata utilizzando la libreria React.], [Verbale Esterno],
  [RV-Ob04], [Il sistema deve utilizzare Git come software di controllo di versione distribuito per la gestione del codice sorgente.], [Verbale Esterno],
  [RV-Ob05], [Il sistema deve utilizzare Docker per la containerizzazione e il deployment dell'applicazione.], [Verbale Esterno],
  [RV-Ob06], [La logica di backend deve essere sviluppata utilizzando il framework Flask.], [Verbale Esterno],
)

#pagebreak()

== Tracciamento dei Requisiti e Riepilogo

In questa sezione viene fornito un quadro di tracciamento bidirezionale per associare in modo univoco ciascun requisito funzionale ai casi d'uso che lo hanno generato, seguito da un riepilogo statistico complessivo delle componenti individuate nell'analisi.

=== Tabella di Tracciamento Requisiti - Casi d'Uso

#table(
  columns: (1.5fr, 2fr),
  align: (center, center),
  stroke: 0.5pt + luma(150),
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  table.header(
    [*Codice Requisito*], [*Casi d'Uso Associati*],
  ),

  [RF-Ob01], [#link(<uc1>)[UC-1]],
  [RF-Ob02], [#link(<uc2>)[UC-2]],
  [RF-Ob03], [#link(<uc2.1>)[UC-2.1]],
  [RF-Ob04], [#link(<uc2.1.1>)[UC-2.1.1]],
  [RF-Ob05], [#link(<uc2.1.2>)[UC-2.1.2]],
  [RF-Ob06], [#link(<uc2>)[UC-2]],
  [RF-Ob07], [#link(<uc3>)[UC-3]],
  [RF-Ob08], [#link(<uc4>)[UC-4]],
  [RF-Ob09], [#link(<uc4.1>)[UC-4.1]],
  [RF-Ob10], [#link(<uc4.1.1>)[UC-4.1.1]],
  [RF-Ob11], [#link(<uc4.1.2>)[UC-4.1.2]],
  [RF-Ob12], [#link(<uc4.1.3>)[UC-4.1.3]],
  [RF-Ob13], [#link(<uc5>)[UC-5]],
  [RF-Ob14], [#link(<uc7>)[UC-7]],
  [RF-Ob15], [#link(<uc7.1>)[UC-7.1]],
  [RF-Ob16], [#link(<uc7.2>)[UC-7.2]],
  [RF-Ob17], [#link(<uc7.3>)[UC-7.3]],
  [RF-Ob18], [#link(<uc7.4>)[UC-7.4]],
  [RF-Ob19], [#link(<uc10>)[UC-10]],
  [RF-Ob20], [#link(<uc10.1>)[UC-10.1]],
  [RF-Ob21], [#link(<uc10.2>)[UC-10.2]],
  [RF-Ob22], [#link(<uc11>)[UC-11]],
  [RF-Ob23], [#link(<uc11.1>)[UC-11.1]],
  [RF-Ob24], [#link(<uc11.2>)[UC-11.2]],
  [RF-Ob25], [#link(<uc12>)[UC-12]],
  [RF-Ob26], [#link(<uc12.1>)[UC-12.1]],
  [RF-Ob27], [#link(<uc12.1.1>)[UC-12.1.1]],
  [RF-Ob28], [#link(<uc12.1.2>)[UC-12.1.2]],
  [RF-Ob29], [#link(<uc12.1.3>)[UC-12.1.3]],
  [RF-Ob30], [#link(<uc12.1.4>)[UC-12.1.4]],
  [RF-Ob31], [#link(<uc14>)[UC-14]],
  [RF-Ob32], [#link(<uc14.1>)[UC-14.1]],
  [RF-Ob33], [#link(<uc14.1.1>)[UC-14.1.1]],
  [RF-Ob34], [#link(<uc14.1.2>)[UC-14.1.2]],
  [RF-Ob35], [#link(<uc14.1.3>)[UC-14.1.3]],
  [RF-Ob36], [#link(<uc15>)[UC-15]],
  [RF-Ob37], [#link(<uc15.1>)[UC-15.1], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob38], [#link(<uc15.2>)[UC-15.2], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob39], [#link(<uc15.3>)[UC-15.3], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob40], [#link(<uc15.4>)[UC-15.4], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob41], [#link(<uc15.5>)[UC-15.5], #link(<uc20.1>)[UC-20.1]],
  [RF-Ob42], [#link(<uc15.6>)[UC-15.6], #link(<uc20.2>)[UC-20.2]],
  [RF-Ob43], [#link(<uc15.6.1>)[UC-15.6.1], #link(<uc20.2.1>)[UC-20.2.1]],
  [RF-Ob44], [#link(<uc18>)[UC-18]],
  [RF-Ob45], [#link(<uc19>)[UC-19]],
  [RF-Ob46], [#link(<uc19.1>)[UC-19.1]],
  [RF-Ob47], [#link(<uc20>)[UC-20]],
  [RF-Ob48], [#link(<uc21>)[UC-21]],
  [RF-Ob49], [#link(<uc21.1>)[UC-21.1]],
  [RF-Ob50], [#link(<uc22>)[UC-22]],
  [RF-Ob51], [#link(<uc22.1>)[UC-22.1]],
  [RF-Ob52], [#link(<uc22.3>)[UC-22.3]],
  [RF-Ob53], [#link(<uc22.3.1>)[UC-22.3.1]],
  [RF-Ob54], [#link(<uc22.3.2>)[UC-22.3.2]],
  [RF-Ob55], [#link(<uc22.2>)[UC-22.2]],
  [RF-Ob56], [#link(<uc22.2>)[UC-22.2]],
  [RF-Ob57], [#link(<uc23>)[UC-23]],
  [RF-Ob58], [#link(<uc25>)[UC-25]],
  [RF-Ob59], [#link(<uc26>)[UC-26]],
  [RF-Ob60], [#link(<uc27>)[UC-27]],
  [RF-Ob61], [#link(<uc27.1.1>)[UC-27.1.1]],
  [RF-Ob62], [#link(<uc27.1.1.1>)[UC-27.1.1.1]],
  [RF-Ob63], [#link(<uc29>)[UC-29]],
  [RF-Ob64], [#link(<uc29.1>)[UC-29.1]],
  [RF-Ob65], [#link(<uc30>)[UC-30]],
  [RF-Ob66], [#link(<uc24>)[UC-24]],
  [RF-Ob67], [#link(<uc27.1>)[UC-27.1]],
  [RF-Ob68], [#link(<uc25>)[UC-25]],
  [RF-Ob69], [#link(<uc30.1>)[UC-30.1]],
  [RF-Ob70], [#link(<uc30.1.1>)[UC-30.1.1]],
  [RF-Ob71], [#link(<uc30.1.2>)[UC-30.1.2]],
  [RF-Ob72], [#link(<uc30.1.3>)[UC-30.1.3]],
  [RF-Ob73], [#link(<uc30.2>)[UC-30.2]],
  [RF-Ob74], [#link(<uc38>)[UC-38]],
  [RF-Ob75], [#link(<uc38.1>)[UC-38.1]],
  [RF-Ob76], [#link(<uc38.2>)[UC-38.2]],
  [RF-Ob77], [#link(<uc28>)[UC-28]],

  [RF-D01], [#link(<uc6>)[UC-6]],
  [RF-D02], [#link(<uc9>)[UC-9]],
  [RF-D03], [#link(<uc11>)[UC-11]],
  [RF-D04], [#link(<uc13>)[UC-13]],
  [RF-D05], [#link(<uc17>)[UC-17]],
  [RF-D06], [#link(<uc18>)[UC-18]],
  [RF-D07], [#link(<uc22.4>)[UC-22.4]],
  [RF-D08], [#link(<uc25>)[UC-25]],
  [RF-D09], [#link(<uc22.5>)[UC-22.5]],
  [RF-D10], [#link(<uc22.6>)[UC-22.6]],
  [RF-D11], [#link(<uc23>)[UC-23]],
  [RF-D12], [#link(<uc23.1>)[UC-23.1]],
  [RF-D13], [#link(<uc8>)[UC-8]],
  [RF-D14], [#link(<uc8.1>)[UC-8.1]],
  [RF-D15], [#link(<uc8.2>)[UC-8.2]],
  [RF-D16], [#link(<uc8.3>)[UC-8.3]],
  [RF-D17], [#link(<uc16>)[UC-16]],
  [RF-D18], [#link(<uc16.1>)[UC-16.1]],
  [RF-D19], [#link(<uc16.2>)[UC-16.2]],
  [RF-D20], [#link(<uc16.3>)[UC-16.3]],
  [RF-D21], [#link(<uc16.4>)[UC-16.4]],
  [RF-D22], [#link(<uc42>)[UC-42]],
  [RF-D23], [#link(<uc42.1>)[UC-42.1]],
  [RF-D24], [#link(<uc42.1.1>)[UC-42.1.1]],
  [RF-D25], [#link(<uc42.1.2>)[UC-42.1.2]],

  [RF-Op01], [#link(<uc25>)[UC-25]],
  [RF-Op02], [#link(<uc40>)[UC-40]],
  [RF-Op03], [#link(<uc41>)[UC-41]],
  [RF-Op04], [#link(<uc40.1>)[UC-40.1]],
  [RF-Op05], [#link(<uc32>)[UC-32]],
  [RF-Op06], [#link(<uc32.1>)[UC-32.1]],
  [RF-Op07], [#link(<uc32.2>)[UC-32.2]],
  [RF-Op08], [#link(<uc33>)[UC-33]],
  [RF-Op09], [#link(<uc35>)[UC-35]],
  [RF-Op10], [#link(<uc36>)[UC-36]],
  [RF-Op11], [#link(<uc36>)[UC-36]],
  [RF-Op12], [#link(<uc39>)[UC-39]],
  [RF-Op13], [#link(<uc43>)[UC-43]],
  [RF-Op14], [#link(<uc32.1.1>)[UC-32.1.1]],
  [RF-Op15], [#link(<uc32.3>)[UC-32.3]],
  [RF-Op16], [#link(<uc37>)[UC-37]],
  [RF-Op17], [#link(<uc34>)[UC-34]],
  [RF-Op18], [#link(<uc31>)[UC-31]],
  [RF-Op19], [#link(<uc28.1>)[UC-28.1]],
  [RF-Op20], [#link(<uc28.2>)[UC-28.2]],
  [RF-Op21], [#link(<uc28.3>)[UC-28.3]],
)

#pagebreak()

=== Riepilogo Statistico dei Requisiti

La seguente tabella riassume quantitativamente i requisiti individuati all'interno del presente documento, suddividendoli per tipologia e grado di priorità assegnato.

#align(center)[
  #table(
    columns: (2fr, 1.5fr, 1.5fr, 1.5fr, 1.5fr),
    align: (left, center, center, center, center),
    stroke: 0.5pt + luma(150),
    fill: (x, y) => if y == 0 { luma(230) } else if y == 4 { luma(245) } else { none },
    table.header(
      [*Tipologia*], [*Obbligatori*], [*Desiderabili*], [*Opzionali*], [*Totali*],
    ),

    [Funzionali (RF)], [77], [25], [21], [123],
    [Qualità (RQ)], [7], [0], [0], [7],
    [Vincolo (RV)], [6], [0], [0], [6],

    [*Totali*], [*90*], [*25*], [*21*], [*136*],
  )
]

=== Conclusioni

Il quadro dei requisiti delineato nel presente documento costituisce la sintesi formale e analitica delle necessità operative espresse nel capitolato d'appalto, progressivamente maturate e convalidate attraverso le sessioni di confronto bilaterale condotte con i rappresentanti dell'azienda proponente.

In piena coerenza con l'approccio incrementale e iterativo adottato dal gruppo Coderius, questa specifica non deve essere intesa come un vincolo statico e definitivo, bensì come una linea guida dinamica e in continua evoluzione. Durante le successive fasi del ciclo di vita del software, l'elenco e la granularità dei requisiti saranno soggetti a costanti attività di raffinamento, tracciamento e potenziale espansione. Tale processo di revisione continua consentirà di recepire tempestivamente i feedback della proponente, garantendo la massima aderenza alle aspettative e innalzando gli standard di stabilità e qualità ingegneristica dell'applicazione finale.
