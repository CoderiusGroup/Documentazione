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
  #text(size: 20pt)[*Versione 0.4.0*]
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

    [0.4.0], [2026/05/22], [Leonardo Lorenzin], [], [Integrazione casi d'uso: da UC-36 a UC-43 ],
    [0.3.0], [2026/05/20], [Leonardo Lorenzin], [], [Aggiornamento sezioni e correzione refusi],
    [0.2.2], [2026/05/15], [Ines Iadadi], [Leonardo Lorenzin], [Integrazione casi d'uso: da UC-28 a UC-35],
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

- *Utente*: è l'unico attore primario del sistema. Rappresenta l'utente finale dell'applicazione, ovvero il tecnico, il consulente o il professionista del settore della _cybersecurity_ incaricato di verificare la conformità di un dispositivo radio o IoT. L'Utente interagisce con il sistema per svolgere tutte le operazioni necessarie all'analisi, tra cui:
  - importare, creare e gestire i dati del dispositivo e i relativi asset;
  - navigare all'interno dei _decision tree_ fornendo le risposte in modo interattivo;
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


== UC-1 : Inserimento nuovo dispositivo <uc1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-1 : Inserimento nuovo dispositivo],
)

- *Attore primario:* Utente

- *Precondizioni:* Il sistema è attivo.

- *Postcondizioni:* Il nuovo dispositivo è stato inserito.

- *Scenario principale:*
  + L'utente inserisce il nuovo dispositivo.
  + Il sistema acquisisce le informazioni relative al dispositivo.

- *Scenari alternativi:*
  - *1a.* L'utente annulla l'inserimento. (UC-6)

- *Specializzazioni:*
  - UC-2: Importazione del dispositivo
  - UC-4: Creazione del dispositivo

- *Estensioni:*
  - UC-6: Annullamento inserimento del dispositivo


