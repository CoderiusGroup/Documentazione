#set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Analisi dei Requisiti],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )

#set text(font: "Libertinus Serif",size: 12pt,lang: "it")

#set heading(numbering: "1.1.")
#show figure: set figure(supplement: none)

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Analisi dei Requisiti \ di Progetto 2025/2026]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
  #v(3em)
  #text(size: 20pt)[*Versione 0.1.5*]
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
    [0.2.0], [2026/05/05], [Ines Iadadi], [],[Aggiornamento struttura del documento fino al UC-17],
    [0.1.6], [2026/04/30], [Ines Iadadi], [],[Integrazione casi d'uso: da UC-20 a UC-23],
    [0.1.5], [2026/04/28], [Edis Hodja], [],[Aggiornamento UML e struttura della documentazione.],
    [0.1.4], [2026/04/24], [Giovanni Bronte], [Filippo Zonta Rocha],[Integrazione casi d'uso: da UC-2 a UC-7 e UC-17 con le appropriate sottosezioni e diagrammi UML. Modificate le numerazioni di vari use case  assieme ai loro diagrammi UML],
    [0.1.3], [2026/04/21], [Giovanni Bronte], [Filippo Zonta Rocha],[Integrazione casi d'uso: UC9 a UC13],
    [0.1.2], [2026/04/13], [Edis Hodja], [Filippo Zonta Rocha],[Integrazione casi d'uso: UC1 a UC8],
    [0.1.1], [2026/04/10], [Edis Hodja], [Filippo Zonta Rocha],[Integrazione descrizione del prodotto],
    [0.1.0], [2026/04/07], [Edis Hodja], [Filippo Zonta Rocha],[Redazione preliminare del documento]
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
- al team di verifica, che utilizzerà le informazioni contenute per definire i criteri di validazione e accertare la conformità del prodotto ai requisiti stabiliti.\
In considerazione della natura incrementale del processo di sviluppo adottato, il documento sarà soggetto a revisioni periodiche, al fine di recepire eventuali aggiornamenti o modifiche dei requisiti.

== Glossario
Per garantire che ogni termine tecnico sia compreso correttamente e per evitare qualsiasi confusione, la documentazione è supportata da un glossario che raccoglie le definizioni dei vocaboli più specifici. Le parole incluse in questo elenco sono segnalate nel testo dalla lettera G posta a pedice (parola#sub[G]). Cliccando su questo simbolo, l'utente viene indirizzato alla sezione della pagina web del glossario dove può consultare la definizione del termine cercato.


== Riferimenti
Il presente documento è stato redatto facendo riferimento, ove applicabile, alle linee guida per la specifica dei requisiti software definite dallo standard IEEE 830:1998, adattandone struttura e contenuti alle esigenze del progetto.

Sono state inoltre considerate le indicazioni metodologiche fornite nell’ambito del corso di Ingegneria del Software, al fine di garantire coerenza nella definizione, organizzazione e tracciabilità dei requisiti.

#heading(level: 3, numbering: none)[Riferimenti Normativi]
#v(2pt)
- #text(blue)[#underline(link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1p.pdf")[C1: Automated EN18031 Compliance Verification - Bluewind S.r.l.])]
#v(2pt)
- #text(blue)[#underline(link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[Regolamento del Progetto Didattico a.a. 2025-2026])]
#v(2pt)

#heading(level: 3, numbering: none)[Riferimenti Informativi]
#v(2pt)
- #text(blue)[#underline([Glossario di Progetto])] //da aggiungere quando si inizierà la stesura
#v(2pt)
- Dispense del corso di Ingegneria del Software 2025/2026:#v(1pt)
  - #text(blue)[#underline(link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T05.pdf")[Analisi dei Requisiti])] #v(3pt)
  - #text(blue)[#underline(link("https://www.math.unipd.it/~rcardin/swea/2022/Diagrammi%20Use%20Case.pdf")[Diagrammi degli Use Case (UML)])] #v(3pt)
  - #text(blue)[#underline(link("https://kurzy.kpi.fei.tuke.sk/zsi/resources/CockburnBookDraft.pdf")[A. Cockburn, Writing Effective Use Cases])] #v(3pt)
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
- *Vincoli tecnologici e di piattaforma*: il sistema deve essere sviluppato sotto forma di applicazione web interattiva, accessibile e pienamente funzionante tramite i principali browser moderni (Google Chrome, Mozilla Firefox, Apple Safari, Microsoft Edge). L'architettura del sistema dovrà essere di tipo _data-driven_, in cui la logica decisionale e i flussi di navigazione sono definiti dinamicamente sulla base di dati forniti in input (es. file JSON, CSV, o XML).
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
  caption: [UC-1 : Inserimento nuovo dispositivo]
)

- *Attore primario:* Utente \

- *Precondizioni:* Il sistema è attivo. \

- *Postcondizioni:* Il nuovo dispositivo è stato inserito. \

- *Scenario principale:*
  + L'utente inserisce il nuovo dispositivo.
  + Il sistema acquisisce le informazioni relative al dispositivo.

- *Specializzazioni:*
  - UC-2: Importazione del dispositivo
  - UC-4: Creazione del dispositivo

- *Estensioni:*
  - UC-6: Annullamento inserimento del dispositivo


== UC-2: Importazione del dispositivo <uc2>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-1.png", width: 80%),
  caption: [UC-2 : Importazione del documento del dispositivo]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente dispone di un file di configurazione del dispositivo in un formato supportato (CSV, XML o JSON). \

- *Postcondizioni:* Il sistema ha acquisito le informazioni relative al dispositivo. \

- *Scenario principale:*
  + L'utente seleziona la funzionalità di importazione del dispositivo.
  + L'utente seleziona il file di configurazione del dispositivo.
  + Il sistema acquisisce le informazioni sul dispositivo (asset, interfacce, configurazioni di rete).
  + Il sistema conferma l'avvenuta importazione.

- *Scenari alternativi:*
  - Il file di configurazione non rispetta il formato atteso

- *Estensioni:*
  - UC-3: Formato file non valido


== UC-3: Formato file non valido <uc3>
#v(1em)
- *Attore primario*: Utente \

- *Precondizioni*: 
  + Il sistema è attivo
  + L'utente sta inserendo un nuovo dispositivo tramite importazione di un file di configurazione

- *Postcondizioni*: 
  + L'inserimento del file di configurazione del dispositivo è stato annullato.
  + Il sistema mostra un messaggio di errore.

- *Scenario principale*: 
  + L'utente inserisce un file con un errore strutturale o di contenuto.
  + Il sistema mostra un messaggio di errore.


== UC-4 : Creazione del dispositivo <uc4>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-4.png", width: 100%),
  caption: [UC-4 : Creazione del dispositivo]
)
- *Attore primario:* Utente \

- *Precondizioni:* Il sistema è attivo. \

- *Postcondizioni:* Il sistema ha aggiunto il dispositivo con le informazioni registrate. \

- *Scenario principale:*
  + L'utente sceglie l'opzione di creazione di un nuovo dispositivo.
  + L'utente compila i campi richiesti per l'inserimento del dispositivo.
  + VIENE ASSOCIATO MODELLO STANDARD O UTENTE DEVE AGGIUNGERE ALMENO UN ASSET????
  + Il sistema acquisisce le informazioni relative al dispositivo.

*Inclusioni:*
  - UC-4.1: Inserimento dati del dispositivo

=== UC-4.1: Inserimento dati del dispositivo <uc4.1>
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 30%),
  caption: [UC-4.1 : Inserimento dati del dispositivo]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di creazione di un nuovo dispositivo. \

- *Postcondizioni:* Il sistema ha aggiunto le informazioni relative al dispositivo. \

- *Scenario principale:*
  + L'utente inserisce le informazioni relative al dispositivo, quali nome, sistema operativo e descrizione.

- *Scenari alternativi:*
  - L'utente inserisce dati non validi in uno o più campi.

- *Inclusioni:*
  - UC-4.1.1: Inserimento nome dispositivo
  - UC-4.1.2: Inserimento sistema operativo del dispositivo
  - UC-4.1.3: Inserimento descrizione del dispositivo

- *Estensioni:*
  - UC-4.2: Inserimento dati non validi

=== UC-4.1.1: Inserimento nome dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di aggiunta nuovo dispositivo manualmente. \

- *Postcondizioni:* Il sistema ha aggiunto il nome del dispositivo. \

- *Scenario principale:*
  + L'utente inserisce un nome per il nuovo dispositivo.

*Scenari alternativi:*
  - L'utente annulla l'aggiunta di un nome per il dispositivo.

=== UC-4.1.2: Inserimento sistema operativo del dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di aggiunta nuovo dispositivo manualmente. \

- *Postcondizioni:* Il sistema ha aggiunto il sistema operativo del dispositivo. \

- *Scenario principale:*
  + L'utente inserisce un sistema operativo per il nuovo dispositivo.

*Scenari alternativi:*
  - L'utente annulla l'aggiunta di un sistema operativo per il dispositivo.

=== UC-4.1.3: Inserimento descrizione del dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di aggiunta nuovo dispositivo manualmente. \

- *Postcondizioni:* Il sistema ha aggiunto una descrizione del dispositivo. \

- *Scenario principale:*
  + L'utente inserisce una descrizione per il nuovo dispositivo.

*Scenari alternativi:*
  - L'utente annulla l'aggiunta di una descrizione per il dispositivo.


== UC-5: Inserimento dati non validi <uc5>
#v(1em)
- *Attore primario:* Utente

- *Precondizioni:* L'utente ha compilato uno o più campi di un form con valori non validi o assenti.

- *Postcondizioni:* Il sistema ha segnalato l'errore all'utente e l'operazione non è stata completata.

- *Scenario principale:*
  +  L'utente tenta di confermare l'inserimento con uno o più campi non validi o vuoti.
  +  Il sistema rileva i dati non conformi.
  +  Il sistema mostra un messaggio di errore che indica i campi non validi.
  +  Il sistema non procede con l'operazione fino alla correzione dei dati.

== UC-6: Annullamento inserimento dispositivo <uc6>
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento di un dispositivo.\

- *Postcondizioni:* Il sistema ha annullato l'inserimento del dispositivo e il sistema torna allo stato iniziale. \

- *Scenario principale:*
  + L'utente seleziona il pulsante di annullamento dell'inserimento del dispositivo.
  + Il sistema scarta i dati del dispositivo.



== UC-7: Visualizza dati dispositivo <uc7>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-16.png", width: 80%),
  caption: [UC-7 : Visualizza dati dispositivo]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha importato oppure creato il dispositivo.

- *Postcondizioni:* L'utente ha visualizzato i dati del dispositivo. \

- *Scenario principale:*
  + Il sistema ha registrato i dati del dispositivo inserito.
  + L'utente visualizza il nome del dispositivo.
  + L'utente visualizza il sistema operativo del dispositivo.
  + L'utente visualizza la descrizione del dispositivo.

- *Inclusioni:*
  - UC-7.1: Visualizza nome dispositivo
  - UC-7.2: Visualizza sistema operativo dispositivo
  - UC-7.3: Visualizza descrizione dispositivo

=== UC-7.1: Visualizza nome dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.\

- *Postcondizioni:* L'utente ha visualizzato il nome del dispositivo. \

- *Scenario principale:*
  + L'utente visualizza il nome del dispositivo.

=== UC-7.2: Visualizza sistema operativo dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.\

- *Postcondizioni:* L'utente ha visualizzato il sistema operativo del dispositivo.\

- *Scenario principale:*
+ L'utente visualizza il sistema operativo del dispositivo.

=== UC-7.3: Visualizza descrizione dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.\

- *Postcondizioni:* L'utente ha visualizzato la descrizione del dispositivo. \

- *Scenario principale:*
+ L'utente visualizza la descrizione del dispositivo.

== UC-8: Modifica dati del dispositivo <uc8>
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-8 : Modifica dati del dispositivo]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha importato oppure creato il dispositivo. \

- *Postcondizioni:* Il sistema ha aggiornato i dati del dispositivo secondo le modifiche apportate. \

- *Scenario principale:*
  + L'utente seleziona il tasto di modifica dei dati del dispositivo.
  + L'utente modifica i dati del dispositivo.

- Scenari alternativi:
  - L'utente inserisce dati non validi in uno o più campi.
  - L'utente annulla la modifica dei dati del dispositivo.

- Inclusioni:
  - UC-8.1: Modifica nome del dispositivo
  - UC-8.2: Modifica sistema operativo del dispositivo
  - UC-8.3: Modifica descrizione del dispositivo

- Estensioni:
  - UC-5: Inserimento dati non validi
  - UC-9: Annullamento modifica dati del dispositivo

=== UC-8.1: Modifica nome del dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica dei dati del dispositivo. \

- *Postcondizioni:* Il sistema ha aggiornato il nome del dispositivo. \

- *Scenario principale:*
  + Il sistema mostra il nome del dispositivo in un campo modificabile.
  + L'utente modifica il nome del dispositivo.
  + Il sistema registra il nuovo valore.

=== UC-8.2: Modifica sistema operativo del dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica dei dati del dispositivo. \

- *Postcondizioni:* Il sistema ha aggiornato il sistema operativo del dispositivo. \

- *Scenario principale:*
  + Il sistema mostra il sistema operativo del dispositivo in un campo modificabile.
  + L'utente modifica il sistema operativo del dispositivo.
  + Il sistema registra il nuovo valore.

=== UC-8.3: Modifica descrizione del dispositivo
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica dei dati del dispositivo. \

- *Postcondizioni:* Il sistema ha aggiornato la descrizione del dispositivo. \

- *Scenario principale:*
  + Il sistema mostra la descrizione del dispositivo in un campo modificabile.
  + L'utente modifica la descrizione del dispositivo.
  + Il sistema registra il nuovo valore.


== UC-9: Annullamento modifica dati del dispositivo <uc9>
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica dei dati del dispositivo. \

- *Postcondizioni:* Il sistema ha annullato le modifiche ai dati del dispositivo e i dati sono tornati al loro stato precedente. \

- *Scenario principale:*
  + L'utente seleziona la funzione di annullamento della modifica dei dati del dispositivo.
  + Il sistema scarta le modifiche
  + Il sistema ripristina i dati del dispositivo al loro stato precedente.

*DUBBIO RIGUARDANTE AL SALVATAGGIO DELLE MODIFICHE AD UN DISPOSITIVO - Da definire*
== UC: Esportazione dati del dispositivo
== UC-10: Eliminazione del dispositivo
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-7.png", width: 50%),
  caption: [UC-10 : Elimina dispositivo]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha inserito un dispositivo.\

- *Postcondizioni:* Il sistema ha rimosso i dati del dispositivo. \

- *Scenario principale:*
+ L'utente seleziona quale dispositivo eliminare.
+ Il sistema rimuove i dati del dispositivo. <uc10>
#pagebreak()



== UC-11: Inserimento asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-12.png", width: 80%),
  caption: [UC-11 : Inserisci asset]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha inserito un dispositivo. \

- *Postcondizioni:* Il sistema ha aggiunto un nuovo asset alla lista degli assets del dispositivo. \

- *Scenario principale:*
+ L'utente seleziona l'opzione di inserimento asset.
+ L'utente compila i campi obbligatori per l'asset.

- *Scenari alternativi:* 
+ L'utente annulla l'inserimento dell'asset. (UC-12)
+ L'utente inserisce un asset con il tipo sbagliato. (UC-20)


=== UC-11.1: Inserimento dati dell'asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-11.1 : Inserimento dati dell'asset]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset. \

