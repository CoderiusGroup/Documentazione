#set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Analisi dei Capitolati],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )

#set text(font: "Libertinus Serif",size: 12pt,lang: "it")

#set heading(numbering: "1.")

#align(center)[
  #v(8em)
  #image("../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Analisi dei Capitolati \ di Progetto 2025/2026]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
]
#pagebreak()

#heading(numbering: none, outlined: false)[Tabella di versionamento]
#v(0.5cm)
#align(center)[
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
    [1.0.0],[2026/03/26],[Ines Iadadi],[],[Approvazione del documento],
    [0.1.4],[2026/03/14],[Filippo Zonta Rocha],[Ines Iadadi],[Analisi capitolato C5],
    [0.1.3],[2026/03/14],[Edis Hodja],[Ines Iadadi],[Analisi capitolato C4],
    [0.1.2],[2026/03/14],[Giovanni Bronte],[Ines Iadadi],[Analisi capitolato C1],
    [0.1.1],[2026/03/13],[Leonardo Lorenzin],[Ines Iadadi],[Analisi capitolato C6],
    [0.1.0], [2026/03/13], [Alberto Canavese], [Ines Iadadi],[Analisi capitolato C2],
  )
]
#pagebreak()

#show outline.entry.where(level: 1): set block(above: 1.5em)
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 2)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)

= Introduzione
In questo documento sono analizzati i 5 Capitolati di Progetto proposti per il II lotto dell'anno accademico 2025/2026, con il fine di determinarne possibili rischi, pregi e opportunità di crescita, al fine di motivare la scelta del gruppo Coderius.
Verrà analizzato con particolare riguardo il Capitolato C1, in quanto capitolato selezionato. 

= Capitolato scelto: C1 - Automated EN18031 Compliance Verification

== Descrizione
Il capitolato prevede lo sviluppo di un'interfaccia grafica che guida nella compilazione delle domande presenti nei decision tree relativi ai requisiti descritti nello standard tecnico EN18031, il quale viene utilizzato come norma armonizzata per la RED (Direttiva sulle apparecchiature radio 2014/53/UE). Il software dovrà importare documenti descrittivi delle componenti di rete del caso da analizzare, importare i file che definiscono i decision tree (es. XML, JSON), eseguirli rispettando le dipendenze gerarchiche tra requisiti e restituire per ciascuno un output chiaro (Pass / Fail / Not Applicable), il tutto visualizzabile tramite una dashboard interattiva.

== Dominio Applicativo
Il progetto è concepito per automatizzare il processo manuale della certificazione dei dispositivi radio, processo lento e soggetto ad errori. Grazie ad un'interfaccia grafica e all'uso di decision tree l'utente verrà guidato nella compilazione delle verifiche che produrrannò un report di conformità chiaro e tracciabile.

== Dominio Tecnologico
Non sono imposti vincoli sulle tecnologie utilizzate, tuttavia viene suggerito l'uso dall'azienda di Python 3.x per il backend, gestito tramite Python Packaging. I formati standard previsti per l'importazione e l'esportazione dei dati sono CSV, XML e JSON.

== Motivi della scelta di questo capitolato
Questo capitolato è stato scelto dal gruppo per vari motivi:
- *Progetto realistico*: il software richiesto da Bluewind ha un chiaro risvolto pratico e realistico definito nella documentazione, inoltre si sofferma solo su alcuni dei requisiti richiesti dallo standard EN18031, rendendo il progetto più gestibile e focalizzato.
- *Interesse per la cybersecurity*: Lo standard EN18031 ha riscontrato un certo interesse nel nostro gruppo, in quanto si tratta di un tema molto attuale.
- *Supporto dell'azienda*: Durante il colloquio con Bluewind, l'azienda si è dimostrata molto disponibile ad aiutarci durante lo sviluppo del progetto, offrendoci supporto tramite un canale di comunicazione diretto e incontri periodici.
- *Flessibilità tecnologica*: L'azienda suggerisce alcune tecnologie da usare per il backend, ma non impone nessun vincolo per le tecnologie da usare nel progetto. Questo lascia la possibilità al gruppo di scegliere le tecnologie più adatte alle proprie preferenze, rendendo il progetto più stimolante e personalizzabile.