== UC-2: Importazione del dispositivo <uc2>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-1.png", width: 80%),
  caption: [UC-2 : Importazione del documento del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente dispone di un file di configurazione del dispositivo in un formato supportato (CSV o JSON).

- *Postcondizioni:* Il sistema ha acquisito le informazioni relative al dispositivo.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di importazione del dispositivo.
  + L'utente seleziona il file di configurazione del dispositivo.
  + Il sistema verifica che il file sia in un formato supportato e rispetti la struttura attesa.
  + Il sistema acquisisce le informazioni sul dispositivo (asset, interfacce, configurazioni di rete).
  + Il sistema conferma l'avvenuta importazione.

- *Scenari alternativi:*
  - *3a.* Il file di configurazione non rispetta il formato atteso  (UC-3)

- *Estensioni:*
  - UC-3: Formato file non valido


== UC-3: Formato file non valido <uc3>
#v(1em)
- *Attore primario*: Utente

- *Precondizioni*:
  + Il sistema è attivo
  + L'utente ha tentato di importare un file nel sistema.

- *Postcondizioni*:
  + L'operazione di caricamento del file è stata annullata.
  + Il sistema ha mostrato un messaggio di errore.

- *Scenario principale*:
  + Il sistema rileva un file con un errore strutturale o di contenuto.
  + Il sistema interrompe il processo di caricamento.
  + Il sistema mostra un messaggio di errore.


== UC-4 : Creazione del dispositivo <uc4>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-4.png", width: 100%),
  caption: [UC-4 : Creazione del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema è attivo.

- *Postcondizioni:* Il sistema ha registrato il dispositivo con le informazioni fornite e almeno un asset associato.

- *Scenario principale:*
  + L'utente sceglie l'opzione di creazione di un nuovo dispositivo.
  + L'utente compila i campi richiesti per il dispositivo (UC-4.1).
  + L'utente aggiunge almeno un asset al dispositivo (UC-12).
  + Il sistema registra il dispositivo.

- *Inclusioni:*
  - UC-4.1: Inserimento dati del dispositivo
  - UC-12: Inserimento asset

=== UC-4.1: Inserimento dati del dispositivo <uc4.1>
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 30%),
  caption: [UC-4.1 : Inserimento dati del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo.

- *Postcondizioni:* Il sistema ha aggiunto le informazioni relative al dispositivo.

- *Scenario principale:*
  + L'utente inserisce il nome del dispositivo. (UC-4.1.1)
  + L'utente inserisce il sistema operativo del dispositivo. (UC-4.1.2)
  + L'utente inserisce la descrizione del dispositivo. (UC-4.1.3)

- *Scenari alternativi:*
  - *1a.* L'utente inserisce dati non validi in uno o più campi. (UC-5)

- *Inclusioni:*
  - UC-4.1.1: Inserimento nome dispositivo
  - UC-4.1.2: Inserimento sistema operativo del dispositivo
  - UC-4.1.3: Inserimento descrizione del dispositivo

- *Estensioni:*
  - UC-5: Inserimento dati non validi

=== UC-4.1.1: Inserimento nome dispositivo <uc4.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo.

- *Postcondizioni:* Il sistema ha registrato il nome del dispositivo.

- *Scenario principale:*
  + L'utente inserisce un nome per il nuovo dispositivo.


=== UC-4.1.2: Inserimento sistema operativo del dispositivo <uc4.1.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo.

- *Postcondizioni:* Il sistema ha registrato il sistema operativo del dispositivo.

- *Scenario principale:*
  + L'utente inserisce un sistema operativo per il nuovo dispositivo.


=== UC-4.1.3: Inserimento descrizione del dispositivo  <uc4.1.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo.

- *Postcondizioni:* Il sistema ha registrato la descrizione del dispositivo.

- *Scenario principale:*
  + L'utente inserisce una descrizione per il nuovo dispositivo.


== UC-5: Inserimento dati non validi <uc5>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha compilato uno o più campi di un form con valori non validi o assenti.

- *Postcondizioni:* Il sistema ha segnalato l'errore all'utente e l'operazione non è stata completata.

- *Scenario principale:*
  + L'utente tenta di confermare l'inserimento con uno o più campi non validi o vuoti.
  + Il sistema rileva i dati non conformi.
  + Il sistema mostra un messaggio di errore che indica i campi non validi.
  + Il sistema non procede con l'operazione fino alla correzione dei dati.

== UC-6: Annullamento inserimento dispositivo <uc6>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta eseguendo l'inserimento di un dispositivo.

- *Postcondizioni:* Il sistema ha annullato l'inserimento del dispositivo e il sistema torna allo stato iniziale.

- *Scenario principale:*
  + L'utente seleziona il pulsante di annullamento dell'inserimento del dispositivo.
  + Il sistema scarta i dati del dispositivo.



== UC-7: Visualizza dati dispositivo <uc7>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-16.png", width: 80%),
  caption: [UC-7 : Visualizza dati dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha importato oppure creato il dispositivo.

- *Postcondizioni:* L'utente ha visualizzato i dati del dispositivo.

- *Scenario principale:*
  + Il sistema ha registrato i dati del dispositivo inserito.
  + L'utente visualizza il nome del dispositivo. (UC-7.1)
  + L'utente visualizza il sistema operativo del dispositivo. (UC-7.2)
  + L'utente visualizza la descrizione del dispositivo. (UC-7.3)
  + Il sistema mostra lo stato aggregato di valutazione del dispositivo (UC-7.4).

- *Inclusioni:*
  - UC-7.1: Visualizza nome dispositivo
  - UC-7.2: Visualizza sistema operativo dispositivo
  - UC-7.3: Visualizza descrizione dispositivo
  - UC-7.4: Visualizza stato aggregato dispositivo

=== UC-7.1: Visualizza nome dispositivo <uc7.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.

- *Postcondizioni:* L'utente ha visualizzato il nome del dispositivo.

- *Scenario principale:*
  + L'utente visualizza il nome del dispositivo.

=== UC-7.2: Visualizza sistema operativo dispositivo <uc7.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.

- *Postcondizioni:* L'utente ha visualizzato il sistema operativo del dispositivo.

- *Scenario principale:*
  + L'utente visualizza il sistema operativo del dispositivo.

=== UC-7.3: Visualizza descrizione dispositivo <uc7.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.

- *Postcondizioni:* L'utente ha visualizzato la descrizione del dispositivo.

- *Scenario principale:*
  + L'utente visualizza la descrizione del dispositivo.

=== UC-7.4: Visualizza stato aggregato dispositivo <uc7.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando i dati del dispositivo.

- *Postcondizioni:* L'utente ha visualizzato lo stato aggregato di valutazione
  del dispositivo.

- *Scenario principale:*
  + Il sistema mostra lo stato aggregato del dispositivo, che può essere:
    non valutato (nessun test completato), PASS (tutti gli asset hanno esito PASS),
    FAIL (almeno un asset ha esito FAIL).

== UC-8: Modifica dati del dispositivo <uc8>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-8 : Modifica dati del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha importato oppure creato il dispositivo.

- *Postcondizioni:* Il sistema ha aggiornato i dati del dispositivo secondo le modifiche apportate.

- *Scenario principale:*
  + L'utente seleziona il tasto di modifica dei dati del dispositivo.
  + L'utente modifica il nome del dispositivo. (UC-8.1)
  + L'utente modifica il sistema operativo del dispositivo. (UC-8.2)
  + L'utente modifica la descrizione del dispositivo. (UC-8.3)
  + Il sistema registra le modifiche.

- *Scenari alternativi:*
  - *1a.* L'utente annulla la modifica. (UC-9)
  - *2a.* L'utente inserisce dati non validi in uno o più campi. (UC-5)

- *Inclusioni:*
  - UC-8.1: Modifica nome del dispositivo
  - UC-8.2: Modifica sistema operativo del dispositivo
  - UC-8.3: Modifica descrizione del dispositivo

- *Estensioni:*
  - UC-5: Inserimento dati non validi
  - UC-9: Annullamento modifica dati del dispositivo

=== UC-8.1: Modifica nome del dispositivo <uc8.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica dei dati del dispositivo.

- *Postcondizioni:* Il sistema ha aggiornato il nome del dispositivo.

- *Scenario principale:*
  + Il sistema mostra il nome del dispositivo in un campo modificabile.
  + L'utente modifica il nome del dispositivo.
  + Il sistema registra il nuovo valore.

=== UC-8.2: Modifica sistema operativo del dispositivo <uc8.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica dei dati del dispositivo.

- *Postcondizioni:* Il sistema ha aggiornato il sistema operativo del dispositivo.

- *Scenario principale:*
  + Il sistema mostra il sistema operativo del dispositivo in un campo modificabile.
  + L'utente modifica il sistema operativo del dispositivo.
  + Il sistema registra il nuovo valore.

=== UC-8.3: Modifica descrizione del dispositivo <uc8.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica dei dati del dispositivo.

- *Postcondizioni:* Il sistema ha aggiornato la descrizione del dispositivo.

- *Scenario principale:*
  + Il sistema mostra la descrizione del dispositivo in un campo modificabile.
  + L'utente modifica la descrizione del dispositivo.
  + Il sistema registra il nuovo valore.


== UC-9: Annullamento modifica dati del dispositivo <uc9>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica dei dati del dispositivo.

- *Postcondizioni:* Il sistema ha annullato le modifiche ai dati del dispositivo e i dati sono tornati al loro stato precedente.

- *Scenario principale:*
  + L'utente seleziona la funzione di annullamento della modifica dei dati del dispositivo.
  + Il sistema scarta le modifiche
  + Il sistema ripristina i dati del dispositivo al loro stato precedente.

== UC-10: Esportazione dati del dispositivo <uc10>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha importato oppure inserito un dispositivo.

- *Postcondizioni:* Il sistema ha generato e reso disponibile per il download un file (JSON o CSV) contenente i dati del dispositivo e degli asset associati.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di esportazione dei dati del dispositivo.
  + Il sistema raccoglie i dati del dispositivo e degli asset associati.
  + Il sistema genera il file nel formato richiesto.
  + Il sistema mette a disposizione il file per il download.


== UC-11: Eliminazione del dispositivo <uc11>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-7.png", width: 50%),
  caption: [UC-11 : Eliminazione del dispositivo],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha importato oppure inserito un dispositivo.

- *Postcondizioni:* Il sistema ha rimosso il dispositivo, tutti gli asset
  ad esso associati e i relativi risultati di valutazione.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di eliminazione del dispositivo.
  + Il sistema chiede conferma dell'operazione.
  + L'utente conferma.
  + Il sistema rimuove il dispositivo.

- *Scenari alternativi:*
  - *3a.* L'utente annulla l'eliminazione: il sistema non apporta modifiche.

- *Specializzazioni:*
  - UC-11.1: Eliminazione dispositivo senza backup
  - UC-11.2: Eliminazione dispositivo con backup

=== UC-11.1: Eliminazione dispositivo senza backup <uc11.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di eliminazione del dispositivo.

- *Postcondizioni:* Il sistema ha rimosso il dispositivo, tutti gli asset
  associati e i relativi risultati di valutazione, senza produrre alcun
  file di backup.

- *Scenario principale:*
  + L'utente seleziona l'opzione di eliminazione diretta senza backup.
  + Il sistema mostra un avviso che i dati andranno persi definitivamente.
  + L'utente conferma l'eliminazione.
  + Il sistema rimuove il dispositivo, tutti gli asset associati e i
    relativi risultati di valutazione.

=== UC-11.2: Eliminazione dispositivo con backup <uc11.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di eliminazione del dispositivo.

- *Postcondizioni:* Il sistema ha esportato i dati del dispositivo e degli
  asset associati tramite UC-10, e successivamente ha rimosso il dispositivo,
  gli asset e i relativi risultati di valutazione.

- *Scenario principale:*
  + L'utente seleziona l'opzione di eliminazione con backup.
  + Il sistema avvia l'esportazione dei dati del dispositivo (UC-10).
  + Il sistema rimuove il dispositivo, tutti gli asset associati e i
    relativi risultati di valutazione.

- *Inclusioni:*
  - UC-10: Esportazione dati del dispositivo


#pagebreak()



== UC-12: Inserimento asset <uc12>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-12.png", width: 80%),
  caption: [UC-12 : Inserisci asset],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente si trova nella schermata di gestione del dispositivo.

- *Postcondizioni:* Il sistema ha aggiunto un nuovo asset alla lista degli assets del dispositivo.

- *Scenario principale:*
  + L'utente seleziona l'opzione di inserimento asset.
  + L'utente compila i campi obbligatori per l'asset. (UC-12.1)
  + Il sistema aggiunge l'asset al dispositivo.

- *Scenari alternativi:*
  - *1a.* L'utente annulla l'inserimento dell'asset. (UC-13)
  - *2a.* L'utente inserisce dati non validi in uno o più campi. (UC-5)

- *Inclusioni:*
  - UC-12.1: Inserimento dati dell'asset

- *Estensioni:*
  - UC-13: Annullamento inserimento asset

=== UC-12.1: Inserimento dati dell'asset <uc12.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-12.1 : Inserimento dati dell'asset],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset.

- *Postcondizioni:* Il sistema ha registrato i dati del nuovo asset.

- *Scenario principale:*
  + L'utente inserisce il nome dell'asset. (UC-12.1.1)
  + L'utente seleziona il tipo dell'asset. (UC-12.1.2)
  + L'utente inserisce una descrizione per l'asset. (UC-12.1.3)
  + L'utente seleziona la sensibilità dell'asset. (UC-12.1.4)

- *Scenari alternativi:*
  - *1a.* L'utente inserisce dati non validi in uno o più campi. (UC-5)

- *Inclusioni:*
  - UC-12.1.1: Inserimento nome asset
  - UC-12.1.2: Selezione tipo asset
  - UC-12.1.3: Inserimento descrizione asset
  - UC-12.1.4: Selezione sensibilità asset

- *Estensioni:*
  - UC-5: Inserimento dati non validi

==== UC-12.1.1: Inserimento nome asset <uc12.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset.

- *Postcondizioni:* Il sistema ha registrato il nome dell'asset.

- *Scenario principale:*
  + L'utente inserisce il nome dell'asset.

==== UC-12.1.2: Selezione tipo asset <uc12.1.2>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-12.2.png", width: 70%),
  caption: [UC-12.1.2 : Selezione tipo asset],
)

- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset.

- *Postcondizioni:* Il sistema ha registrato il tipo dell'asset.

- *Scenario principale:*
  + L'utente seleziona il tipo dell'asset tra le opzioni disponibili
    (Network, Security, Privacy, Financial).

==== UC-12.1.3: Inserimento descrizione asset <uc12.1.3>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-12.3.png", width: 70%),
  caption: [UC-12.1.3 : Inserisci descrizione asset],
)