- *Postcondizioni:* Il sistema ha registrato i dati del nuovo asset. \

- *Scenario principale:*
  + L'utente inserisce il nome dell'asset.
  + L'utente inserisce il tipo dell'asset.
  + L'utente inserisce una descrizione per l'asset.

- *Scenari alternativi:* 
  + L'utente inserisce dati non validi in uno o più campi. (UC-5)


==== UC-11.1.1: Inserimento nome asset
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset. \

- *Postcondizioni:* Il sistema ha registrato il nome dell'asset. \

- *Scenario principale:*
  + L'utente inserisce il nome dell'asset.

==== UC-11.1.2: Inserimento tipo asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-12.2.png", width: 70%),
  caption: [UC-11.1.2 : Inserimento tipo asset]
)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset. \

- *Postcondizioni:* Il sistema ha registrato il tipo dell'asset. \

- *Scenario principale:*
  + L'utente seleziona il tipo dell'asset tra le opzioni disponibili.

- *Specializzazioni:*
  - UC-11.1.2.1: Selezione network asset
  - UC-11.1.2.2: Selezione security asset
  - UC-11.1.2.3: Selezione privacy asset
  - UC-11.1.2.4: Selezione financial asset

===== UC-11.1.2.1: Selezione network asset
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente sta selezionando il tipo di asset. \