== Conclusioni
Il capitolato C1 rappresenta la prima scelta del gruppo Coderius, in quanto coniuga un contesto applicativo attuale e realistico con un proponente professionale e disponibile a supportarci durante lo sviluppo, come espresso nell'incontro del 2026/03/17. Inoltre, la flessibilità tecnologica permette al gruppo di scegliere le tecnologie più adatte alle nostre competenze e preferenze.



= Valutazione degli altri Capitolati

== C2 - Code Guardian


=== Descrizione
Il progetto mira a sviluppare una piattaforma web basata su un sistema multi-agente per la revisione e la correzione automatica dei repository software, con particolare attenzione a quelli ospitati su GitHub.


=== Dominio Applicativo
Il progetto si inserisce nel cuore della produzione software, abbracciando al contempo le discipline dell'IA e della difesa digitale. Lo scopo ultimo è innalzare gli standard di eccellenza, protezione e manutenibilità dei sorgenti all'interno di ecosistemi di sviluppo collaborativi.
Obiettivi del progetto:
- *Architettura multi-agente con nodo centrale:* sviluppo di una struttura in cui molteplici agenti software vengono coordinati e gestiti da un modulo centrale (orchestratore).
- *Profilazione del repository:* identificazione automatica del linguaggio di programmazione, delle infrastrutture di sviluppo (framework), delle librerie utilizzate e delle relative versioni.
- *Copertura dei test:* valutazione della presenza e dell'efficacia dei collaudi unitari, verificandone l'adeguatezza rispetto a soglie minime predefinite.
- *Analisi di sicurezza:* revisione approfondita delle vulnerabilità, effettuata sfruttando gli strumenti e le direttive di sicurezza dello standard OWASP.
- *Verifica della documentazione:* controllo qualitativo e quantitativo del materiale informativo, tra cui i file introduttivi (come il README), i manuali per le interfacce di programmazione (API) e le guide all'uso.
- *Cruscotto riassuntivo web:* realizzazione di un'interfaccia utente (basata su React) per mostrare visivamente e in tempo reale lo stato di salute del progetto (livello di aggiornamento, completezza della documentazione, sicurezza e validità dei collaudi).
Al termine di ogni analisi, il sistema genera un resoconto contenente indicatori quantitativi sulle metriche valutate. Per ogni criticità individuata, la piattaforma propone degli interventi risolutivi, fornendo suggerimenti pratici per migliorare la qualità del codice, la sicurezza e l'affidabilità.

=== Dominio Tecnologico
- *Backend / orchestratore:* Node.js, Python
- *Frontend:* React.js
- *Database:* MongoDB o PostgreSQL
- *CI/CD & integrazioni:* GitHub Actions
- *Architettura cloud:* AWS

=== Aspetti positivi
- *Stack moderno:* pratica reale con React, Node.js, Python e AWS.
- *Mentoring aziendale:* supporto e affiancamento diretto dagli esperti di VAR Group.
- *Attenzione alla Cybersecurity:* applicazione pratica dello standard OWASP su codice reale.
- *Formazione:* acquisizione di competenze sugli strumenti tecnologici richiesti dai vincoli.

=== Aspetti negativi
- *Curva di apprendimento ripida:* sia per la gestione di uno stack web composto da React, Node e AWS, sia per la gestione del paradigma ad attori.
- *Numero di funzionalità:* elevato, con rischio reale di ridimensionamento del progetto.
- *Vincolo dei test severo:* garantire il 70% di coverage automatizzato è un'attività complessa che può portare al ridimensionamento del progetto.

=== Conclusioni
Il progetto costituisce un banco di prova eccellente nel campo dell'analisi automatizzata e della qualità del codice. Nonostante l'innegabile valore aggiunto in termini di competenze spendibili sul mercato, i vincoli stringenti e la complessità dello stack tecnologico hanno evidenziato potenziali criticità nella gestione delle tempistiche. Per questo motivo, dopo un confronto congiunto, il gruppo ha scelto di scartare questa opzione, accordando la priorità a progetti che rispecchiano in modo più diretto il nostro background tecnico e i nostri traguardi universitari.