- *Attore primario:* Utente

- *Precondizioni:* L'utente ha scelto l'opzione di inserimento asset.

- *Postcondizioni:* Il sistema ha registrato la descrizione dell'asset.

- *Scenario principale:*
  + L'utente inserisce una descrizione per l'asset.

==== UC-12.1.4: Selezione sensibilità asset <uc12.1.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset.

- *Postcondizioni:* Il sistema ha registrato la sensibilità dell'asset.

- *Scenario principale:*
  + L'utente seleziona se l'asset è sensibile tra le opzioni
    disponibili (SI o NO).

== UC-13: Annullamento inserimento asset <uc13>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-13.png", width: 65%),
  caption: [UC-13 : Annullamento inserimento asset],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset.

- *Postcondizioni:* Il sistema ha annullato l'inserimento dell'asset e ha ripristinato lo stato precedente.

- *Scenario principale:*
  + L'utente preme il tasto di annullamento di inserimento dell'asset.


== UC-14: Visualizzazione lista asset <uc14>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-17.png", width: 80%),
  caption: [UC-14 : Visualizzazione lista asset],
)

- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente ha inserito un dispositivo.
  - Il dispositivo possiede almeno un asset.

- *Postcondizioni:* L'utente ha visualizzato la lista degli asset del dispositivo.

- *Scenario principale:*
  + Il sistema mostra la lista degli asset del dispositivo.
  + Per ogni asset nella lista l'utente visualizza le informazioni del singolo asset (UC-14.1).

- *Inclusioni:*
  - UC-14.1: Visualizzazione singolo asset nella lista

=== UC-14.1: Visualizzazione singolo asset nella lista <uc14.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-17.1.png", width: 80%),
  caption: [UC-14.1 : Visualizzazione singolo asset nella lista],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato di visualizzare la lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato le informazioni essenziali di un singolo asset.

- *Scenario principale:*
  + Il sistema mostra il nome dell'asset (UC-14.1.1).
  + Il sistema mostra il tipo di asset (UC-14.1.2).
  + Il sistema mostra lo stato di valutazione dell'asset (UC-14.1.3).

- *Inclusioni:*
  - UC-14.1.1: Visualizzazione nome asset nella lista
  - UC-14.1.2: Visualizzazione tipo asset nella lista
  - UC-14.1.3: Visualizzazione stato valutazione asset nella lista

==== UC-14.1.1: Visualizzazione nome asset nella lista <uc14.1.1>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato il nome dell'asset.

- *Scenario principale:*
  + L'utente visualizza il nome dell'asset.

==== UC-14.1.2: Visualizzazione tipo asset nella lista <uc14.1.2>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato il tipo dell'asset.

- *Scenario principale:*
  + L'utente visualizza il tipo dell'asset.

==== UC-14.1.3: Visualizzazione stato valutazione asset nella lista <uc14.1.3>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato lo stato di valutazione dell'asset.

- *Scenario principale:*
  + L'utente visualizza lo stato di valutazione dell'asset, che può essere:
    non valutato, in corso, completato.

== UC-15: Visualizzazione in dettaglio asset <uc15>
#v(1em)

- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente sta visualizzando la lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato le informazioni in dettaglio di un singolo asset.

- *Scenario principale:*
  + L'utente seleziona un asset dalla lista.
  + Il sistema mostra tutte le informazioni dell'asset.

- *Inclusioni:*
  - UC-15.1: Visualizzazione nome asset in dettaglio
  - UC-15.2: Visualizzazione tipo asset in dettaglio
  - UC-15.3: Visualizzazione descrizione asset in dettaglio
  - UC-15.4: Visualizzazione sensibilità asset
  - UC-15.5: Visualizzazione stato valutazione asset
  - UC-15.6: Visualizzazione lista requisiti asset

=== UC-15.1: Visualizzazione nome asset <uc15.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato il nome dell'asset.

- *Scenario principale:*
  + L'utente visualizza il nome dell'asset.

=== UC-15.2: Visualizzazione tipo asset <uc15.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato il tipo dell'asset.

- *Scenario principale:*
  + L'utente visualizza il tipo dell'asset.

=== UC-15.3: Visualizzazione descrizione asset  <uc15.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato la descrizione dell'asset.

- *Scenario principale:*
  + L'utente visualizza la descrizione dell'asset.

=== UC-15.4: Visualizzazione sensibilità asset <uc15.4>
#v(1em)
- *Attore primario:* Utente
- *Precondizioni:* L'utente ha selezionato un asset dalla lista.
- *Postcondizioni:* L'utente ha visualizzato la sensibilità dell'asset.
- *Scenario principale:*
  + L'utente visualizza il livello di sensibilità dell'asset.


=== UC-15.5: Visualizzazione stato valutazione asset <uc15.5>
#v(1em)
- *Attore primario:* Utente
- *Precondizioni:* L'utente ha selezionato un asset dalla lista.
- *Postcondizioni:* L'utente ha visualizzato lo stato complessivo di valutazione
  dell'asset.
- *Scenario principale:*
  + L'utente visualizza lo stato di valutazione dell'asset (non valutato,
    in corso, completato).