- *Postcondizioni:* Il sistema ha registrato il tipo di asset. \

- *Scenario principale:*
  + L'utente seleziona "Network" come tipo di asset.

===== UC-11.1.2.2: Selezione security asset
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente sta selezionando il tipo di asset. \

- *Postcondizioni:* Il sistema ha registrato il tipo di asset. \

- *Scenario principale:*
  + L'utente seleziona "Security" come tipo di asset.

===== UC-11.1.2.3: Selezione privacy asset
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente sta selezionando il tipo di asset. \

- *Postcondizioni:* Il sistema ha registrato il tipo di asset. \

- *Scenario principale:*
+ L'utente seleziona "Privacy" come tipo di asset.

===== UC-11.1.2.4: Selezione financial asset
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente sta selezionando il tipo di asset. \

- *Postcondizioni:* Il sistema ha registrato il tipo di asset. \

- *Scenario principale:*
+ L'utente seleziona "Financial" come tipo di asset.

==== UC-11.1.3: Inserisci descrizione asset
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di inserimento asset. \

- *Postcondizioni:* Il sistema ha registrato la descrizione dell'asset. \

- *Scenario principale:*
+ L'utente inserisce una descrizione per l'asset.

#figure(
  image("../../../images/diagrammiUML/UC-12.3.png", width: 70%),
  caption: [UC-11.1.3 : Inserisci descrizione asset]
)
*SENSIBILITÀ DELL'ASSET - Da definire*