#pagebreak()

== C4 - L'app che Protegge e Trasforma
=== Descrizione
Il proponente del seguente progetto richiede lo sviluppo di un'applicazione mobile (iOS e Android) denominata "L'app che Protegge e Trasforma" con lo scopo di prevenire e fornire supporto a soggetti vittime di violenza di genere. 

=== Dominio Applicativo
Lo sviluppo applicativo deve essere svolto utilizzando un'interfaccia intuitiva, agibile e da richiesta anche personalizzabile oltre che a sicura e conforme al GDPR. \
Tra le varie funzionalità vengono richieste:

- Identificazione di situazioni di rischio e l'invio di alert a contatti stretti;
- Servizi di supporto in qualità di numeri d'emergenza, centri antiviolenza, supporto psicologico e legale oltre a informazioni come l'allontanamento da relazioni tossiche;
- Strumenti per gestire la privacy e sicurezza dell'utente finale;
- Consapevolizzare gli utenti sul tema della violenza di genere e adottare strategie di empowerment;
- Area dedicata ad una community volta alla condivisione di esperienze pur sempre mantenendo professionalità e riservatezza dei dati sensibili. 

=== Dominio Tecnologico
Il proponente dichiara nel capitolato fornito una serie di tecnologie e strumenti quali:

- *Backend:* AWS Lambda, API Gateway, AWS SageMaker e Bedrock (relativi ai modelli di machine learning)
- *Frontend:* Flutter (framework consigliato)
- *Database:* DynamoDB (NoSQL), PostgresSQL/MySQL (relazionale)
- *CI/CD & integrazioni:* Jira, Bitbucket
- *Architettura cloud:* AWS (cloud provider preferito) 

=== Aspetti positivi

- Impatto sociale molto alto con forte valore etico e sociale;
- Impiego di architettura serverless, servizi cloud AWS avanzati;
- Integrazione di modelli di machine learning (AI);
- Esperienza reale su mobile cross-platform (Flutter).

=== Aspetti negativi

- Elevata responsabilità etica e legale in cui errori nel sistema potrebbero comportare conseguenze fortemente impattanti nella vita degli utenti;
- Richiesta di una solida conoscenza su cloud, AI, sicurezza e sviluppo mobile;
- Difficoltà implementative relative a geolocalizzazione, sicurezza e community;
- Requisiti di sicurezza molto stringenti (GDPR).

=== Conclusioni

Il capitolato presentato da Miriade S.r.l. non solo è completo e sostanzioso in termini di funzionalità implementative, ma è un progetto che si dilaga in campi molto complessi e di elevata responsabilità legato a valori sociali ed etici di cui oggi è fondamentale trattare con estrema sensibilità e capacità. \
Nonostante il gruppo abbia riconosciuto un impatto molto positivo della proposta, le funzionalità previste legate all'utilizzo di modelli AI, insieme alle significative responsabilità in termini di sicurezza e implicazioni legali, non risultano pienamente allineate con gli obiettivi e le competenze attualmente presenti all'interno del gruppo.



== C5 - Nexum
=== Descrizione
Il capitolato presentato da Eggon Srl riguarda lo sviluppo di nuove funzionalità per la piattaforma Nexum, sviluppata dall'azienda. Si prospetta di migliorare la gestione HR e la comunicazione tra i consulenti, semplificandone al contempo l'uso per i dipendenti.
=== Dominio Applicativo
Il capitolato si propone di evolvere la piattaforma, rendendola un ecosistema HR completo e in grado di gestire molteplici task in maniera efficiente, ad esempio integrando diversi strumenti basati sull'AI per la gestione dei dati. L'obiettivo generale è creare un prodotto software scalabile, modulare e di facile utilizzo.
=== Dominio Tecnologico
Le tecnologie indicate dal proponente includono:

- *Angular* per la realizzazione della dashboard amministrativa 
- *Next.js* per l’interfaccia destinata agli utenti finali;
- *Ruby on Rails* per lo sviluppo del backend;
- *PostgreSQL* come database relazionale per la gestione dei dati;
=== Aspetti positivi
- Progetto interessante e realisticamente applicabile al sistema del mondo del lavoro, orientato alla digitalizzazione dei servizi HR.
- Integrazione di strumenti basati sull'AI per l'automazione di vari processi
- Architettura modulare
=== Aspetti negativi
- Necessità di apprendere in maniera approfondita uno stack tecnologico ampio e variegato;
- I rigidi vincoli di progetto comportano tempi di sviluppo potenzialmente dilatati.
=== Conclusioni
Il capitolato proposto da Eggon Srl si presenta come un progetto realistico e pragmatico per l'ottimizzazione del settore HR e delle relative pertinenze. Ciononostante, il gruppo ha deciso di escludere questa proposta. La necessità di padroneggiare molteplici strumenti tecnologici e di garantire fin da subito un'alta modularità comporterebbe un eccessivo dilatamento dei tempi di sviluppo. Di conseguenza, si è scelto di orientare le nostre preferenze verso altri capitolati.



== C6 - Second Brain

=== Descrizione
Il capitolato prevede lo sviluppo di un'applicazione, più specificatamente un editor di testo basato sul linguaggio di markup Markdown, che consenta di testare le potenzialità dei Large Language Models (LLM) nella manipolazione di un testo.

=== Dominio Applicativo
Il progetto ha come obiettivo finale quello di consentire, mediante l'editor di testo, operazioni come:
- *Editing e rendering*: scrittura di contenuti in formato Markdown e relativa visualizzazione grafica.
- *Rielaborazione*: possibilità di riassumere, tradurre o cambiare lo stile di una porzione di testo.
- *Analisi critica*: applicare al testo il modello dei "sei cappelli per pensare" per poterlo esaminare sotto  vari punti di vista (es. logico, creativo, emotivo).
- *Distant Writing*: generazione automatica di testo a partire da un prompt di specifiche fornito dall'utente.

=== Dominio Tecnologico
Il progetto prevede l'implementazione di un'applicazione mediante le seguenti tecnologie:
- *HTML* e librerie per il rendering Markdown per quanto riguarda il frontend.
- Integrazione con *modelli LLM* come Gemini, Mistral e Gemma tramite API OpenAI-compatibili.
- *Java* oppure *Python* per l'eventuale gestione del backend.
- *HTTP* come protocollo per la comunicazione client-server.

=== Aspetti positivi
- *Ampia libertà nell'implementazione*: possibilità di scegliere liberamente l'insieme delle tecnologie da utilizzare per il frontend e flessibilità nello sviluppo dei requisiti opzionali.
- *Argomenti trattati*: il progetto consente di approfondire temi molto attuali come il prompt engineering e l'integrazione di AI all'interno di un software.
- *Chiarezza dei requisiti*: il capitolato è ben definito, senza lasciare dubbi sul processo di sviluppo dei vari requisiti  
=== Aspetti negativi
- *Complessità del testing*: essendo un software basato su intelligenza artificiale, è difficile garantire una copertura di test automatici che sia sempre affidabile.
- *Dipendenza da servizi esterni*: il funzionamento dell'app è strettamente legato a modelli e API esterne, i cui servizi potrebbero non essere sempre disponibili  durante lo sviluppo.
- *Interesse ridotto*: il gruppo non è  particolarmente stimolato nel trattare l'argomento degli LLM.
=== Conclusioni
Nonostante il progetto proposto da Zucchetti tratti argomenti interessanti e attuali, le incertezze riguardo alla gestione degli LLM e alla forte dipendenza dai servizi legati ad essi, unite alla necessità di un'alta copertura di test su contenuti generati dall'intelligenza artificiale, sono risultate un possibile ostacolo. Per questo motivo, in seguito ad un confronto tra i membri, il gruppo ha scelto di non selezionare questo capitolato, preferendo orientarsi verso proposte ritenute più stimolanti.