=== UC-15.6: Visualizzazione lista requisiti asset <uc15.6>
#v(1em)
- *Attore primario:* Utente
- *Precondizioni:* L'utente ha selezionato un asset dalla lista.
- *Postcondizioni:* L'utente ha visualizzato la lista dei requisiti da valutare
  per l'asset.
- *Scenario principale:*
  + Il sistema mostra la lista dei requisiti (ACM e AUM) associati all'asset.
  + Per ogni requisito il sistema mostra il codice e lo stato di valutazione.
    (UC-15.6.1)

- *Inclusioni:*
  - UC-15.6.1: Visualizzazione singolo requisito nella lista

==== UC-15.6.1: Visualizzazione singolo requisito nella lista <uc15.6.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista dei requisiti dell'asset.

- *Postcondizioni:* L'utente ha visualizzato il codice e lo stato di valutazione del requisito.

- *Scenario principale:*
  + L'utente visualizza il codice del requisito.
  + L'utente visualizza lo stato di valutazione del requisito (non valutato, in corso,
    PASS, FAIL, NOT APPLICABLE).



== UC-16: Modifica asset <uc16>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-15.png", width: 80%),
  caption: [UC-16 : Modifica asset],
)

- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente ha inserito un dispositivo.
  - Il dispositivo ha almeno un asset.

- *Postcondizioni:* Il sistema ha aggiornato le informazioni dell'asset secondo le modifiche effettuate.

- *Scenario principale:*
  + L'utente seleziona uno degli asset dalla lista.
  + L'utente seleziona la funzione di modifica dell'asset.
  + L'utente modifica il nome dell'asset. (UC-16.1)
  + L'utente modifica il tipo di asset. (UC-16.2)
  + L'utente modifica la descrizione dell'asset. (UC-16.3)
  + L'utente modifica la sensibilità dell'asset. (UC-16.4)

- *Scenari alternativi:*
  - *3a.* L'utente inserisce dati non validi in uno o più campi. (UC-5)
  - *2a.* L'utente annulla la modifica dell'asset. (UC-17)

- *Inclusioni:*
  - UC-16.1: Modifica nome asset
  - UC-16.2: Modifica tipo asset
  - UC-16.3: Modifica descrizione asset
  - UC-16.4: Modifica sensibilità asset

- *Estensioni:*
  - UC-5: Inserimento dati non validi
  - UC-17: Annullamento modifica asset

=== UC-16.1: Modifica nome asset <uc16.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.

- *Postcondizioni:* Il sistema ha aggiornato il nome dell'asset.

- *Scenario principale:*
  + Il sistema mostra il nome dell'asset in un campo modificabile.
  + L'utente modifica il nome dell'asset.
  + Il sistema registra il nuovo valore

=== UC-16.2: Modifica tipo asset <uc16.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.

- *Postcondizioni:* Il sistema ha aggiornato il tipo dell'asset.

- *Scenario principale:*
  + Il sistema mostra il tipo corrente dell'asset in un campo modificabile.
  + L'utente seleziona il tipo dell'asset tra le opzioni disponibili.
  + Il sistema registra il nuovo valore

=== UC-16.3: Modifica descrizione asset  <uc16.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.

- *Postcondizioni:* Il sistema ha aggiornato la descrizione dell'asset.

- *Scenario principale:*
  + Il sistema mostra la descrizione dell'asset in un campo modificabile.
  + L'utente modifica la descrizione dell'asset.
  + Il sistema registra il nuovo valore

=== UC-16.4: Modifica sensibilità asset <uc16.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.

- *Postcondizioni:* Il sistema ha aggiornato la sensibilità dell'asset.

- *Scenario principale:*
  + Il sistema mostra la sensibilità corrente dell'asset.
  + L'utente seleziona una delle opzioni disponibili per la sensibilità dell'asset.
  + Il sistema registra il nuovo valore.


== UC-17: Annullamento modifica asset <uc17>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.

- *Postcondizioni:* Il sistema ha annullato le modifiche all'asset e i dati sono tornati al loro stato precedente.

- *Scenario principale:*
  + L'utente seleziona la funzione di annullamento della modifica dell'asset.
  + Il sistema scarta le modifiche
  + Il sistema ripristina i dati dell'asset.


== UC-18: Eliminazione asset <uc18>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-14.png", width: 65%),
  caption: [UC-18 : Elimina asset],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente ha inserito un dispositivo.
  - Il dispositivo ha almeno un asset.

- *Postcondizioni:* Il sistema ha eliminato l'asset selezionato.

- *Scenario principale:*
  + L'utente seleziona un asset dalla lista.
  + L'utente seleziona la funzione di eliminazione dell'asset.
  + Il sistema mostra un messaggio di conferma.
  + L'utente conferma l'eliminazione dell'asset.
  + Il sistema elimina l'asset selezionato e aggiorna la lista degli asset.

- *Scenari alternativi:*
  - *4a.* L'utente annulla l'eliminazione


#pagebreak()


== UC-19: Avvio sessione di valutazione <uc19>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-19 : Avvio sessione di valutazione],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente ha inserito un dispositivo.
  - Il dispositivo ha almeno un asset.

- *Postcondizioni:* La sessione di valutazione è attiva e la dashboard è
  visualizzata.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di avvio della valutazione del dispositivo.
  + Il sistema inizializza la sessione di valutazione.
  + Il sistema mostra la dashboard con la lista degli asset e il loro stato
    di valutazione corrente. (UC-19.1)
  + L'utente valuta gli asset del dispositivo. (UC-20)
  + Quando tutti gli asset sono stati valutati, il sistema rende disponibili i risultati complessivi del test. (UC-28)

- *Inclusioni:*
  - UC-19.1: Visualizzazione dashboard di valutazione


=== UC-19.1: Visualizzazione dashboard di valutazione <uc19.1>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-19.1 : Visualizzazione dashboard di valutazione],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema ha inizializzato la sessione di valutazione.

- *Postcondizioni:* L'utente ha visualizzato lo stato complessivo della
  valutazione.

- *Scenario principale:*
  + Il sistema mostra la lista degli asset del dispositivo.
  + Per ogni asset il sistema mostra il nome, il tipo e lo stato di valutazione
    corrente (non valutato, in corso, completato).
  + Il sistema mostra il numero di asset completati rispetto al totale.


== UC-20: Valutazione di un asset <uc20>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-20 : Valutazione di un asset],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva.
  - L'utente ha selezionato un asset dalla dashboard.

- *Postcondizioni:* I requisiti dell'asset sono stati valutati, totalmente o
  parzialmente, e i relativi esiti registrati.

- *Scenario principale:*
  + Il sistema mostra le informazioni dell'asset selezionato.
  + Il sistema mostra lo stato di avanzamento del test. (UC-27)
  + Il sistema mostra la lista dei requisiti da valutare con il relativo stato.
  + L'utente seleziona un requisito da valutare.
  + Il sistema mostra il dettaglio del requisito selezionato. (UC-21)
  + I passi 4-5 si ripetono fino alla valutazione di tutti i requisiti
    dell'asset.

- *Scenari alternativi:*
  - *4a.* L'utente interrompe la sessione. (UC-24)

- *Inclusioni:*
  - UC-21: Visualizzazione dettaglio requisito
  - UC-27: Visualizzazione stato avanzamento

- *Estensioni:*
  - UC-24: Uscita anticipata dal test