== UC-12: Annullamento inserimento asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-13.png", width: 65%),
  caption: [UC-12 : Annulla inserimento asset]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato l'opzione di inserimento asset. 

- *Postcondizioni:* Il sistema ha annullato l'inserimento dell'asset e ha ripristinato lo stato precedente. \

- *Scenario principale:*
+ L'utente preme il tasto di annullamento di inserimento dell'asset.


== UC-13: Visualizzazione lista asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-17.png", width: 80%),
  caption: [UC-13 : Visualizzazione lista asset]
)

- *Attore primario:* Utente \

- *Precondizioni:* 
  - L'utente ha inserito un dispositivo.
  - Il dispositivo possiede almeno un asset.\

- *Postcondizioni:* L'utente ha visualizzato la lista degli asset del dispositivo. \

- *Scenario principale:*
  + Il sistema mostra la lista degli asset del dispositivo.
  + Per ogni asset nella lista l'utente visualizza le informazioni del singolo asset (UC-13.1).

- *Inclusioni:*
  - UC-13.1: Visualizzazione singolo asset nella lista

=== UC-13.1: Visualizzazione singolo asset nella lista
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-17.1.png", width: 80%),
  caption: [UC-13.1 : Visualizzazione singolo asset nella lista]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato di visualizzare la lista degli asset.\

- *Postcondizioni:* L'utente ha visualizzato le informazioni essenziali di un singolo asset. \

- *Scenario principale:*
  + Il sistema mostra il nome dell'asset.
  + Il sistema mostra il tipo di asset.


==== UC-13.1.1: Visualizzazione nome asset nella lista
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente sta visualizzando la lista degli asset.\

- *Postcondizioni:* L'utente ha visualizzato il nome dell'asset. \

- *Scenario principale:*
  + L'utente visualizza il nome dell'asset.

==== UC-13.1.2: Visualizzazione tipo asset nella lista
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* L'utente sta visualizzando la lista degli asset.\

- *Postcondizioni:* L'utente ha visualizzato il tipo dell'asset. \

- *Scenario principale:*
  + L'utente visualizza il tipo dell' asset.

== UC-14: Visualizzazione in dettaglio asset
#v(1em)

- *Attore primario:* Utente \

- *Precondizioni:* 
  - L'utente sta visualizzando la lista degli asset.

- *Postcondizioni:* L'utente ha visualizzato le informazioni in dettaglio di un singolo asset. \

- *Scenario principale:*
  + L'utente seleziona un asset dalla lista
  + Il sistema mostra tutte le informazioni dell'asset.

- *Inclusioni:*
  - UC-14.1: Visualizzazione nome asset in dettaglio
  - UC-14.2: Visualizzazione tipo asset in dettaglio
  - UC-14.3: Visualizzazione descrizione asset in dettaglio

=== UC-14.1: Visualizzazione nome asset
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset. \

- *Postcondizioni:* L'utente ha visualizzato il nome dell'asset. \

- *Scenario principale:*
  + L'utente visualizza il nome dell'asset.

=== UC-14.2: Visualizzazione tipo asset
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset. \

- *Postcondizioni:* L'utente ha visualizzato il tipo dell'asset. \

- *Scenario principale:*
  + L'utente visualizza il tipo dell'asset.