== UC-21: Visualizzazione dettaglio requisito <uc21>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-21 : Visualizzazione dettaglio requisito],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva.
  - L'utente ha selezionato un requisito dalla lista. (UC-20)

- *Postcondizioni:* L'utente ha visualizzato le informazioni del
  requisito e può avviare l'esecuzione del decision tree.

- *Scenario principale:*
  + Il sistema mostra il codice e il nome del requisito.
  + Il sistema mostra le dipendenze del requisito e il loro stato
    di valutazione. (UC-21.1)
  + L'utente avvia l'esecuzione del decision tree. (UC-22)

- *Inclusioni:*
  - UC-21.1: Visualizzazione dipendenze del requisito

- *Estensioni:*
  - UC-22: Esecuzione decision tree per un requisito


=== UC-21.1: Visualizzazione dipendenze del requisito <uc21.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un
  requisito. (UC-21)

- *Postcondizioni:* L'utente ha visualizzato la lista delle dipendenze
  del requisito corrente e il relativo stato di valutazione.

- *Scenario principale:*
  + Il sistema mostra la lista dei requisiti da cui dipende il
    requisito corrente.
  + Per ogni dipendenza il sistema mostra il codice del requisito
    e il suo stato di valutazione (non valutato, PASS, FAIL,
    NOT APPLICABLE).


== UC-22: Esecuzione decision tree per un requisito <uc22>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-22 : Esecuzione decision tree per un requisito],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva.
  - L'utente ha avviato l'esecuzione del decision tree per il requisito
    selezionato. (UC-21)

- *Postcondizioni:* Il sistema ha registrato l'esito del decision tree per la
  coppia asset-requisito corrente (PASS, FAIL o NOT APPLICABLE).

- *Scenario principale:*
  + Il sistema mostra la domanda del nodo corrente. (UC-22.1)
  + Il sistema mostra il grafo del decision tree con il nodo corrente
    evidenziato. (UC-22.4)
  + L'utente risponde alla domanda del nodo corrente. (UC-22.2)
  + Il sistema avanza al nodo successivo in base alla risposta fornita.
  + I passi 1-4 si ripetono fino al raggiungimento di un nodo foglia.
  + Il sistema registra l'esito: PASS, FAIL o NOT APPLICABLE.

- *Scenari alternativi:*
  - *3a.* L'utente desidera annullare l'ultima risposta e tornare al nodo precedente. (UC-22.3)
  - *3b.* L'utente desidera salvare la sessione e continuare. (UC-25.2)
  - *5a.* Il sistema raggiunge un nodo foglia: mostra l'esito. (UC-23)

- *Inclusioni:*
  - UC-22.1: Visualizzazione nodo corrente del decision tree
  - UC-22.2: Risposta alla domanda del nodo corrente
  - UC-22.4: Visualizzazione grafo decision tree durante esecuzione

- *Estensioni:*
  - UC-22.3: Navigazione al nodo precedente
  - UC-23: Visualizzazione nodo foglia del decision tree
  - UC-25.2: Salvataggio e continuazione sessione


=== UC-22.1: Visualizzazione nodo corrente del decision tree <uc22.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema sta eseguendo il decision tree per un requisito.

- *Postcondizioni:* L'utente ha visualizzato le informazioni del nodo corrente.

- *Scenario principale:*
  + Il sistema mostra il codice univoco del nodo corrente.
  + Il sistema mostra il testo della domanda associata al nodo corrente.


=== UC-22.2: Risposta alla domanda del nodo corrente <uc22.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente del
  decision tree.

- *Postcondizioni:* Il sistema ha registrato la risposta e avanzato al nodo
  successivo.

- *Scenario principale:*
  + L'utente seleziona la risposta.
  + Il sistema registra la risposta e avanza al nodo successivo.

- *Specializzazioni:*
  - UC-22.2.1: Risposta affermativa al nodo corrente
  - UC-22.2.2: Risposta negativa al nodo corrente


==== UC-22.2.1: Risposta affermativa al nodo corrente <uc22.2.1>
#v(1em)
- *Attore primario:* Utente
- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente.
- *Postcondizioni:* Il sistema ha registrato "Sì" e avanzato nel ramo
  affermativo.
- *Scenario principale:*
  + L'utente seleziona "Sì" come risposta.
  + Il sistema registra la risposta e avanza al nodo successivo del ramo
    affermativo.


==== UC-22.2.2: Risposta negativa al nodo corrente <uc22.2.2>
#v(1em)
- *Attore primario:* Utente
- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente.
- *Postcondizioni:* Il sistema ha registrato "No" e avanzato nel ramo
  negativo.
- *Scenario principale:*
  + L'utente seleziona "No" come risposta.
  + Il sistema registra la risposta e avanza al nodo successivo del ramo
    negativo.


=== UC-22.3: Navigazione al nodo precedente <uc22.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:*
  - La sessione di valutazione è attiva.
  - Il nodo corrente non è il nodo radice del decision tree.

- *Postcondizioni:* Il sistema ha riportato l'utente al nodo precedente,
  mostrando la risposta già fornita.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di navigazione al nodo precedente.
  + Il sistema torna al nodo precedente mostrando la risposta già fornita.
  + L'utente conferma la stessa risposta.
  + Il sistema riprende l'esecuzione dal nodo successivo senza invalidare
    le risposte già fornite.

- *Scenari alternativi:*
  - *1a.* L'utente si trova al nodo radice.
  - *3a.* L'utente modifica la risposta invece di confermarla. (UC-22.2)

=== UC-22.4: Visualizzazione grafo decision tree durante esecuzione <uc22.4>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema sta eseguendo il decision tree per un requisito.

- *Postcondizioni:* L'utente ha visualizzato il grafo del decision tree con lo
  stato corrente dell'esecuzione evidenziato.

- *Scenario principale:*
  + Il sistema mostra il grafo completo del decision tree associato al
    requisito in esame.
  + Il sistema evidenzia il nodo corrente nel grafo.
  + Il sistema evidenzia il percorso già seguito dall'utente fino al nodo
    corrente.

== UC-23: Visualizzazione nodo foglia del decision tree <uc23>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-23 : Visualizzazione nodo foglia del decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema ha raggiunto un nodo foglia del decision tree.

- *Postcondizioni:* L'utente ha visualizzato l'esito del requisito per l'asset corrente.

- *Scenario principale:*
  + Il sistema mostra l'esito del requisito per l'asset corrente
    (PASS, FAIL o NOT APPLICABLE).
  + Il sistema mostra la giustificazione dell'esito in base al percorso seguito.

== UC-24: Uscita anticipata dal test <uc24>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-24 : Uscita anticipata dal test],
)

- *Attore primario:* Utente

- *Precondizioni:* Il test è in corso.

- *Postcondizioni:* La sessione di valutazione è terminata.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di uscita dal test.
  + Il sistema chiede all'utente se desidera salvare la sessione corrente.
  + L'utente sceglie di salvare (UC-25).
  + Il sistema termina la sessione.

- *Scenari alternativi:*
  - *3a.* L'utente sceglie di non salvare: il sistema termina la sessione scartando
    tutti i dati della valutazione in corso.

- *Estensioni:*
  - UC-25: Salvataggio sessione di valutazione

== UC-25: Salvataggio sessione di valutazione <uc25>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-25 : Salvataggio sessione di valutazione],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - Il test è in corso.
  - L'utente ha risposto ad almeno una domanda.

- *Postcondizioni:* Il sistema ha prodotto un file JSON o CSV contenente lo stato corrente
  della sessione.

- *Scenario principale:*
  + Il sistema raccoglie i dati della sessione corrente:
    - dati del dispositivo e degli asset;
    - esiti già registrati per le coppie asset-requisito completate;
    - asset corrente, requisito corrente e nodo corrente;
    - risposte già fornite nel decision tree corrente.
  + Il sistema genera il file in formato JSON o CSV.
  + Il sistema mette a disposizione il file per il download.

- *Specializzazioni:*
  - UC-25.1: Salvataggio e chiusura sessione
  - UC-25.2: Salvataggio e continuazione sessione

=== UC-25.1: Salvataggio e chiusura sessione <uc25.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* Il test è in corso e l'utente ha scelto di salvare all'uscita (UC-24).

- *Postcondizioni:* Il file JSON o CSV è disponibile per il download e la sessione è terminata.

- *Scenario principale:*
  + L'utente conferma il salvataggio.
  + Il sistema genera il file JSON o CSV con lo stato della sessione.
  + Il sistema mette a disposizione il file per il download.
  + Il sistema termina la sessione di valutazione.

=== UC-25.2: Salvataggio e continuazione sessione <uc25.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* Il test è in corso.

- *Postcondizioni:* Il file JSON o CSV è disponibile per il download.
  La sessione rimane attiva dal punto in cui si trovava.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di salvataggio intermedio.
  + Il sistema genera il file JSON o CSV con lo stato corrente della sessione.
  + Il sistema mette a disposizione il file per il download.
  + Il sistema mantiene attiva la sessione senza modificarne lo stato.


== UC-26: Ripresa sessione di valutazione <uc26>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-26 : Ripresa sessione di valutazione],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente dispone di un file di sessione di valutazione precedentemente salvato.

- *Postcondizioni:* Il sistema carica la sessione e il test riprende dal punto di interruzione.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di caricamento sessione.
  + L'utente seleziona il file della sessione salvata.
  + Il sistema valida il formato e la struttura del file.
  + Il sistema ripristina i dati della sessione:
    - dati del dispositivo e degli asset;
    - esiti già registrati per le coppie asset-requisito completate;
    - asset corrente, requisito corrente e nodo corrente;
    - risposte già fornite nel decision tree corrente.
  + Il sistema riprende l'esecuzione dal punto in cui era stata interrotta.
    (UC-22)

- *Scenari alternativi:*
  - *3a.* Il file non rispetta il formato atteso. (UC-3)

- *Estensioni:*
  - UC-3: Formato file non valido

== UC-27: Visualizzazione stato avanzamento del test <uc27>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-27 : Visualizzazione stato avanzamento del test],
)
- *Attore primario:* Utente

- *Precondizioni:* La sessione di valutazione è attiva e l'utente sta valutando un asset. (UC-20)

- *Postcondizioni:* L'utente ha visualizzato lo stato corrente del test.

- *Scenario principale:*
  + Il sistema mostra l'asset e il requisito correnti in esame.
  + Il sistema mostra il numero di asset completati rispetto al totale.
  + Il sistema mostra il numero di requisiti completati per l'asset corrente.

#pagebreak()

== UC-28: Visualizzazione risultati test <uc28>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-28 : Visualizzazione risultati test],
)
- *Attore primario:* Utente

- *Precondizioni:* Il test è stato completato oppure l'utente ha caricato
  una sessione completata.

- *Postcondizioni:* L'utente ha visualizzato il riepilogo complessivo degli
  esiti del test per ogni coppia asset-requisito.

- *Scenario principale:*
  + Il sistema mostra il riepilogo degli esiti del test organizzato per asset.
    (UC-28.1)
  + Il sistema mostra il numero di requisiti con esito PASS, FAIL e
    NOT APPLICABLE per ogni asset.

- *Inclusioni:*
  - UC-28.1: Visualizzazione riepilogo risultati per asset

- *Estensioni:*
  - UC-29: Esportazione report di conformità


=== UC-28.1: Visualizzazione riepilogo risultati per asset <uc28.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando i risultati del test.

- *Postcondizioni:* L'utente ha visualizzato il riepilogo degli esiti per
  un singolo asset.

- *Scenario principale:*
  + Il sistema mostra il nome e il tipo dell'asset.
  + Il sistema mostra l'esito aggregato dell'asset (PASS se tutti i requisiti
    sono PASS o NOT APPLICABLE, FAIL se almeno uno è FAIL).
  + Il sistema mostra la lista dei requisiti valutati per l'asset. (UC-28.1.1)

- *Inclusioni:*
  - UC-28.1.1: Visualizzazione singolo requisito con esito


==== UC-28.1.1: Visualizzazione singolo requisito con esito <uc28.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il riepilogo risultati di un asset.

- *Postcondizioni:* L'utente ha visualizzato il codice del requisito, il suo
  esito e il percorso logico seguito.

- *Scenario principale:*
  + L'utente visualizza il codice del requisito.
  + L'utente visualizza l'esito del requisito per l'asset corrente
    (PASS, FAIL o NOT APPLICABLE).
  + L'utente visualizza il percorso logico seguito nel decision tree. (UC-28.1.1.1)

- *Inclusioni:*
  - UC-28.1.1.1: Visualizzazione percorso logico del requisito

- *Estensioni:*
  - UC-28.1.1.2: Riesecuzione di un requisito già completato

===== UC-28.1.1.1: Visualizzazione percorso logico del requisito <uc28.1.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un singolo
  requisito con esito.

- *Postcondizioni:* L'utente ha visualizzato la sequenza ordinata delle risposte
  fornite durante la valutazione del requisito.

- *Scenario principale:*
  + Il sistema mostra la sequenza delle domande affrontate durante l'esecuzione
    del decision tree per il requisito selezionato.
  + Per ogni domanda il sistema mostra il testo del nodo e la risposta fornita
    (Sì o No).
  + Il sistema evidenzia il nodo foglia raggiunto e l'esito corrispondente.


===== UC-28.1.1.2: Riesecuzione di un requisito già completato <uc28.1.1.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente sta visualizzando il dettaglio di un singolo requisito con esito.
  - Il requisito ha già ricevuto un esito (PASS, FAIL o NOT APPLICABLE).

- *Postcondizioni:* Il sistema ha rieseguito il decision tree per la coppia
  asset-requisito selezionata e ha aggiornato l'esito.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di riesecuzione del requisito.
  + Il sistema azzera l'esito precedente per la coppia asset-requisito.
  + Il sistema avvia l'esecuzione del decision tree per il requisito
    selezionato dall'inizio. (UC-22)
  + Il sistema aggiorna l'esito nella dashboard dei risultati.

- *Scenari alternativi:*
  - *3a.* L'utente esce anticipatamente dalla riesecuzione: il sistema
    ripristina l'esito precedente. (UC-24)


== UC-29: Esportazione report di conformità <uc29>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-29 : Esportazione report di conformità],
)
- *Attore primario:* Utente

- *Precondizioni:*
  - Il test è stato completato.
  - L'utente sta visualizzando i risultati del test (UC-28).