=== UC-14.3: Visualizzazione descrizione asset
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato un asset dalla lista degli asset. \

- *Postcondizioni:* L'utente ha visualizzato la descrizione dell'asset. \

- *Scenario principale:*
  + L'utente visualizza la descrizione dell'asset.



== UC-15: Modifica asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-15.png", width: 80%),
  caption: [UC-15 : Modifica asset]
)

- *Attore primario:* Utente \

- *Precondizioni:*
+ L'utente ha inserito un dispositivo.
+ Il dispositivo ha almeno un asset.

- *Postcondizioni:* Il sistema ha aggiornato le informazioni dell'asset secondo le modifiche effettuate. \

- *Scenario principale:*
  + L'utente seleziona uno degli asset dalla lista.
  + L'utente seleziona la funzione di modifica dell'asset.
  + L'utente modifica il nome dell'asset.
  + L'utente modifica il tipo di asset.
  + L'utente modifica la descrizione dell'asset.

- *Scenari alternativi:*
  - L'utente inserisce dati non validi in uno o più campi.
  - L'utente annulla la modifica dell'asset.

- *Inclusioni:*
  - UC-15.1: Modifica nome asset
  - UC-15.2: Modifica tipo asset
  - UC-15.3: Modifica descrizione asset

- *Estensioni:*
  - UC-5: Inserimento dati non validi
  - UC-16: Annullamento modifica asset

=== UC-15.1: Modifica nome asset
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.\

- *Postcondizioni:* Il sistema ha aggiornato il nome dell'asset. \

- *Scenario principale:*
+ L'utente mostra il nome dell'asset in un campo modificabile.
+ L'utente modifica il nome dell'asset.
#v(1em)
=== UC-15.2: Modifica tipo asset

- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.\

- *Postcondizioni:* Il sistema ha aggiornato il tipo dell'asset. \

- *Scenario principale:*
+ L'utente mostra il tipo dell'asset in un campo modificabile.
+ L'utente modifica il tipo dell'asset.

- *Scenari alternativi:*
- L'utente modifica il tipo di un asset in un tipo non valido.

=== UC-15.3: Modifica descrizione asset
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset.\

- *Postcondizioni:* Il sistema ha aggiornato la descrizione dell'asset. \

- *Scenario principale:*
+ L'utente mostra la descrizione dell'asset in un campo modificabile.
+ L'utente modifica la descrizione dell'asset.

- UC-16: Annullamento modifica asset
#v(1em)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente ha selezionato la funzione di modifica di un asset. \

- *Postcondizioni:* Il sistema ha annullato le modifiche all'asset e i dati sono tornati al loro stato precedente. \

- *Scenario principale:*
  + L'utente seleziona la funzione di annullamento della modifica dell'asset.
  + Il sistema scarta le modifiche
  + Il sistema ripristina i dati dell'asset.


== UC-17: Eliminazione asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/UC-14.png", width: 65%),
  caption: [UC-17 : Elimina asset]
)
- *Attore primario:* Utente \

- *Precondizioni:*
+ L'utente ha inserito un dispositivo.
+ Il dispositivo ha almeno un asset.

- *Postcondizioni:* Il sistema ha eliminato l'asset selezionato. \

- *Scenario principale:*
+ L'utente seleziona un asset dalla lista.
+ L'utente seleziona la funzione di eliminazione dell'asset.
+ Il sistema mostra un messaggio di conferma.
+ L'utente conferma l'eliminazione dell'asset.
+ Il sistema elimina l'asset selezionato e aggiorna la lista degli asset.

#pagebreak()


== UC-18: Valutazione del dispositivo
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-18 : Valutazione del dispositivo]
)
- *Attore primario:* Utente

- *Precondizioni:*
  - L'utente ha inserito un dispositivo.
  - Il dispositivo ha almeno un asset.

- *Postcondizioni:* Il test è stato completato e i risultati sono disponibili per ogni coppia asset-requisito.

- *Scenario principale:*
  + L'utente avvia il test sul dispositivo inserito.
  + Il sistema mostra la lista degli asset del dispositivo con il loro stato di valutazione.
  + L'utente seleziona un asset da valutare.
  + Il passo 3 si ripete fino a quando tutti gli asset sono stati valutati.
  + Il sistema rende disponibili i risultati complessivi del test.


- *Scenari alternativi:*
  - L'utente interrompe il test.


- *Inclusioni:*
  - UC-18.1: Valutazione di un asset

- *Estensioni:*
  - UC-21: Uscita anticipata dal test


=== UC-18.1: Valutazione di un asset
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-18.1 : Valutazione di un asset]
)
- *Attore primario:* Utente \

- *Precondizioni:* 
  - Il test è in corso. \
  - L'utente ha selezionato un asset da valutare. \

- *Postcondizioni:* Tutti i requisiti ACM e AUM sono stati valutati per l'asset selezionato e i relativi esiti sono stati registrati. \

- *Scenario principale:*
  + Il sistema mostra le informazioni dell'asset selezionato.
  + Il sistema mostra la lista dei requisiti da valutare per l'asset con il relativo stato.
  + Per ogni requisito dell'asset, il sistema esegue il decision tree corrispondente.
  + I passi precedenti si ripetono fino alla valutazione di tutti i requisiti dell'asset.

- *Scenari alternativi:*
  - L'utente interrompe il test.

- *Inclusioni:*
  - UC-18.1.1: Esecuzione decision tree per un requisito

- *Estensioni:*
  - UC-21: Uscita anticipata dal test


==== UC-18.1.1: Esecuzione decision tree per un requisito
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-18.1.1 : Esecuzione decision tree per un requisito]
)
- *Attore primario:* Utente \

- *Precondizioni:* 
  - Il test è in corso. \
  - Il sistema ha selezionato il requisito corrente da valutare per l'asset corrente. \

- *Postcondizioni:* Il sistema ha registrato l'esito del decision tree per la coppia asset-requisito corrente. \

- *Scenario principale:*
  + Il sistema mostra il codice e il nome del requisito in esame.
  + Il sistema mostra il primo nodo del decision tree associato al requisito (UC-18.1.1.1).
  + L'utente risponde alla domanda del nodo corrente (UC-18.1.1.2).
  + Il sistema avanza al nodo successivo in base alla risposta fornita.
  + I passi 2-4 si ripetono fino al raggiungimento di un nodo foglia.
  + Il sistema registra l'esito: PASS, FAIL o NOT APPLICABLE.

- *Scenari alternativi:*
  + L'utente desidera tornare al nodo precedente (UC-18.1.1.3).
  + L'utente desidera avanzare a un nodo già risposto in precedenza (UC-18.1.1.4).

- *Inclusioni:*
  - UC-18.1.1.1: Visualizzazione nodo corrente del decision tree
  - UC-18.1.1.2: Risposta alla domanda del nodo corrente


===== UC-18.1.1.1: Visualizzazione nodo corrente del decision tree
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-18.1.1.1 : Visualizzazione nodo corrente del decision tree]
)
- *Attore primario:* Utente \

- *Precondizioni:* Il sistema sta eseguendo il decision tree per un requisito. \

- *Postcondizioni:* L'utente ha visualizzato le informazioni del nodo corrente. \

- *Scenario principale:*
  + Il sistema mostra il codice univoco del nodo corrente.
  + Il sistema mostra il testo della domanda associata al nodo corrente.


===== UC-18.1.1.2: Risposta alla domanda del nodo corrente
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-18.1.1.2 : Risposta alla domanda del nodo corrente]
)
- *Attore primario:* Utente \

- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente del decision tree. \

- *Postcondizioni:* Il sistema ha registrato la risposta e avanzato al nodo successivo. \

- *Scenario principale:*
  + Il sistema mostra il testo della domanda del nodo corrente.
  + L'utente seleziona la risposta.
  + Il sistema registra la risposta e avanza al nodo successivo.

- *Specializzazioni:*
  - UC-18.1.1.2.1: Risposta affermativa al nodo corrente
  - UC-18.1.1.2.2: Risposta negativa al nodo corrente

---

====== UC-18.1.1.2.1: Risposta affermativa al nodo corrente
#v(1em)
- *Attore primario:* Utente \
- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente. \
- *Postcondizioni:* Il sistema registra "Sì" e avanza nel ramo affermativo. \
- *Scenario principale:*
  + L'utente seleziona "Sì" come risposta.
  + Il sistema registra la risposta e avanza al nodo successivo del ramo affermativo.

---