- *Postcondizioni:* Il sistema ha generato e messo a disposizione il report
  di conformità per il download.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di esportazione del report.
  + Il sistema raccoglie per ogni coppia asset-requisito:
    - l'esito del singolo requisito (PASS, FAIL, NOT APPLICABLE);
    - l'esito aggregato del decision tree;
    - la traccia del percorso logico seguito (sequenza ordinata delle risposte
      fornite durante la valutazione).
  + Il sistema genera il report nel formato selezionato.
  + Il sistema mette a disposizione il file per il download.

- *Specializzazioni:*
  - UC-29.1: Esportazione in PDF
  - UC-29.2: Esportazione in JSON
  - UC-29.3: Esportazione in CSV

=== UC-29.1: Esportazione in PDF <uc29.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'esportazione del report.

- *Postcondizioni:* Il sistema ha generato il report in formato PDF.

- *Scenario principale:*
  + L'utente seleziona il formato PDF.
  + Il sistema genera il file PDF contenente il riepilogo di conformità del
    dispositivo rispetto allo standard EN 18031.
  + Il sistema mette a disposizione il file per il download.

=== UC-29.2: Esportazione in JSON <uc29.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'esportazione del report.

- *Postcondizioni:* Il sistema ha generato il report in formato JSON.

- *Scenario principale:*
  + L'utente seleziona il formato JSON.
  + Il sistema genera il file JSON contenente tutti i dati della valutazione.
  + Il sistema mette a disposizione il file per il download.

=== UC-29.3: Esportazione in CSV <uc29.3>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato l'esportazione del report.

- *Postcondizioni:* Il sistema ha generato il report in formato CSV.

- *Scenario principale:*
  + L'utente seleziona il formato CSV.
  + Il sistema genera il file CSV contenente gli esiti per ogni coppia
    asset-requisito in formato tabellare.
  + Il sistema mette a disposizione il file per il download.

#pagebreak()

== UC-30: Visualizzazione elenco decision tree <uc30>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-30 : Visualizzazione elenco decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* Il sistema è attivo e i decision tree sono disponibili
  sul backend.

- *Postcondizioni:* L'utente ha visualizzato l'elenco dei decision tree
  disponibili.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di visualizzazione dei decision tree.
  + Il sistema recupera i decision tree dal backend.
  + Il sistema mostra l'elenco ordinato dei decision tree disponibili. (UC-30.1)

- *Inclusioni:*
  - UC-30.1: Visualizzazione singolo decision tree nell'elenco

- *Estensioni:*
  - UC-42: Importazione decision tree


=== UC-30.1: Visualizzazione singolo decision tree nell'elenco <uc30.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'elenco dei decision tree.

- *Postcondizioni:* L'utente ha visualizzato le informazioni essenziali
  del singolo decision tree.

- *Scenario principale:*
  + Il sistema mostra l'id del requisito associato al decision tree.
  + Il sistema mostra il nome del requisito associato al decision tree.
  + Il sistema mostra le dipendenze del decision tree. (UC-30.1.1)

- *Inclusioni:*
  - UC-30.1.1: Visualizzazione dipendenze del decision tree

- *Estensioni:*
  - UC-31: Modifica decision tree
  - UC-38: Esportazione decision tree
  - UC-43: Eliminazione decision tree

=== UC-30.1.1: Visualizzazione dipendenze del decision tree <uc30.1.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un
  decision tree. (UC-30.1)

- *Postcondizioni:* L'utente ha visualizzato le dipendenze del
  decision tree corrente.

- *Scenario principale:*
  + Il sistema mostra la lista dei requisiti da cui dipende il
    decision tree corrente (anche nulla).
  + Per ogni dipendenza il sistema mostra il codice del requisito.


== UC-31: Modifica decision tree <uc31>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-31 : Modifica decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'elenco dei decision tree.
  (UC-30)

- *Postcondizioni:* Il decision tree è aggiornato con le modifiche apportate
  e salvato sul backend.

- *Scenario principale:*
  + L'utente seleziona un decision tree dall'elenco.
  + Il sistema mostra il grafo del decision tree selezionato.
  + L'utente seleziona un nodo o un collegamento su cui intervenire.
  + L'utente effettua la modifica desiderata.
  + Il sistema valida la struttura risultante e salva le modifiche sul backend.

- *Scenari alternativi:*
  - *5a.* La struttura risultante non supera la validazione: il sistema
    notifica l'errore e rimane nella schermata di modifica. (UC-36)
  - *4a.* L'utente annulla la modifica. (UC-37)

- *Estensioni:*
  - UC-36: Validazione fallita modifica decision tree
  - UC-37: Annullamento modifica decision tree
  - UC-38: Esportazione decision tree

- *Specializzazioni:*
  - UC-32: Aggiunta nodo al decision tree
  - UC-33: Eliminazione nodo dal decision tree
  - UC-34: Modifica destinazione collegamento del decision tree
  - UC-40: Aggiunta dipendenza
  - UC-41: Rimozione dipendenza


== UC-32: Aggiunta nodo al decision tree <uc32>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-32 : Aggiunta nodo al decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. (UC-31)

- *Postcondizioni:* Un nuovo nodo è stato aggiunto al decision tree
  e le modifiche sono salvate sul backend.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di aggiunta di un nuovo nodo
    in una specifica posizione del decision tree.
  + Il sistema crea un nuovo nodo vuoto.
  + L'utente inserisce il codice univoco del nodo. (UC-32.1)
  + L'utente inserisce il testo della domanda del nodo. (UC-32.2)
  + Il sistema aggiunge il nodo al decision tree e aggiorna la visualizzazione.

- *Scenari alternativi:*
  - *5a.* La struttura risultante non supera la validazione. (UC-36)

- *Inclusioni:*
  - UC-32.1: Inserimento codice univoco del nodo
  - UC-32.2: Inserimento testo domanda del nodo

- *Estensioni:*
  - UC-36: Validazione fallita modifica decision tree


=== UC-32.1: Inserimento codice univoco del nodo <uc32.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta aggiungendo un nuovo nodo al decision tree.

- *Postcondizioni:* Il sistema ha registrato il codice univoco del nuovo nodo.

- *Scenario principale:*
  + L'utente inserisce il codice univoco del nuovo nodo nel rispettivo campo.
  + Il sistema memorizza il valore inserito.

- *Scenari alternativi:*
  - *2a.* Il codice inserito è già presente nel decision tree: il sistema
    notifica l'errore e richiede un codice diverso.

=== UC-32.2: Inserimento testo domanda del nodo <uc32.2>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta aggiungendo un nuovo nodo al decision tree.

- *Postcondizioni:* Il sistema ha registrato il testo della domanda del
  nuovo nodo.

- *Scenario principale:*
  + L'utente inserisce il testo della domanda del nuovo nodo nel rispettivo
    campo.
  + Il sistema memorizza il valore inserito.


== UC-33: Eliminazione nodo dal decision tree <uc33>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-33 : Eliminazione nodo dal decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. (UC-31)

- *Postcondizioni:* Il nodo selezionato è rimosso dal decision tree
  e i collegamenti sono aggiornati.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di eliminazione di un nodo.
  + L'utente seleziona il nodo da eliminare.
  + Il sistema mostra un messaggio di conferma.
  + L'utente conferma l'eliminazione.
  + Il sistema rimuove il nodo e aggiorna i collegamenti.

- *Scenari alternativi:*
  - *2a.* L'utente seleziona il nodo radice. (UC-39)
  - *4a.* L'utente annulla l'eliminazione: il sistema non apporta modifiche.

- *Estensioni:*
  - UC-39: Tentativo eliminazione nodo radice


== UC-34: Modifica destinazione collegamento del decision tree <uc34>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-34 : Modifica destinazione collegamento del decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. (UC-31)

- *Postcondizioni:* Il collegamento selezionato è stato aggiornato
  con la nuova destinazione e le modifiche sono salvate sul backend.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di modifica di un collegamento.
  + L'utente seleziona il collegamento da modificare.
  + L'utente seleziona il nuovo nodo di destinazione.
  + Il sistema aggiorna il grafo.

- *Scenari alternativi:*
  - *3a.* Il collegamento che l'utente sta tentando di creare è già presente:
    il sistema notifica l'errore. (UC-35)
  - *4a.* La struttura risultante non supera la validazione. (UC-36)

- *Estensioni:*
  - UC-35: Tentativo di creazione collegamento duplicato
  - UC-36: Validazione fallita modifica decision tree


== UC-35: Tentativo di creazione collegamento duplicato <uc35>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando la destinazione di un collegamento
  del decision tree. (UC-34)

- *Postcondizioni:* Il sistema ha notificato l'errore all'utente e il
  collegamento duplicato non è stato creato.

- *Scenario principale:*
  + Il sistema rileva che il collegamento che l'utente sta tentando di creare
    è già presente nel decision tree (stessa sorgente, stessa etichetta
    Sì/No e stessa destinazione).
  + Il sistema mostra un messaggio di errore.
  + Il sistema mantiene aperta la schermata di modifica per consentire
    all'utente di selezionare una destinazione diversa.


== UC-36: Validazione fallita modifica decision tree <uc36>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha apportato una modifica che ha generato una
  struttura non valida nel decision tree.

- *Postcondizioni:* Il sistema ha notificato l'errore di validazione all'utente.
  Le modifiche non sono state salvate sul backend.

- *Scenario principale:*
  + Il sistema verifica che la struttura rispetti i seguenti vincoli:
    - l'albero è binario (ogni nodo interno ha esattamente due rami: Sì e No);
    - è presente almeno un nodo foglia con esito PASS;
    - è presente almeno un nodo foglia con esito FAIL.
  + Il sistema rileva una violazione di uno o più vincoli.
  + Il sistema mostra un messaggio di errore che descrive il vincolo violato.
  + Il sistema mantiene aperta la schermata di modifica per consentire
    all'utente di correggere l'errore.


== UC-37: Annullamento modifica decision tree <uc37>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta modificando un decision tree. (UC-31)

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
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-38 : Esportazione decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un decision tree. (UC-30.1)

- *Postcondizioni:* Il file del decision tree è stato esportato nel formato
  previsto e reso disponibile per il download come copia locale opzionale.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di esportazione del decision tree.
  + Il sistema serializza il decision tree nel formato previsto (JSON o CSV).
  + Il sistema mette a disposizione il file per il download.


== UC-39: Tentativo eliminazione nodo radice <uc39>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato la funzionalità di eliminazione
  di un nodo e ha selezionato il nodo radice del decision tree.

- *Postcondizioni:* Il sistema ha notificato l'errore e l'eliminazione non
  è stata eseguita.

- *Scenario principale:*
  + Il sistema rileva che il nodo selezionato è il nodo radice del decision
    tree.
  + Il sistema mostra un messaggio di errore che comunica all'utente che il
    nodo radice non può essere eliminato.


== UC-40: Aggiunta dipendenza <uc40>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-40 : Aggiunta dipendenza],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando il dettaglio di un
  decision tree. (UC-30.1)

- *Postcondizioni:* Il requisito selezionato è stato aggiunto alle
  dipendenze del decision tree corrente e la modifica è salvata
  sul backend.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di aggiunta di una dipendenza.
  + Il sistema mostra la lista dei requisiti disponibili che possono
    essere aggiunti come dipendenza.
  + L'utente seleziona il requisito da aggiungere come dipendenza.
  + Il sistema aggiunge il requisito alle dipendenze del decision tree
    e salva la modifica sul backend.

- *Scenari alternativi:*
  - *3a.* L'aggiunta crea una dipendenza circolare. (UC-40.1)

- *Estensioni:*
  - UC-40.1: Errore dipendenza circolare


=== UC-40.1: Errore dipendenza circolare <uc40.1>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha selezionato un requisito da aggiungere
  come dipendenza che crea una dipendenza circolare.

- *Postcondizioni:* Il sistema ha bloccato l'aggiunta e notificato
  l'errore all'utente. La lista delle dipendenze rimane invariata.

- *Scenario principale:*
  + Il sistema rileva che il requisito selezionato crea una dipendenza
    circolare.
  + Il sistema blocca l'aggiunta.
  + Il sistema mostra un messaggio di errore.


== UC-41: Rimozione dipendenza <uc41>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-41 : Rimozione dipendenza],
)
#text(style: "italic")[Requisito opzionale]
#v(0.5em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando la lista delle dipendenze
  del decision tree. (UC-30.1.1)

- *Postcondizioni:* Il requisito selezionato è stato rimosso dalle
  dipendenze del decision tree corrente e la modifica è salvata
  sul backend.

- *Scenario principale:*
  + L'utente seleziona il requisito da rimuovere dalle dipendenze.
  + Il sistema rimuove il requisito dalla lista delle dipendenze.
  + Il sistema salva la modifica sul backend.

- *Scenari alternativi:*
  - *1a.* L'utente annulla l'operazione: il sistema non apporta modifiche.

== UC-42: Importazione decision tree <uc42>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-42 : Importazione decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'elenco dei decision tree.
  (UC-30)

- *Postcondizioni:* Il sistema ha caricato il decision tree contenuto nel
  file importato e lo ha reso disponibile sul backend per le sessioni di
  valutazione successive.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di importazione di un nuovo
    decision tree.
  + L'utente seleziona il file da importare (JSON o CSV).
  + Il sistema valida il formato e la struttura del file, verificando che
    rispetti i vincoli dell'albero binario e la presenza di almeno un nodo
    PASS e un nodo FAIL.
  + Il sistema carica il decision tree e lo salva sul backend.
  + Il sistema aggiorna l'elenco dei decision tree disponibili.

- *Scenari alternativi:*
  - *3a.* Il file non rispetta il formato atteso o i vincoli strutturali. (UC-3)
  - *1a.* L'utente annulla l'importazione.

- *Estensioni:*
  - UC-3: Formato file non valido


== UC-43: Eliminazione decision tree <uc43>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-43 : Eliminazione decision tree],
)
- *Attore primario:* Utente

- *Precondizioni:* L'utente sta visualizzando l'elenco dei decision tree. (UC-30)

- *Postcondizioni:* Il decision tree selezionato è stato rimosso dal sistema
  e la modifica è salvata sul backend.

- *Scenario principale:*
  + L'utente seleziona un decision tree dall'elenco.
  + L'utente seleziona la funzionalità di eliminazione del decision tree.
  + Il sistema mostra un messaggio di conferma.
  + L'utente conferma l'eliminazione.
  + Il sistema rimuove il decision tree dal backend e aggiorna l'elenco.

- *Scenari alternativi:*
  - *4a.* L'utente annulla l'eliminazione.