====== UC-18.1.1.2.2: Risposta negativa al nodo corrente
#v(1em)
- *Attore primario:* Utente \
- *Precondizioni:* Il sistema ha mostrato la domanda del nodo corrente. \
- *Postcondizioni:* Il sistema registra "No" e avanza nel ramo negativo. \
- *Scenario principale:*
  + L'utente seleziona "No" come risposta.
  + Il sistema registra la risposta e avanza al nodo successivo del ramo negativo.

---

====== UC-18.1.1.3: Navigazione al nodo precedente
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-18.1.1.3 : Navigazione al nodo precedente]
)
- *Attore primario:* Utente \

- *Precondizioni:* - Il test è in corso. \
  - Il nodo corrente non è il nodo radice del decision tree. \

- *Postcondizioni:* Il sistema riporta l'utente al nodo precedente mostrando la risposta già fornita. \

- *Scenario principale:*
  + L'utente seleziona la funzionalità di navigazione al nodo precedente.
  + Il sistema mostra la domanda del nodo precedente con la risposta già fornita.
  + L'utente può modificare la risposta (UC-18.1.1.2).


== UC-19: Visualizzazione stato avanzamento del test
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-19 : Visualizzazione stato avanzamento del test]
)
- *Attore primario:* Utente \

- *Precondizioni:* Il test è in corso. \

- *Postcondizioni:* L'utente ha visualizzato lo stato corrente del test. \

- *Scenario principale:*
  + Il sistema mostra l'asset e il requisito correnti in esame.
  + Il sistema mostra il numero di asset completati rispetto al totale.
  + Il sistema mostra il numero di requisiti completati per l'asset corrente.
  + Il sistema mostra il percorso seguito nel decision tree fino al nodo corrente.


== UC-20: Visualizzazione nodo foglia del decision tree
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-20 : Visualizzazione nodo foglia del decision tree]
)
- *Attore primario:* Utente \

- *Precondizioni:* Il sistema ha raggiunto un nodo foglia del decision tree. \

- *Postcondizioni:* L'utente ha visualizzato l'esito del requisito per l'asset corrente. \

- *Scenario principale:*
  + Il sistema mostra l'esito del requisito per l'asset corrente.
  + Il sistema mostra la giustificazione dell'esito in base al percorso seguito.

- *Specializzazioni:*
  - UC-20.1: Visualizzazione esito PASS
  - UC-20.2: Visualizzazione esito FAIL
  - UC-20.3: Visualizzazione esito NOT APPLICABLE


== UC-21: Uscita anticipata dal test

- *Attore primario:* Utente \

- *Precondizioni:* Il test è in corso.

- *Postcondizioni:* Il test è stato interrotto.

- *Scenario principale:*
  + L'utente seleziona la funzionalità di uscita dal test.
  + Il sistema chiede all'utente se desidera salvare la sessione corrente.
  + L'utente sceglie di salvare.
  + Il sistema termina la sessione.

- *Scenari alternativi:*
  - L'utente sceglie di non salvare.

- *Estensioni:*
  - UC-22: Salvataggio sessione parziale

== UC-22: Salvataggio sessione parziale
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-22 : Salvataggio sessione parziale]
)
- *Attore primario:* Utente \

- *Precondizioni:* Il test è in corso e l'utente ha risposto ad almeno una domanda. \

- *Postcondizioni:* Il sistema ha prodotto un file JSON contenente lo stato della sessione. \

- *Scenario principale:*
  + L'utente seleziona la funzionalità di salvataggio.
  + Il sistema raccoglie i dati del dispositivo, gli asset, gli esiti registrati e la posizione corrente nel decision tree.
  + Il sistema genera il file in formato JSON.
  + Il sistema mette a disposizione il file per il download.


== UC-23: Ripresa sessione parziale
#v(1em)
#figure(
  image("../../../images/diagrammiUML/placeholder.png", width: 20%),
  caption: [UC-23 : Ripresa sessione parziale]
)
- *Attore primario:* Utente \

- *Precondizioni:* L'utente dispone di un file di sessione parziale precedentemente salvato. \

- *Postcondizioni:* Il sistema carica la sessione e il test riprende dal punto di interruzione. \

- *Scenario principale:*
  + L'utente seleziona la funzionalità di caricamento sessione.
  + L'utente seleziona il file JSON.
  + Il sistema valida il formato e la struttura del file.
  + Il sistema ripristina i dati e riprende il test (UC-18.1.1).

- *Scenari alternativi:*
  + Il file non rispetta il formato: il sistema notifica l'errore (UC-3).


#pagebreak()


sezione riguardante decision tree