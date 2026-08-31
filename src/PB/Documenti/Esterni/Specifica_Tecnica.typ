#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Specifica Tecnica], align(right)[Coderius Group],
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  },
)

#set list(spacing: 1.5em)
#set enum(spacing: 1.2em)

#set text(font: "Libertinus Serif", size: 12pt, lang: "it")

#set heading(numbering: "1.")

#let scheda-rischio(id, nome, tipo, prob, impatto, prevenzione, risposta) = {
  set text(size: 11pt)
  block(
    width: 100%,
    stroke: 0.5pt + luma(100),
    inset: 0pt,
    clip: true,
    table(
      columns: (5.5cm, 1fr),
      stroke: (x, y) => (
        bottom: 0.5pt + luma(100),
        right: if x == 0 { 0.5pt + luma(10) } else { none },
      ),
      inset: (x: 10pt, y: 7pt),
      fill: (x, _) => if x == 0 { luma(240) } else { none },
      [*Codice*], [#id],
      [*Denominazione*], [#nome],
      [*Categoria*], [#tipo],
      [*Probabilità*], [#prob],
      [*Impatto*], [#impatto],
      [*Prevenzione*], [#prevenzione],
      [*Piano di risposta*], [#risposta],
    ),
  )
  v(0.8em)
}

#let tabella-ore(rows, caption-text: none) = {
  let role-header(name) = rotate(-60deg, reflow: true)[#name]
  figure(
    table(
      columns: (1.6fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, auto),
      align: (left, center, center, center, center, center, center, center),
      stroke: 0.5pt + luma(100),
      table.header(
        [*Componente*],
        role-header[*Responsabile*],
        role-header[*Amministratore*],
        role-header[*Analista*],
        role-header[*Progettista*],
        role-header[*Programmatore*],
        role-header[*Verificatore*],
        role-header[*Totale*],
      ),
      ..rows.flatten(),
    ),
    caption: caption-text,
  )
}

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Specifica Tecnica]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
  #v(4em)
  #text(size: 20pt)[*Versione 0.8.0*]
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
    [0.8.0], [2026/08/28], [Alberto Canavese], [], [Stesura della sezione 4 - Design pattern],
    [0.7.0], [2026/08/22], [Ines Iadadi], [], [Stesura della sezione Backend 3.6],
    [0.6.0], [2026/08/13], [Filippo Zonta Rocha], [], [Stesura della sezione 3.5],
    [0.5.0], [2026/08/10], [Edis Hodja], [], [Stesura della sezione 3.4],
    [0.4.0], [2026/07/29], [Leonardo Lorenzin], [Edis Hodja], [Stesura iniziale della sezione 3],
    [0.3.0], [2026/07/24], [Giovanni Bronte], [Leonardo Lorenzin], [Stesura della sezione 2],
    [0.2.0], [2026/07/24], [Alberto Canavese], [Leonardo Lorenzin], [Stesura della sezione 1],
    [0.1.0], [2026/07/21], [Giovanni Bronte], [Leonardo Lorenzin], [Prima stesura del documento],
  )
]
#pagebreak()
#show outline.entry.where(level: 1): set block(above: 1.5em)
#show link: underline;
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 3)

#outline(
  title: [Elenco delle Figure],
  target: figure.where(kind: image),
)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)


= Introduzione

== Scopo del documento
La presente documentazione è redatta con il fine di illustrare in modo esaustivo l'architettura, sia logica che infrastrutturale, del sistema concepito dal gruppo *Coderius*. \ La *Specifica Tecnica* si pone come linea guida vincolante per l'intera fase di implementazione, fungendo da ponte tra l'#underline(text(fill: blue)[#link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[Analisi dei Requisiti]]) e la realizzazione concreta del software, per assicurarne solidità e coerenza strutturale.

Nel dettaglio, gli obiettivi preposti per questo documento sono:

- *Motivare l'infrastruttura tecnologica:* argomentare le ragioni dietro la scelta degli strumenti di sviluppo (inclusi Python, React, Flask e Vite), selezionati per rispondere appieno ai criteri di flessibilità, performance e scalabilità richiesti dal progetto.

- *Strutturare la logica applicativa e i design pattern:* mappare l'organizzazione interna dei moduli e i loro flussi di comunicazione, dimostrando come i pattern implementati favoriscano la creazione di codice disaccoppiato e orientato al testing.
- *Pianificare la strategia di deployment:* definire le modalità di distribuzione dell'applicativo e l'allocazione delle sue parti all'interno degli ambienti operativi, sfruttando la containerizzazione offerta da Docker.
- *Promuovere la manutenibilità a lungo termine:* fornire direttive chiare al team di sviluppo per rendere la base di codice facilmente interpretabile, supportando così agevolmente le future iterazioni, correzioni ed espansioni del sistema.

== Scopo del prodotto
Il prodotto mira ad automatizzare e digitalizzare il processo di verifica della conformità alla normativa di sicurezza EN 18031, come richiesto dal capitolato *Automated EN18031 Compliance Verification* proposto da Bluewind S.r.l. L'obiettivo è sostituire le attuali procedure manuali, spesso dispendiose in termini di tempo e soggette a errore umano, con una soluzione software moderna ed efficiente.

Il sistema permetterà di valutare sistematicamente i requisiti di sicurezza per i dispositivi, elaborando esiti certi e tracciabili attraverso l'esecuzione di alberi decisionali. Tramite un'interfaccia utente web fluida e reattiva, il prodotto finale ottimizzerà i tempi operativi della proponente, garantendo al contempo un elevato standard di affidabilità nella validazione dei dati.

#pagebreak()

== Glossario
Al fine di evitare ambiguità e incomprensioni legate alla terminologia tecnica presente in questo documento e nel resto della documentazione prodotta dal gruppo Coderius, è stato redatto un apposito glossario. 

Ogni termine tecnico o di dominio che necessita di ulteriori chiarimenti è contrassegnato nel testo da una "G" a pedice (es. _termine_#sub[G]). Cliccando sull'indicatore, il lettore verrà reindirizzato direttamente alla definizione corrispondente all'interno del documento #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Glossario.pdf")[*Glossario*].

== Riferimenti

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[#text(
    fill: blue,
  )[Capitolato C1 - _Automated EN18031 Compliance Verification_, Bluewind S.r.l.]]

- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[#text(
    fill: blue,
  )[Norme di Progetto - Coderius Group]]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2025/2026 - _Regolamento del progetto didattico_]]

=== Riferimenti informativi

- #link("https://www.math.unipd.it/~rcardin/swea/2023/Diagrammi%20delle%20Classi.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2023/2024 - _Diagrammi delle Classi_]]

- #link("https://www.math.unipd.it/~rcardin/swea/2022/Software%20Architecture%20Patterns.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2022/2023 - _Pattern Architetturali_]]

- #link("https://www.math.unipd.it/~rcardin/swea/2022/Design%20Pattern%20Creazionali.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2022/2023 - _Design Pattern Creazionali_]]

- #link("https://www.math.unipd.it/~rcardin/swea/2022/Design%20Pattern%20Strutturali.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2022/2023 - _Design Pattern Strutturali_]]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T06.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2025/2026 - _Progettazione Software_]]

=== Documentazione delle tecnologie:

  - #link("https://docs.python.org/3/")[#underline[#text(fill: blue)[Python 3 Official Documentation]]]

  - #link("https://www.typescriptlang.org/docs/")[#underline[#text(fill: blue)[TypeScript Official Documentation]]]
  - #link("https://react.dev/")[#underline[#text(fill: blue)[React Official Documentation]]]
  - #link("https://vite.dev/guide/")[#underline[#text(fill: blue)[Vite Getting Started Guide]]]
  - #link("https://flask.palletsprojects.com/")[#underline[#text(fill: blue)[Flask Official Documentation]]]
  - #link("https://docs.docker.com/")[#underline[#text(fill: blue)[Docker Documentation]]]
  - #link("https://vitest.dev/")[#underline[#text(fill: blue)[Vitest Documentation]]]
  - #link("https://testing-library.com/docs/react-testing-library/intro/")[#underline[#text(fill: blue)[React Testing Library Documentation]]]

#pagebreak()
= Tecnologie
Nelle seguente sezione vengono descritte le tecnologie usate per lo sviluppo del capitolato *Automated EN18031 Compliance Verification*.

== Linguaggi di programmazione 

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Python],
    [3.12],
    [Python è un linguaggio di programmazione ad alto livello, orientato ad oggetti, adatto, tra gli altri usi, a sviluppare applicazioni distribuite, scripting, computazione numerica e system testing. 
    Nel nostro progetto è stato scelto per la gestione del lato backend dato che è il linguaggio prediletto dalla proponente e per la sua estrema versatilità.],

    [TypeScript],
    [5.4],
    [TypeScript è un metalinguaggio open source sviluppato da Microsoft che si basa su JavaScript, aggiungendovi la tipizzazione statica. Nel nostro progetto è utilizzato per lo sviluppo del frontend assieme alla libreria React: l'introduzione dei tipi garantisce maggiore robustezza, facilita la manutenibilità del codice nel tempo e permette di intercettare numerosi errori già in fase di compilazione.],
)

== Frameworks

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Flask],
    [3.1.3],
    [Flask è un micro-framework Web scritto in Python, è progettato per essere rapido e semplice, offrendo al contempo la possibilità di essere utilizzato per applicazioni complesse.
    È inoltre molto semplice da imparare, flessibile e ha buone performance.
    ],
)

== Strumenti di build

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Vite],
    [8.0.16],
    [Vite è diventato lo standard de facto dell'ecosistema frontend. È il motore ufficiale dietro i framework moderni come Vue, e i template ufficiali di React.
    È inoltre molto più veloce a creare il server rispetto ad altri strumenti simili ed è anche molto facile da implementare grazie alla sua configurazione minima richiesta. 
    ],
)

== Deployment

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Docker],
    [3.1.3],
    [Docker è una piattaforma open source che consente agli sviluppatori di creare, implementare, eseguire, aggiornare e gestire i container. 
    I container sono componenti standardizzati ed eseguibili che combinano il codice sorgente dell'applicazione con le librerie e le dipendenze del sistema operativo necessarie per eseguire tale codice in qualsiasi ambiente.
    ],
)

== Librerie

#table(
    columns: (auto, 1fr, 6fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [React],
    [19.2.7],
    [React è una libreria completa, molto flessibile e permette la creazione e la gestione dell'interfaccia utente. Nel nostro progetto viene utilizzato per le varie librerie che permettono di gestire l'interfaccia utente al meglio.],

    [Zustand],
    [/],
    [Zustand è una libreria minimale per la gestione dello stato globale in applicazioni React: gli store si definiscono tramite funzioni hook, senza richiedere Provider né il boilerplate legato ad azioni e reducer tipico di altre soluzioni. Nel nostro progetto viene utilizzato per implementare gli store separati per area funzionale (DeviceStore, SessionStore, TreeStore, ResultStore, UIStore) del frontend.],

    [Zod],
    [/],
    [Zod è una libreria per la definizione e validazione di schemi dati, con inferenza automatica dei tipi TypeScript a partire dallo schema stesso. Nel nostro progetto viene utilizzata nel Domain Layer del frontend per validare la struttura dei dati in ingresso (dispositivi, asset) prima che vengano elaborati dal resto dell'applicazione.],

    [react-hot-toast],
    [/],
    [react-hot-toast è una libreria leggera per la gestione di notifiche toast in applicazioni React, con supporto nativo a coda, timer di auto-dismiss e stacking dei messaggi. Nel nostro progetto viene utilizzata nell'Infrastructure Layer del frontend come implementazione concreta dietro l'interfaccia NotificationService.],

    [TanStack Query],
    [/],
    [TanStack Query è una libreria per la gestione dello stato server-side in applicazioni React: si occupa di caching, retry con backoff e deduplica delle richieste in volo. Nel nostro progetto viene utilizzata nell'Infrastructure Layer del frontend per orchestrare le chiamate al decision tree sopra FetchApiClient, senza sostituirlo.],
)

#pagebreak()

== Tecnologie per testing

#table(
    columns: (auto, 1fr, 5.5fr),
    align: center + horizon,
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Tecnologia*], [*Versione*], [*Descrizione*],

    [Vitest],
    [/],
    [Vitest è un framework per il test di applicazioni TypeScript e JavaScript, progettato per essere veloce e leggero. Sfruttando la stessa configurazione di Vite, garantisce un ambiente di testing altamente performante e coerente con la build.],

    [React Testing Library],
    [/],
    [React Testing Library è una soluzione molto leggera per il testing di componenti React. Offre funzioni di utilità essenziali basate su react-dom e react-dom/test-utils, incoraggiando al contempo migliori pratiche di testing.],

    [Pytest],
    [/],
    [Pytest è un framework per il test di Python, che permette di scrivere test automatizzati in modo semplice e leggibile.]
)


= Architettura
== Panoramica e stile architetturale

L'applicazione è strutturata secondo il paradigma *Client-Server*, con una distinzione precisa tra il livello che gestisce l'interazione con l'utente e quello che si occupa della logica applicativa e della persistenza. Tenere separate queste due responsabilità permette di far evolvere ciascuna parte in modo autonomo e di ridurre le dipendenze reciproche tra le tecnologie impiegate.

Concretamente, il prodotto è composto da un client *React*, che costituisce l'intera interfaccia grafica, e da un server *Flask* scritto in Python 3.12, che raccoglie la logica di business e amministra i dati. Il primo si occupa di mostrare le viste, raccogliere e validare gli input, tenere traccia dello stato di navigazione e rendere interattiva la consultazione dei decision tree e degli esiti. Il secondo espone le funzionalità applicative, verifica la correttezza dei dati in ingresso, coordina l'importazione e l'esportazione dei file *JSON* e produce i report finali nei formati *JSON* e *PDF*.

=== Modalità di comunicazione
Client e server restano deliberatamente indipendenti e dialogano esclusivamente attraverso chiamate *HTTP* secondo lo stile architetturale *REST*. Ogni operazione di lettura, creazione o modifica delle risorse (dispositivi, decision tree, sessioni di valutazione, risultati)  si traduce in una richiesta del frontend verso gli endpoint esposti dal backend, con i dati veicolati in formato *JSON*.

Si tratta di uno scambio *stateless*: il server non conserva alcuno stato di sessione tra una richiesta e la successiva, e ogni chiamata deve contenere tutte le informazioni necessarie alla propria elaborazione. Questa impostazione è coerente con la scelta di non adottare un database relazionale: la persistenza è affidata alla lettura e alla scrittura di file *JSON* sul filesystem del server, sia per i dispositivi importati sia per i decision tree e le sessioni di valutazione.

Il client, da parte sua, ignora completamente come tali dati vengano archiviati o come venga eseguita la logica di valutazione dei singoli nodi: si limita a rispettare i contratti stabiliti dalle API, che rappresentano l'unico punto di contatto tra le due componenti e l'unica fonte di verità condivisa.

== Architettura di deployment
Il sistema viene distribuito come applicazione monolitica — un singolo backend *Flask* e un singolo frontend *React* — anziché come insieme di microservizi indipendenti, con i due container orchestrati tramite *Docker Compose*.

Questa scelta è coerente con la natura del dominio applicativo: il sistema elabora un dispositivo alla volta all'interno di una singola sessione di valutazione, senza richiedere l'elaborazione concorrente di grandi volumi di richieste né la scalabilità orizzontale indipendente delle sue parti. La separazione tra client e server, unita all'organizzazione interna a layer descritta nelle sezioni successive, è già sufficiente a garantire la modularità e il disaccoppiamento necessari, senza dover ricorrere a una scomposizione fisica in servizi separati.

Adottare i microservizi in questo contesto introdurrebbe una complessità infrastrutturale sproporzionata rispetto ai benefici, a fronte di un dominio applicativo ben delimitato. Un'architettura monolitica containerizzata risulta invece più semplice da avviare, interrompere e manutenere, richiede meno risorse computazionali e consente cicli di deploy più rapidi: caratteristiche che meglio si adattano sia alle dimensioni del team di sviluppo, sia al carattere di strumento interno del prodotto.

== Frontend

Il frontend è realizzato come *Single Page Application* in React. Le pagine non contengono logica di business: si limitano a comporre la UI e a delegare recupero dati, validazioni e transizioni di stato a hook applicativi dedicati, i quali a loro volta si appoggiano su store di stato condiviso e su service per orchestrare i casi d'uso principali (gestione di device e asset, esecuzione guidata del test di conformità, produzione e consultazione dei risultati). Per mantenere il codice manutenibile e facilmente estendibile con nuovi requisiti EN 18031, l'applicazione è organizzata secondo un'architettura a livelli, in cui ogni livello ha una responsabilità unica e dipende solo da quelli sottostanti. Nella sezione seguente sono riportati i livelli individuati e le principali scelte tecnologiche adottate per ciascuno.

=== Organizzazione a livelli
Il frontend è organizzato in sei livelli, ciascuno con una responsabilità unica:

- *Presentation Layer*:  Pagine e componenti React con instradamento basato su React Router.

- *Application Layer*: Custom Hooks e Service dedicati all'orchestrazione dei casi d'uso.
- *State Management*: Store distribuiti per area funzionale (DeviceStore, SessionStore, TreeStore, ResultStore, UIStore) basati su Zustand.
- *Infrastructure Layer*: Gestione comunicazione HTTP tramite fetch nativo incapsulato e mapping degli errori unico.
- *Domain Layer*:  Entità di business (Device, Asset, DecisionTree, Node), validazione dei dati tramite Zod e logica di esecuzione/ripresa (treeRules).
- *Shared*: Soluzioni custom per componenti UI (evitando l'introduzione di librerie UI pesanti); la validazione dei dati è affidata a Zod nel Domain Layer.

La dipendenza tra livelli è a senso unico: Presentation dipende da Application, Application dipende
da State/Domain/Infrastructure, mentre Domain non dipende da nessun altro livello. Questo vincolo è
quello che permette di sostituire un dettaglio tecnico (es. il client HTTP) senza toccare le
pagine, ed è il criterio guida usato nelle scelte descritte di seguito.

Si è deliberatamente scelto di non applicare una separazione esagonale rigorosa in ogni punto: i
service applicativi possono scrivere direttamente sugli store invece di passare sempre da
un'astrazione intermedia aggiuntiva, mantenendo nonostante ciò il vincolo di dipendenza a senso unico  rispettato.

==== Presentation Layer

Il Presentation Layer raggruppa le pagine dell'applicazione (HomeView, DeviceFormView, DeviceAssetManagementView, AssetFormView, DeviceSummaryView, SessionRunnerView, ModifySessionView, ResultView) e i componenti UI che le compongono. Ogni pagina corrisponde all'ingresso di un caso d'uso specifico e si limita a comporre elementi visuali, senza contenere logica di validazione o chiamate dirette al backend: ogni decisione viene delegata al layer applicativo sottostante tramite hook dedicati. L'instradamento tra le pagine è affidato a React Router, che associa a ciascuna vista un percorso proprio e permette di applicare guardie di accesso (route guard) alle pagine che richiedono precondizioni — ad esempio impedire l'apertura di SessionRunnerView se non è stato prima definito un device attivo. Il layer non mantiene alcuno stato condiviso tra viste: legge dati e funzioni esposti dagli hook e si occupa solo di renderizzarli e di inoltrare gli eventi generati dall'utente.

==== Application Layer

L'Application Layer contiene gli hook applicativi e i service che orchestrano i casi d'uso. Ogni hook incapsula un flusso operativo specifico (navigazione dalla home, gestione asset, esecuzione della sessione di valutazione, export) ed espone alle pagine solo lo stato e le funzioni necessarie a renderlo, nascondendo la sequenza di chiamate a service e store sottostanti. I service applicativi centralizzano operazioni che hanno senso indipendentemente da una singola vista: il servizio di sessione coordina creazione, risposta, navigazione e ripresa del test; il servizio degli alberi decisionali si occupa di caricamento e normalizzazione; il servizio device gestisce le operazioni su device e asset; il servizio di export produce i file scaricabili. 
==== State Management

Lo stato condiviso tra più pagine è distribuito su cinque store distinti per area funzionale (DeviceStore, SessionStore, TreeStore, ResultStore, UIStore), ciascuno implementato come store *Zustand* indipendente. /*Zustand è stato scelto rispetto a un approccio basato su React Context + useReducer perché evita la ricreazione di Provider annidati e i re-render indiscriminati tipici del Context quando lo stato cambia, mantenendo comunque store separati per responsabilità invece di un unico store monolitico.*/ Ogni store definisce uno stato iniziale, un insieme di azioni tipizzate che ne descrivono le uniche modifiche ammesse, e un hook selettore dedicato attraverso cui i componenti leggono i dati senza conoscere la forma interna dello store. Questa organizzazione impedisce che lo stato venga alterato da un punto qualsiasi del codice, facendo sì che ogni cambiamento passi da un'azione esplicita, tracciabile e riconducibile a un preciso caso d'uso gestito dal layer applicativo.

==== Infrastructure Layer

L'Infrastructure Layer racchiude i dettagli tecnici dietro interfacce stabili usate dal layer applicativo. FetchApiClient realizza la comunicazione HTTP tramite fetch nativo, esposto ai service tramite l'interfaccia ApiClientService. Sopra questo livello, *TanStack Query* orchestra le chiamate al decision tree occupandosi di cache, retry e deduplica delle richieste, senza che i service debbano gestirle manualmente; una funzione di mapping degli errori converte i fallimenti di rete o di protocollo in errori applicativi tipizzati, in modo che il resto dell'applicazione non debba mai interpretare direttamente uno stato HTTP o un'eccezione di rete. In particolare, TanStack Query utilizza FetchApiClient tramite un adapter/fetcher dedicato: in questo modo la serializzazione dei payload e il mapping degli errori restano centralizzati nell'Infrastructure Layer. Da questo ne deriva che ogni comunicazione con il backend deve transitare per ApiClientService, affinché serializzazione e traduzione degli errori restino concentrate in un unico punto e nessun modulo applicativo interpreti direttamente uno stato HTTP.
NotificationManager realizza in modo analogo la consegna concreta delle notifiche dietro l'interfaccia NotificationService, appoggiandosi alla libreria *react-hot-toast* per la gestione di coda, timer di auto-dismiss e stacking dei messaggi.

==== Domain Layer

Il Domain Layer rappresenta il problema applicativo in modo indipendente da React, dal routing e dal backend. Le entità Device e Asset incapsulano i propri dati ed espongono metodi per la gestione degli asset e l'assegnazione dei requisiti, mantenendosi internamente coerenti; Node e DecisionTree offrono una rappresentazione tipizzata di domanda/foglia e dell'albero di valutazione, con una funzione di conversione esplicita dal payload restituito dal backend. Le regole pure treeRules determinano se un requisito è ancora riprendibile o va considerato concluso, mentre la validazione della struttura dei dati in ingresso è affidata a schemi *Zod*, così da individuare payload malformati prima che raggiungano il resto dell'applicazione.

=== Moduli applicativi del frontend /*Elementi costitutivi del frontend*/
Le sezioni precedenti hanno definito i livelli architetturali del frontend e le relative scelte
tecnologiche. Questa sezione ne descrive l'implementazione concreta: le pagine, gli hook, i service, gli store e le entità del, con ruolo e responsabilità di ciascun modulo.
==== Pagine dell'applicazione

Il Presentation Layer è composto da nove pagine, ciascuna corrispondente a un caso d'uso
specifico del flusso di valutazione, dalla creazione del device fino alla consultazione dei
risultati finali. Di seguito è riportato il ruolo di ciascuna pagina: 

- *HomePage*: permette di creare un nuovo device, caricarne uno esistente o riprendere una sessione di valutazione già avviata.

- *DeviceFormPage*: raccolta e validazione dei dati descrittivi del device.
- *DeviceAssetManagementPage*: gestione dell'elenco degli asset associati al device (aggiunta, modifica, rimozione).
- *AssetFormPage*: creazione o modifica di un singolo asset e assegnazione dei requisiti EN 18031 da valutare.
- *DeviceSummaryPage*: riepilogo di device e asset prima di avviare la valutazione.
- *SessionRunnerPage*: presenta la domanda corrente del decision tree e gestisce la navigazione tra le risposte.
- *ModifySessionPage*: permette di scegliere quale requisito/asset riprendere o rifare all'interno di una sessione in corso.
- *ResultPage*: mostra i risultati aggregati della valutazione e ne consente l'esportazione.
- *DecisionTreeCatalogPage*: elenca i decision tree disponibili e ne presenta il dettaglio, consentendone l'esportazione in formato JSON o CSV.

Componenti riutilizzabili:

- *Esito*: etichetta che rappresenta lo stato di valutazione con un codice colore.
- *GrafoDecisionTree*: visualizzazione dell'albero decisionale per un requisito.
- *RequireSession*: controllo di accesso alle pagine che richiedono una sessione attiva; se la sessione non c'è, riporta l'utente alla pagina iniziale.

#v(1em)
#figure(
  image("../../../images/specifica_tecnica/diagramma_pagine.png", width: 100%),
  caption: [Diagramma delle pagine],
)



==== Orchestrazione applicativa

La logica operativa non sta nelle pagine, ma in due famiglie di moduli: gli hook, che servono una
pagina sola, e i service, che raccolgono operazioni utili in più punti dell'applicazione.

Gli *hook* espongono alla pagina soltanto lo stato da mostrare e le azioni da collegare ai comandi,
tenendo per sé la sequenza di passaggi che li produce.

- *useSessionRunner*: conduce la valutazione guidata, dalla scelta dell'asset e del requisito fino alla registrazione dell'esito. Si occupa anche di caricare l'albero al momento giusto e di riportare il percorso al punto in cui era, quando si riprende una sessione interrotta.
- *useResult*: gestisce la consultazione degli esiti, permettendo di scendere dall'asset al singolo requisito e ricostruendo la sequenza di domande e risposte che ha portato a quel risultato.
- *useSessionModify*: prepara la ripresa o la rivalutazione di un requisito e calcola quali altri requisiti dipendono da esso, perché rifacendolo vanno rifatti anche quelli.

I *service* raccolgono le operazioni che hanno senso al di fuori di una singola pagina.

- *DeviceService*: creazione, importazione da file, modifica di un asset ed esportazione del dispositivo. Non conserva nulla in modo permanente: il dispositivo vive nello stato del client per tutta la durata del lavoro, e il backend non lo scrive su disco.
- *DecisionTreeService*: recupera l'elenco degli alberi e il singolo albero, e avvia l'esportazione di un albero. Riceve dall'esterno il componente che dialoga con il backend, così da poter essere collaudato sostituendolo con una versione finta.
- *SessionService*: si occupa del file di sessione, che produce al momento del salvataggio e rilegge, validandolo, al momento della ripresa.
- *deviceFileFormats*: raccoglie i formati con cui il dispositivo può essere scritto e riletto, oggi JSON e CSV, ciascuno con le proprie regole di scrittura e di lettura.
- *ReportService*: produce il report di conformità al termine della valutazione. Recupera gli alberi dei requisiti esaminati — una sola volta ciascuno, anche quando lo stesso requisito ricorre su più asset — compone i dati del report e li consegna all'utente nel formato scelto.
- *reportFormats*: raccoglie i formati in cui il report può essere scritto, secondo lo stesso schema di `deviceFileFormats`. A differenza di quest'ultimo prevede la sola scrittura, perché un report si produce e non si rilegge.

Hook e service si appoggiano all'Infrastructure Layer per dialogare con il backend e per mostrare i
messaggi all'utente.
/*
#block(
  width: 100%,
  fill: yellow.lighten(85%),
  stroke: 1.5pt + yellow.darken(25%),
  inset: 11pt,
  radius: 3pt,
)[
  *NOTA INTERNA AL GRUPPO — PUNTO DA CHIARIRE CON LA PROPONENTE* \
  #v(0.3em)
  Il report di conformità è qui progettato ma non ancora realizzato. Prima di implementarlo va
  chiarito che cosa si intenda, in RF-Ob80, per *«esito aggregato del decision tree»*.
  L'interpretazione adottata in questa sezione è l'esito complessivo di un requisito su tutti gli
  asset del dispositivo a cui si applica, ottenuto con la stessa riduzione già impiegata per lo
  stato di asset e dispositivo.
  #v(0.3em)
  Va confermata prima di procedere, perché un'interpretazione diversa cambia la forma dei dati del
  report e con essa entrambe le strategie di scrittura. La decisione VE-7.3 affida al gruppo la
  struttura del report con validazione della proponente, e VE-7.4 prevede l'invio di un'anteprima
  via posta elettronica: è quella la sede in cui chiudere il punto.
  #v(0.3em)
  *Questo riquadro va rimosso una volta ottenuta la conferma.*
]*/

==== Stato applicativo

Le informazioni condivise fra più pagine sono raccolte in tre contenitori, uno per area funzionale.

- *DeviceStore*: il dispositivo in lavorazione con i suoi asset, e le operazioni per aggiungerne, modificarne o rimuoverne uno.
- *SessionStore*: la sessione di valutazione, cioè l'elenco delle coppie asset-requisito da esaminare, quale sia quella in corso, il percorso svolto su ciascuna e l'esito raggiunto.
- *TreeStore*: l'albero del requisito in corso, il nodo su cui ci si trova e la sequenza delle risposte date, con un cursore che permette di tornare indietro e riavanzare senza perdere le risposte successive.

Ogni componente dichiara quale porzione di queste informazioni gli serve, e viene aggiornato solo
quando cambia quella: legge cioè attraverso un selettore, senza dipendere da come il contenitore è
fatto internamente. Le modifiche passano tutte da azioni dichiarate, mai da scritture dirette.

I tre contenitori non sono del tutto indipendenti: quando il dispositivo viene sostituito o
modificato, `DeviceStore` azzera `SessionStore`. È voluto — una valutazione riferita a un
dispositivo che nel frattempo è cambiato darebbe risultati privi di significato.

==== Modello di dominio e validazione

Il dominio è descritto da entità che non sanno nulla né dell'interfaccia né del backend.

- *Device* e *Asset*: il dispositivo e i beni da valutare, con i rispettivi dati descrittivi e, per l'asset, i requisiti assegnati.
- *DecisionTree* e *Node*: l'albero di un requisito e i suoi nodi, che sono domande con due rami oppure foglie con un esito.
- *Session*: la valutazione nel suo insieme. Contiene le singole valutazioni asset-requisito, ciascuna con il proprio stato, l'esito e il percorso di risposte che vi ha condotto.

Accanto alle entità stanno le regole, scritte come funzioni pure e quindi verificabili da sole.

- *treeRules*: percorre l'albero. Ricava il nodo corrente ripercorrendo le risposte dalla radice, riconosce quando si è arrivati a una foglia e con quale esito, e ricostruisce la sequenza di domande e risposte da mostrare nei risultati.
- *sessionRules*: governa la valutazione. Costruisce l'elenco delle coppie asset-requisito da esaminare, calcola l'avanzamento e determina quali requisiti dipendono da quello che si sta rifacendo. Riassume inoltre più esiti in uno solo, secondo una priorità fissa che fa prevalere il fallimento e la valutazione in corso sugli esiti positivi: da qui si ricavano lo stato di un asset, quello dell'intero dispositivo e quello di un singolo requisito su tutti gli asset a cui si applica.
- *treeLayout*: dispone i nodi in colonne e livelli per il disegno del grafo, senza occuparsi di come verranno poi rappresentati.
- *reportRules*: compone il report a partire dalla sessione e dagli alberi già recuperati. Per ogni coppia asset-requisito raccoglie i dati dell'asset, il nome del requisito, l'esito e la sequenza di domande e risposte percorsa, affiancandovi l'esito complessivo del requisito sul dispositivo. Non accede né alla rete né ai contenitori di stato, e si presta quindi a essere verificata da sola.

I dati che entrano nell'applicazione — quelli scritti dall'utente e quelli che arrivano dal backend
o da un file — sono controllati con schemi *Zod*, che ne verificano la forma prima che raggiungano
il resto del codice.

==== Dettagli infrastrutturali

L'Infrastructure Layer tiene separati i meccanismi tecnici dal comportamento dell'applicazione.

- *ApiClientService* e *FetchApiClient*: l'interfaccia con cui il resto del codice chiede dati al backend e la sua realizzazione concreta. Compone l'indirizzo, prepara il corpo della richiesta e traduce ogni fallimento — sia una rete assente sia una risposta di errore — in un `ApiError`, che porta con sé il messaggio e, quando c'è, il codice di stato.
- *queryClient*: conserva gli alberi già richiesti, così che chiedere due volte lo stesso requisito non produca due richieste. I dati non scadono e i tentativi ripetuti sono disattivati, perché gli alberi non cambiano durante una sessione di lavoro.
- *NotificationService* e *NotificationManager*: l'interfaccia per avvisare l'utente e la sua realizzazione, che si appoggia a `react-hot-toast` per coda, scomparsa automatica e sovrapposizione dei messaggi.
- *downloadFile*: consegna al browser un contenuto già pronto perché l'utente lo salvi. Raccoglie in un punto solo il meccanismo usato da tutte le esportazioni — dispositivo, sessione, albero decisionale e report — che altrimenti verrebbe ripetuto in ciascun service.

Grazie a questa separazione, sostituire il modo in cui si parla con il backend o si mostrano gli
avvisi non tocca né le pagine né i service.

==== Flussi applicativi

Il flusso dei dati va in una sola direzione. Le pagine non modificano lo stato condiviso né parlano
con il backend: raccolgono l'azione dell'utente e la passano all'hook, che decide cosa fare. Se
serve un dato che il client non ha, l'hook lo chiede al service, che a sua volta passa
dall'Infrastructure Layer; altrimenti agisce direttamente sui contenitori di stato. In entrambi i
casi la modifica avviene attraverso un'azione dichiarata, e i componenti in ascolto si aggiornano
di conseguenza.

Vale la pena precisare quando il backend viene interpellato e quando no. Rispondere a una domanda
del decision tree *non* comporta alcuna richiesta al server: l'albero viene scaricato una volta
sola, all'ingresso nel requisito, e da lì in avanti la navigazione avviene interamente nel client.
Al backend ci si rivolge per ottenere un albero, per l'elenco del catalogo, per far risolvere gli
identificativi di dispositivo e asset e per derivare i requisiti applicabili a un tipo di asset.

I flussi principali sono i seguenti.

- *Nuova valutazione*: da HomePage si passa a DeviceFormPage per i dati del dispositivo, quindi a DeviceAssetManagementPage e AssetFormPage per gli asset, infine a DeviceSummaryPage per il riepilogo. Il dispositivo resta nel DeviceStore per tutto il percorso.
- *Importazione di un dispositivo*: il formato del file viene riconosciuto dall'estensione, il contenuto viene letto e controllato con Zod, poi i dati del dispositivo e quelli di ciascun asset vengono inviati al backend, che assegna gli identificativi mancanti e ricava i requisiti applicabili.
- *Avvio della valutazione*: da DeviceSummaryPage si entra in SessionRunnerPage; la sessione viene creata a partire dall'elenco delle coppie asset-requisito ricavate dagli asset del dispositivo. Se una sessione compatibile è già in corso, viene ripresa invece di ricominciare.
- *Esecuzione del decision tree*: scelto il requisito, l'albero viene caricato e il percorso riportato al punto in cui era. Ogni risposta aggiorna il percorso nel client; la sessione viene allineata a ogni passo, così che un salvataggio colga sempre lo stato corrente. Arrivati a una foglia, l'esito viene registrato e si torna all'elenco dei requisiti dell'asset.
- *Ripresa e modifica*: ModifySessionPage permette di scegliere un requisito già chiuso e rifarlo; insieme a esso vengono riaperti i requisiti che ne dipendono, perché il loro esito potrebbe cambiare.
- *Consultazione degli esiti*: quando tutte le coppie sono state valutate, SessionRunnerPage lascia il posto a ResultPage, dove si può scendere dall'asset al requisito e rivedere le domande e le risposte che hanno portato all'esito.
- *Salvataggio e ripresa da file*: la sessione può essere scaricata come file in qualsiasi momento e ricaricata da HomePage per riprendere il lavoro.
- *Esportazione*: il dispositivo viene scritto in JSON o CSV dal client; l'albero decisionale viene invece prodotto dal backend, che risponde all'endpoint di esportazione nel formato richiesto.
- *Report di conformità*: da ResultPage, a valutazione conclusa, il ReportService recupera gli alberi dei requisiti esaminati, li passa a reportRules perché ne componga i dati e affida a reportFormats la scrittura nel formato scelto. Il report è prodotto interamente nel client, dove risiedono gli unici dati su cui si fonda: il backend non conserva né il dispositivo né la sessione, e coinvolgerlo richiederebbe di inviargli l'intera sessione senza alcun vantaggio.

#v(1em)

#figure(
  image("../../../images/specifica_tecnica/seq_avanzamento_albero.png", width: 100%),
  caption: [Diagramma di sequenza dell'avanzamento nell'albero decisionale],
)

#v(1em)

== Elementi principali del dominio

Questa microsezione definisce le entità principali del dominio che costituiscono il nucleo funzionale dell'applicazione. L'obiettivo è chiarire i concetti di business su cui si basa la valutazione di conformità EN 18031 e il rapporto tra essi, senza introdurre dettagli tecnici marginali al design del prodotto.

=== Classi principali

=== Device

- *Ruolo*: rappresenta il dispositivo sottoposto a valutazione e aggrega gli asset a esso associati.

- *Attributi principali*:
  - id: string — identificatore univoco del dispositivo (UUID o codice interno).
  - nome: string — denominazione leggibile del dispositivo.
  - sistemaOperativo: string — stringa descrittiva del sistema operativo.
  - descrizione: string — descrizione testuale e note contestuali.
  - assetIds: string[] — elenco degli identificativi degli asset associati.

- *Metodi principali*:
  - addAsset(asset: Asset): void — associa un asset al dispositivo (aggiorna assetIds).
  - removeAsset(assetId: string): void — rimuove l'associazione di un asset.
  - validateMetadata(): boolean — verifica la presenza dei campi obbligatori per l'avvio della valutazione.
  - toPayload(): object — serializza lo stato del device in formato JSON per trasmissione o persistenza.

*Responsabilità*: raccogliere i dati descrittivi del dispositivo, gestire l'elenco degli asset e fornire operazioni di serializzazione e validazione dei metadati.

 *UC rilevanti*: UC-4, UC-7, UC-10, UC-11.

=== Asset

 *Ruolo*: rappresenta un elemento del device soggetto a valutazione (es. interfaccia di rete, credenziali, registro accessi).

 *Attributi principali*:
  - id: string — identificatore univoco dell'asset.
  - nome: string — denominazione leggibile dell'asset.
  - tipo: string — categoria funzionale (es. "network", "security", "privacy", "financial").
  - descrizione: string — descrizione testuale dell'asset.
  - sensibile: boolean — flag che indica se l'asset tratta dati sensibili.
  - requisiti: string[] — elenco dei codici requisito selezionati per l'asset.
  - stato: enum { non_valutato, in_corso, PASS, FAIL, NOT_APPLICABLE } — stato sintetico per visualizzazione e aggregazione.

 *Metodi principali*:
  - assignRequirement(code: string): void — associa un requisito all'asset.
  - removeRequirement(code: string): void — rimuove un requisito assegnato.
  - setState(result): void — aggiorna lo stato di valutazione dell'asset.
  - summary(): object — restituisce un oggetto sintetico per visualizzazione in elenco.

*Responsabilità*: mantenere metadati e requisiti associati, esporre operazioni di aggiornamento dello stato e fornire rappresentazioni per la UI.

*UC rilevanti*: UC-12, UC-14, UC-15, UC-16, UC-18.

=== DecisionTree

 *Ruolo*: rappresenta l'albero decisionale che guida la valutazione di un requisito EN 18031.

 *Attributi principali:*
  - requisito: string — codice del requisito (es. "ACM-1").
  - nome: string — titolo descrittivo del requisito.
  - versione: string — versione del decision tree.
  - applicabileA: string[] — tipi di asset a cui il tree è applicabile.
  - dipendenze: string[] — altri requisiti da cui questo requisito dipende.
  - radice: string — id del nodo radice.
  - nodi: Node[] — collezione dei nodi in formato piatto.

* Metodi principali:*
  - findNode(id: string): Node | null — restituisce il nodo corrispondente all'identificatore.
  - validateIntegrity(): { ok: boolean, errors: string[] } — verifica unicità degli id, presenza della radice e assenza di riferimenti orfani.
  - normalize(rawPayload): DecisionTree — converte un payload di importazione in una struttura valida.
  - export(): object — serializza l'albero per esportazione.
* Responsabilità:* fornire accesso e operazioni di consistenza sulla struttura dell'albero, oltre a funzioni di import/export.

* UC rilevanti:* UC-29, UC-30, UC-38, UC-42.

=== Node (Nodo)

Ruolo: elemento atomico dell'albero; può rappresentare una domanda o una foglia di conclusione.

 *Attributi principali:*
  - id: string — identificatore del nodo.
  - tipo: enum { domanda | foglia } — distingue nodi di decisione e nodi di esito.
  - testo: string — testo della domanda o del messaggio esplicativo.
  - rami?: { sì: string, no: string } — mappe ad id di nodo (solo per domande).
  - esito?: enum { PASS | FAIL | NOT_APPLICABLE } — esito assegnato (solo per foglie).

 *Metodi principali*:
 - isQuestion(): boolean — ritorna true se il nodo è di tipo domanda.
 - nextNode(answer: 'yes'|'no'): string | null — restituisce l'id del nodo successivo per il ramo scelto.
  - toString(): string — rappresentazione testuale utile per logging e spiegazioni.

* Responsabilità*: determinare il comportamento locale del nodo nell'esecuzione del decision tree e fornire metodi di navigazione.

* UC rilevanti:* UC-22, UC-23, UC-32..UC-34.

=== Session (Sessione di valutazione)

Ruolo: istanza di esecuzione della valutazione per un device, con la memoria del percorso seguito e lo stato della procedura.

*Attributi principali:*
  - id: string — identificatore univoco della sessione.
  - deviceId: string — riferimento al device valutato.
  - currentAssetId: string — id dell'asset attualmente in valutazione.
  - currentRequirement: string — codice del requisito corrente.
  - percorso: { nodo: string, domanda: string, risposta: 'yes'|'no' } — sequenza delle risposte registrate.
  - stato: enum { attiva | salvata | completata } — stato della sessione.
  - createdAt: timestamp
  - updatedAt: timestamp

*Metodi principali:*
  - start(deviceId: string): Session — inizializza una nuova sessione per il device.
  - recordAnswer(nodeId: string, answer: 'yes'|'no'): { nextNodeId?: string, partialResult?: Result } — registra la risposta e calcola il passo successivo.
  - resume(sessionId: string): Session — carica lo stato di una sessione salvata.
  - save(): void — persiste lo stato corrente della sessione.
  - undoLastAnswer(): void — rimuove l'ultima mossa dal percorso e ripristina lo stato conseguente.

*Responsabilità*: orchestrare il flusso di esecuzione del decision tree per i vari asset e requisiti, mantenere la cronologia delle scelte e offrire operazioni di salvataggio e ripresa.

*UC rilevanti*: UC-19, UC-20, UC-25, UC-26.

=== Result (Esito)

*Ruolo:* rappresenta il risultato della conformità per una coppia asset, requisito e l'aggregazione degli esiti per asset.

 *Attributi principali:*
  - assetId: string — riferimento all'asset valutato.
  - requisito: string — codice del requisito valutato.
  - esito: enum { PASS | FAIL | NOT_APPLICABLE } — esito assegnato.
  - motivazione: string — spiegazione testuale dell'esito (opzionale).

*Metodi principali:*
  - toReportEntry(): object — converte l'esito in un formato adatto all'export.
  - mergeWith(other: Result): Result — unisce informazioni per aggregare esiti a livello di asset.

* Responsabilità:* rappresentare e serializzare i risultati della valutazione e supportare l'aggregazione per il reporting.

* UC rilevanti:* UC-27, UC-28.

=== Catalog (Catalogo degli alberi)

*Ruolo:* indice dei decision tree disponibili, utile a selezionare, importare e consultare i requisiti e i rispettivi alberi.

*Attributi principali:*
  - entries: { requisito: string, nome: string, nodi: number, dipendenze: string[] }
  
* Metodi principali:*
  - listTrees(): CatalogEntry[] — restituisce l'elenco sintetico degli alberi disponibili.
  - loadTree(requirement: string): DecisionTree — carica la struttura completa del tree richiesto.
  - importTree(file): DecisionTree — importa un albero da file e ne verifica la validità.
  - exportTree(requirement: string): object — prepara la struttura per l'esportazione.

* Responsabilità:* tenere l'indice dei decision tree e abilitare operazioni di ricerca, importazione ed esportazione.

* UC rilevanti:* UC-29, UC-30, UC-38, UC-42.

=== Vincoli e regole di integrità

- Un nodo deve avere un identificatore univoco all'interno del medesimo decision tree (RF-Op14).
- Non è consentita l'eliminazione del nodo radice (RF-Op12 / UC-39).
- L'aggiunta di un nodo che introduca dipendenze circolari tra requisiti deve essere impedita (RF-Op04 / UC-40.1).
- I rami non collegati possono essere trasformati in nodi foglia con un esito assegnato (RF-Op15 / UC-32.3).
- Le modifiche strutturali di un decision tree devono poter essere annullate (RF-Op16 / UC-37).

Queste regole definiscono l'integrità del dominio applicativo e devono essere rispettate sia nella modellazione concettuale sia nell'implementazione concreta del prodotto.

== Backend

Il backend è realizzato come applicazione Flask scritta in Python 3.12, esposta come singola API REST stateless. Lato backend l'applicazione è organizzata secondo un'architettura a livelli, in cui ogni livello ha una responsabilità unica e dipende solo da quelli sottostanti, con l'obiettivo di isolare la logica di dominio dai dettagli di framework e di persistenza e di renderla verificabile in modo indipendente tramite unit test.

=== Organizzazione a livelli

Il backend è organizzato in quattro livelli:

- *Presentation Layer*: blueprint Flask che espongono gli endpoint REST.
- *Application Layer*: service che orchestrano i casi d'uso.
- *Domain Layer*: entità (Device, Node, DecisionTree) e regole pure (treeRules), senza alcuna dipendenza da Flask, da repository o dal filesystem.
- *Persistence Layer*: interfacce e implementazioni concrete di accesso ai dati.

La dipendenza tra livelli è a senso unico: Presentation dipende da Application, Application dipende da Domain e da Persistence, mentre Domain non dipende da nessun altro livello. Questa direzione è ciò che permette di sostituire un dettaglio tecnico (es. il meccanismo di persistenza) senza toccare le route, ed è verificata dai test di dominio, che non richiedono alcun contesto applicativo Flask per essere eseguiti.

Si è scelta un'architettura a livelli invece di un'architettura esagonale applicata rigorosamente. Il dominio applicativo del backend è delimitato: un solo meccanismo di persistenza su filesystem, un'unica API REST esposta al client React, per cui l'introduzione di porte e adapter espliciti per ogni dipendenza tecnica aggiungerebbe indirezione senza un beneficio proporzionato in termini di sostituibilità. L'unico punto in cui il disaccoppiamento esplicito interfaccia/implementazione è sfruttato è l'accesso ai decision tree, dove esiste più di una ragione concreta per prevedere un'implementazione alternativa. Per le altre dipendenze tecniche, l'architettura a livelli è già sufficiente a garantire la separazione delle responsabilità e la testabilità del dominio, senza introdurre overhead architetturale non giustificato dalle dimensioni del team e del progetto.

==== Presentation Layer

Il Presentation Layer raggruppa i blueprint Flask che espongono gli endpoint REST del sistema. Ogni route riceve la richiesta HTTP, delega l'elaborazione al service applicativo di competenza e traduce il risultato restituito in una risposta HTTP con il codice di stato appropriato. Le route non contengono logica di business ma si limitano a deserializzare il payload in ingresso, invocare il service e serializzare la risposta, in modo analogo a come le pagine del frontend non contengono logica di validazione o di navigazione. L'applicazione viene composta tramite una application factory, che registra i blueprint e la configurazione, così da poter istanziare istanze isolate dell'app nei test.

==== Application Layer

L'Application Layer contiene i service che orchestrano i casi d'uso, in modo simmetrico ai service applicativi del frontend. Ogni service centralizza un'area di responsabilità del dominio applicativo:

- *DeviceService*: valida i soli metadati di un device in ingresso (nome, sistema operativo, descrizione) e ne costruisce l'entità, rispettando l'`id` se fornito o generandone uno con `uuid4` altrimenti. È l'unico punto di validazione del device, condiviso sia dal percorso di creazione manuale sia da quello di importazione così da evitare due logiche di validazione divergenti per lo stesso concetto.
- *AssetService*: valida i campi di un asset (nome, tipo, descrizione, sensitibilità) e ne deriva automaticamente i requisiti applicabili quando non forniti esplicitamente: interroga `DecisionTreeService.list_requirement_ids_for_type()`, che scansiona l'intero catalogo di decision tree posseduto dal backend e restituisce gli id dei requisiti il cui campo `appliesTo` include il tipo dell'asset. 
- *DecisionTreeService*: carica un decision tree tramite il repository dedicato, ne verifica l'integrità strutturale e lo normalizza prima di restituirlo al chiamante. Espone inoltre `list_requirement_ids_for_type()`, usato da `AssetService` per la derivazione dei requisiti.

I service dipendono sia dal Domain Layer sia dal Persistence Layer, e sono quindi il livello in cui la logica di business pura (nel dominio) viene combinata con l'accesso ai dati (nella persistenza).

Va precisato che la ragione per cui Asset ha un endpoint proprio non è la stessa che regola l'id: l'id di un Asset resta comunque un vincolo puramente locale al proprio device (nessun'altra entità lo referenzia in modo indipendente, coerentemente col fatto che il routing non usa mai un `:id` di asset). La necessità di un endpoint per Asset nasce dalla necessità di derivazione dei requisiti applicabili, che è logica di dominio server-side e non un'esigenza di identità.

==== Domain Layer

Il Domain Layer rappresenta le entità del problema applicativo in modo indipendente da Flask, dalle route e dal meccanismo di persistenza. Le entità Device, Node e DecisionTree e le regole pure treeRules qui definite sono concettualmente le stesse descritte per il frontend nella sezione @elementi-dominio, ma nella loro forma lato server: non contengono alcuna dipendenza da librerie web o di accesso a file, il che le rende testabili con semplici unit test che non richiedono di avviare un'istanza dell'applicazione Flask. Le regole treeRules lato server determinano la validità strutturale di un albero (unicità degli id, presenza della radice, assenza di riferimenti orfani) e sono condivise concettualmente, ma non nel codice, con le regole equivalenti applicate lato client durante la navigazione.

==== Persistence Layer <principio-repository>

Il Persistence Layer isola i dettagli di accesso ai dati dietro interfacce, seguendo un principio deliberatamente selettivo: un repository esiste solo per le entità che il backend possiede autonomamente, non per ogni entità di dominio. Il decision tree è l'unico dato che il sistema possiede e mette a disposizione dell'utente (e non viceversa): per questo motivo `IDecisionTreeRepository` e la sua implementazione concreta `JsonDecisionTreeRepository` sono l'unica coppia interfaccia/implementazione del backend. `JsonDecisionTreeRepository` legge i file JSON in `backend/data/decision_trees/` , che costituiscono dati seed dell'applicazione e non dati generati a runtime dall'utente. L'interfaccia `IDecisionTreeRepository` dichiara `save()`, `delete()`, `get()` e `list()` (quest'ultimo usato da `AssetService` per la derivazione dei requisiti).

Device non ha repository in quanto è un dato che l'utente porta al sistema (creazione manuale o import) e riporta via (export, o incorporato in una sessione), mai una collezione posseduta e servita per id dal backend. Per questo `POST /devices` è stateless, il device non viene mai scritto su disco dal backend, e vive per l'intera durata della sessione solo nel DeviceStore del frontend. Lo stesso vale per Asset dal punto di vista della persistenza anche se, a differenza del Device, Asset ha un endpoint e un service dedicati.

=== Dettaglio dei moduli applicativi del backend

==== Endpoint REST <endpoint-rest>

La seguente tabella riassume gli endpoint esposti dal backend, distinguendo quelli già implementati da quelli pianificati. Per gli endpoint pianificati, il verbo e il percorso indicati sono un'ipotesi di lavoro coerente con le convenzioni REST già in uso, non ancora verificata in fase di implementazione.

#table(
  columns: (auto, 2fr, 1fr, 1fr),
  align: (center, left, left, center),
  fill: (x, y) => if y == 0 { blue.lighten(70%) },
  [*Metodo*], [*Percorso*], [*Descrizione*], [*Stato*],
  [POST], [`/devices`],
  [Valida i metadati obbligatori di un device (nome, sistema operativo, descrizione), rispetta l'`id` se fornito o ne genera uno con `uuid4` altrimenti, restituisce l'entità serializzata (con `assets` sempre vuoto: gli asset non fanno parte di questo payload). Nessuna scrittura su disco. Contratto unico condiviso dalla creazione manuale (UC-4) e dall'importazione (UC-2): il file importato viene validato nella sua forma da Zod lato client, ma i soli metadati del device vengono comunque sottoposti a questo stesso endpoint per la risoluzione dell'id.],
  [Implementato],

  [POST], [`/assets`],
  [Valida i campi di un asset (nome, tipo, descrizione, `sensitive`) e ne deriva automaticamente i requisiti applicabili (campo `requirements`) quando non forniti esplicitamente, interrogando l'intero catalogo di decision tree tramite `DecisionTreeService`. Rispetta l'`id` se fornito, altrimenti ne genera uno con `uuid4`. Nessuna scrittura su disco.],
  [Implementato],

  [GET], [`/decision-trees/{requirementId}`],
  [Carica il decision tree del requisito indicato tramite `JsonDecisionTreeRepository`, ne normalizza la struttura e lo restituisce.],
  [Implementato],
)

==== Flussi applicativi principali

- *Creazione di un device*: il client invia i metadati raccolti in DeviceFormView a `POST /devices`; la route delega a `DeviceService`, che valida i campi tramite le regole del Domain Layer e genera un id se assente; la risposta serializzata viene restituita al client, che la mantiene nel proprio DeviceStore. Gli asset vengono poi aggiunti in DeviceAssetManagementView/AssetFormView senza ulteriori scritture lato server.
- *Importazione di un device (JSON)*: il client acquisisce il file, lo valida nella sua interezza (metadati e asset) con gli schemi Zod del Domain Layer frontend; solo i metadati del device vengono poi inviati a `POST /devices`, con lo stesso contratto della creazione manuale, per la risoluzione dell'id (rispettato se presente nel file); il client ricompone il device risolto con gli asset già validati localmente e popola il DeviceStore.
- *Creazione di un asset*: il client invia i dati raccolti in AssetFormView a `POST /assets`; la route delega ad `AssetService`, che valida i campi e, se `requirements` non è specificato, chiede a `DecisionTreeService` di derivarli scansionando il catalogo dei decision tree; l'asset risolto viene restituito al client, che lo aggiunge alla lista asset del device corrente nel DeviceStore.
- *Caricamento di un decision tree*: il client richiede `GET /decision-trees/{requirementId}`; la route delega a `DecisionTreeService`, che si appoggia a `JsonDecisionTreeRepository` per leggere il file seed corrispondente, ne verifica l'integrità tramite `validateIntegrity()` e restituisce la struttura normalizzata; TanStack Query, lato client, si occupa di cache e deduplica di questa chiamata.

=== Testing

I test del backend sono organizzati in una cartella `tests/` separata, a specchio della struttura di `src/` — la convenzione idiomatica per progetti Pytest, deliberatamente diversa da quella adottata nel frontend (test colocati accanto al file testato), dove invece si segue la convenzione idiomatica Vitest. Il Domain Layer, non avendo dipendenze da Flask o dal filesystem, è verificabile con semplici unit test; i service sono verificati con test che sostituiscono il repository con un'implementazione o un doppio di test; le route sono verificate con test di integrazione tramite il test client di Flask. La qualità del codice è inoltre verificata tramite `ruff check` e `ruff format --check` in CI.

== Elementi principali del dominio <elementi-dominio>

Questa microsezione definisce le entità principali del dominio che costituiscono il nucleo funzionale dell'applicazione. L'obiettivo è chiarire i concetti di business su cui si basa la valutazione di conformità EN 18031 e il rapporto tra essi, senza introdurre dettagli tecnici marginali al design del prodotto.

=== Classi principali

/*=== Device

- *Ruolo*: rappresenta il dispositivo sottoposto a valutazione e aggrega gli asset a esso associati.

- *Attributi principali*:
  - id: string — identificatore univoco del dispositivo (UUID o codice interno).
  - nome: string — denominazione leggibile del dispositivo.
  - sistemaOperativo: string — stringa descrittiva del sistema operativo.
  - descrizione: string — descrizione testuale e note contestuali.
  - assetIds: string[] — elenco degli identificativi degli asset associati.

- *Metodi principali*:
  - addAsset(asset: Asset): void — associa un asset al dispositivo (aggiorna assetIds).
  - removeAsset(assetId: string): void — rimuove l'associazione di un asset.
  - validateMetadata(): boolean — verifica la presenza dei campi obbligatori per l'avvio della valutazione.
  - toPayload(): object — serializza lo stato del device in formato JSON per trasmissione o persistenza.

*Responsabilità*: raccogliere i dati descrittivi del dispositivo, gestire l'elenco degli asset e fornire operazioni di serializzazione e validazione dei metadati.

=== Asset

 *Ruolo*: rappresenta un elemento del device soggetto a valutazione (es. interfaccia di rete, credenziali, registro accessi).

 *Attributi principali*:
  - id: string — identificatore univoco dell'asset.
  - nome: string — denominazione leggibile dell'asset.
  - tipo: string — categoria funzionale (es. "network", "security", "privacy", "financial").
  - descrizione: string — descrizione testuale dell'asset.
  - sensibile: boolean — flag che indica se l'asset tratta dati sensibili.
  - requisiti: string[] — elenco dei codici requisito selezionati per l'asset.
  - stato: enum { non_valutato, in_corso, PASS, FAIL, NOT_APPLICABLE } — stato sintetico per visualizzazione e aggregazione.

 *Metodi principali*:
  - assignRequirement(code: string): void — associa un requisito all'asset.
  - removeRequirement(code: string): void — rimuove un requisito assegnato.
  - setState(result): void — aggiorna lo stato di valutazione dell'asset.
  - summary(): object — restituisce un oggetto sintetico per visualizzazione in elenco.

*Responsabilità*: mantenere metadati e requisiti associati, esporre operazioni di aggiornamento dello stato e fornire rappresentazioni per la UI.

=== DecisionTree

 *Ruolo*: rappresenta l'albero decisionale che guida la valutazione di un requisito EN 18031.

 *Attributi principali:*
  - requisito: string — codice del requisito (es. "ACM-1").
  - nome: string — titolo descrittivo del requisito.
  - versione: string — versione del decision tree.
  - applicabileA: string[] — tipi di asset a cui il tree è applicabile.
  - dipendenze: string[] — altri requisiti da cui questo requisito dipende.
  - radice: string — id del nodo radice.
  - nodi: Node[] — collezione dei nodi in formato piatto.

* Metodi principali:*
  - findNode(id: string): Node | null — restituisce il nodo corrispondente all'identificatore.
  - validateIntegrity(): { ok: boolean, errors: string[] } — verifica unicità degli id, presenza della radice e assenza di riferimenti orfani.
  - normalize(rawPayload): DecisionTree — converte un payload di importazione in una struttura valida.
  - export(): object — serializza l'albero per esportazione.
* Responsabilità:* fornire accesso e operazioni di consistenza sulla struttura dell'albero, oltre a funzioni di import/export.


=== Node (Nodo)

Ruolo: elemento atomico dell'albero; può rappresentare una domanda o una foglia di conclusione.

 *Attributi principali:*
  - id: string — identificatore del nodo.
  - tipo: enum { domanda | foglia } — distingue nodi di decisione e nodi di esito.
  - testo: string — testo della domanda o del messaggio esplicativo.
  - rami?: { sì: string, no: string } — mappe ad id di nodo (solo per domande).
  - esito?: enum { PASS | FAIL | NOT_APPLICABLE } — esito assegnato (solo per foglie).

 *Metodi principali*:
 - isQuestion(): boolean — ritorna true se il nodo è di tipo domanda.
 - nextNode(answer: 'yes'|'no'): string | null — restituisce l'id del nodo successivo per il ramo scelto.
  - toString(): string — rappresentazione testuale utile per logging e spiegazioni.

* Responsabilità*: determinare il comportamento locale del nodo nell'esecuzione del decision tree e fornire metodi di navigazione.

=== Session (Sessione di valutazione)

Ruolo: istanza di esecuzione della valutazione per un device, con la memoria del percorso seguito e lo stato della procedura.

*Attributi principali:*
  - id: string — identificatore univoco della sessione.
  - deviceId: string — riferimento al device valutato.
  - currentAssetId: string — id dell'asset attualmente in valutazione.
  - currentRequirement: string — codice del requisito corrente.
  - percorso: { nodo: string, domanda: string, risposta: 'yes'|'no' } — sequenza delle risposte registrate.
  - stato: enum { attiva | salvata | completata } — stato della sessione.
  - createdAt: timestamp
  - updatedAt: timestamp

*Metodi principali:*
  - start(deviceId: string): Session — inizializza una nuova sessione per il device.
  - recordAnswer(nodeId: string, answer: 'yes'|'no'): { nextNodeId?: string, partialResult?: Result } — registra la risposta e calcola il passo successivo.
  - resume(sessionId: string): Session — carica lo stato di una sessione salvata.
  - save(): void — persiste lo stato corrente della sessione.
  - undoLastAnswer(): void — rimuove l'ultima mossa dal percorso e ripristina lo stato conseguente.

*Responsabilità*: orchestrare il flusso di esecuzione del decision tree per i vari asset e requisiti, mantenere la cronologia delle scelte e offrire operazioni di salvataggio e ripresa.

=== Result (Esito)

*Ruolo:* rappresenta il risultato della conformità per una coppia asset, requisito e l'aggregazione degli esiti per asset.

 *Attributi principali:*
  - assetId: string — riferimento all'asset valutato.
  - requisito: string — codice del requisito valutato.
  - esito: enum { PASS | FAIL | NOT_APPLICABLE } — esito assegnato.
  - motivazione: string — spiegazione testuale dell'esito (opzionale).

*Metodi principali:*
  - toReportEntry(): object — converte l'esito in un formato adatto all'export.
  - mergeWith(other: Result): Result — unisce informazioni per aggregare esiti a livello di asset.

* Responsabilità:* rappresentare e serializzare i risultati della valutazione e supportare l'aggregazione per il reporting.

=== Catalog (Catalogo degli alberi)

*Ruolo:* indice dei decision tree disponibili, utile a selezionare, importare e consultare i requisiti e i rispettivi alberi.

*Attributi principali:*
  - entries: { requisito: string, nome: string, nodi: number, dipendenze: string[] }
  
* Metodi principali:*
  - listTrees(): CatalogEntry[] — restituisce l'elenco sintetico degli alberi disponibili.
  - loadTree(requirement: string): DecisionTree — carica la struttura completa del tree richiesto.
  - importTree(file): DecisionTree — importa un albero da file e ne verifica la validità.
  - exportTree(requirement: string): object — prepara la struttura per l'esportazione.

* Responsabilità:* tenere l'indice dei decision tree e abilitare operazioni di ricerca, importazione ed esportazione.

=== Vincoli e regole di integrità*/

#pagebreak()
= Design pattern

== Criteri di scelta

I pattern documentati in questa sezione non sono stati selezionati a priori da un catalogo, ma
individuati a partire dai problemi concretamente emersi nella progettazione del prodotto. Ciascuno
di essi risponde ad almeno uno dei seguenti obiettivi, coerenti con l'organizzazione a livelli
descritta nelle sezioni precedenti:

- *Verificabilità*: consentire il collaudo della logica applicativa senza richiedere una rete attiva, un'interfaccia grafica montata o file reali sul disco.
- *Assenza di logica applicativa ai bordi*: mantenere pagine e rotte prive di decisioni, in coerenza con il vincolo di dipendenza a senso unico fra i livelli.
- *Estendibilità rispetto ai requisiti EN 18031*: permettere l'introduzione di nuovi requisiti e di nuovi formati di scambio senza riprogettare i moduli esistenti.
- *Unicità del punto di verità*: evitare la duplicazione di logiche di validazione o di trasformazione dei dati in punti diversi del sistema.

Si sottolinea che nessuna scelta è motivata dalla previsione di un'infrastruttura distribuita.
L'applicazione opera interamente in locale e la condivisione dei decision tree modificati avviene
all'esterno dell'applicativo, mediante esportazione e distribuzione manuale dei file, come
stabilito con la proponente nella riunione del 28 luglio 2026 (decisione VE-7.1).

Il perimetro di questa sezione è costituito dai pattern del catalogo di Gamma, Helm, Johnson e
Vlissides che presentano attinenza con il problema affrontato, integrati dal solo Repository, che
appartiene al catalogo architetturale di Martin Fowler ed è documentato in quanto criterio di
accesso ai dati adottato dal backend. I pattern del catalogo privi di rapporto con il dominio
applicativo non sono discussi. Ciò
comporta che alcune tecniche di progettazione ampiamente impiegate nel prodotto non vi compaiano
come pattern: è il caso dell'iniezione delle dipendenze, per cui
ciascun componente riceve i propri collaboratori dal costruttore anziché istanziarli, e il grafo
degli oggetti viene composto in un unico punto del sistema. Si tratta di un principio di
progettazione e non di un pattern del catalogo, e come tale è descritto contestualmente al Factory
Method, che ne costituisce il luogo di applicazione, anziché in una scheda propria.

Per ciascun pattern sono indicati il problema affrontato, la soluzione adottata e i moduli
concretamente coinvolti. Tutti i pattern qui documentati sono realizzati nel codice del prodotto;
la sezione si chiude con quelli che non trovano applicazione, corredati della motivazione tecnica
che ne esclude l'adozione.

== Pattern architetturali

I pattern architetturali che governano la struttura complessiva del sistema sono già stati motivati
nelle sezioni precedenti e vengono qui richiamati per completezza:

- *Client-Server*: separazione tra il client React e il server Flask, entrambi eseguiti in locale come container distinti e coordinati da Docker Compose.
- *Layered Architecture*: organizzazione interna in livelli con dipendenza a senso unico, in sei livelli lato frontend e quattro lato backend.
- *REST stateless*: assenza di stato di sessione lato server; ogni richiesta contiene tutte le informazioni necessarie alla propria elaborazione.
- *Monolite containerizzato*: distribuzione come singolo backend e singolo frontend, in luogo di una scomposizione in servizi indipendenti.

== Pattern di progettazione adottati

=== Adapter

- *Problema*: la logica applicativa incontra in due punti un meccanismo tecnico la cui interfaccia è espressa nei termini della tecnologia e non in quelli del problema: la funzione `fetch` per il dialogo con il backend, la libreria di notifica per i messaggi all'utente. Se tali interfacce penetrassero nei service, ogni collaudo della logica applicativa richiederebbe un backend in esecuzione o un'interfaccia grafica montata, e la verifica dei casi di errore diventerebbe impraticabile.

- *Soluzione*: definire un'interfaccia stabile espressa nei termini del dominio applicativo e realizzarla con una classe che ne traduce le chiamate nell'interfaccia, incompatibile, del meccanismo sottostante.
- *Applicazione nel progetto*: il pattern è applicato a due confini tecnici del sistema.
  - `FetchApiClient` realizza l'interfaccia `ApiClientService`, che dichiara le operazioni `get`, `post`, `put` e `delete` tipizzate. Il metodo privato `request()` concentra la costruzione dell'indirizzo, la serializzazione del corpo e la traduzione degli esiti: un fallimento di rete e una risposta non riuscita diventano entrambi un `ApiError`, che espone il messaggio e lo stato numerico quando disponibile.
  - `NotificationManager` realizza l'interfaccia `NotificationService`, delegando alla libreria _react-hot-toast_ la gestione di coda, timer di scomparsa automatica e impilamento dei messaggi.
- *Conseguenze*: I test di `FetchApiClient` verificano il trattamento delle risposte di errore senza alcun backend in esecuzione. Da questo ne cosegue che ogni comunicazione con il backend deve transitare per `ApiClientService`. L'esportazione del decision tree, che allo stato attuale invoca `fetch` direttamente, dovrà essere ricondotta a tale regola.


=== Repository

- *Problema*: il catalogo dei decision tree è l'unico insieme di dati che il backend possiede e mette a disposizione dell'utente, e vi accede oggi leggendo file JSON dal filesystem. Se i service invocassero direttamente i moduli di accesso al filesystem, il criterio di reperimento dei dati risulterebbe disseminato in ogni punto che ne ha bisogno e la logica applicativa sarebbe collaudabile soltanto predisponendo file reali su disco a ogni esecuzione della suite, rendendo di fatto impraticabile la verifica dei casi di errore.

- *Soluzione*: interporre fra Application Layer e sorgente dei dati un'interfaccia che espone le operazioni sulla collezione di entità come se questa fosse disponibile in memoria, nascondendo al chiamante il meccanismo di accesso effettivo.
- *Applicazione nel progetto*: l'interfaccia astratta `IDecisionTreeRepository` dichiara i metodi `get()`, `save()`, `delete()` e `list()`; l'implementazione concreta `JsonDecisionTreeRepository` li realizza leggendo e scrivendo i file contenuti in `backend/data/decision_trees/`. Il `DecisionTreeService` riceve l'interfaccia nel costruttore e ignora completamente la natura della sorgente, tanto nel reperimento del singolo albero quanto nelle operazioni che percorrono l'intero catalogo, come la derivazione dei requisiti applicabili a un tipo di asset. Coerentemente con il principio selettivo enunciato in @principio-repository, questa è l'unica coppia interfaccia/implementazione del backend: Device e Asset non dispongono di un repository, non essendo collezioni possedute e servite dal server ma dati che l'utente porta al sistema e riporta via.
- *Conseguenze*: il beneficio è verificabile nel codice esistente, dove i test del `DecisionTreeService` sostituiscono l'implementazione concreta con la classe `FakeDecisionTreeRepository`, che realizza la medesima interfaccia mantenendo gli alberi in memoria e consente quindi di collaudare la logica applicativa senza alcun accesso al disco. L'interfaccia non è motivata dalla previsione di un archivio centralizzato — ipotesi esclusa dalla decisione VE-7.1 — bensì da questa verificabilità e dalla necessità, prevista dai casi d'uso di modifica del decision tree, di scrivere gli alberi su disco attraverso un unico punto di accesso.

=== Facade

- *Problema*: diverse operazioni che l'utente percepisce come unitarie sono in realtà sequenze articolate. L'importazione di un dispositivo da file richiede il riconoscimento del formato, la lettura asincrona tramite `FileReader`, l'interpretazione del contenuto, la validazione dello schema e infine l'invio al backend dei metadati del device e di ciascun asset. Esporre tale sequenza alle viste le legherebbe a dettagli estranei alla presentazione e ne impedirebbe il riuso da parte di viste diverse.

- *Soluzione*: raggruppare la sequenza dietro un'unica operazione di alto livello, espressa nel linguaggio del caso d'uso, che coordini internamente i collaboratori necessari.
- *Applicazione nel progetto*: lato client, `importDeviceFromFile(file)` racchiude l'intera sequenza di importazione e restituisce alla vista il solo esito. I custom hook assolvono la funzione analoga verso il Presentation Layer: `useSessionRunner()` coordina le fasi della valutazione guidata, il caricamento e l'idratazione dell'albero e la registrazione dell'esito, esponendo alla pagina soltanto lo stato e le azioni necessarie; `useResult()` e `useSessionModify()` operano allo stesso modo per la consultazione degli esiti e per la ripresa dei requisiti. Lato server, `DecisionTreeService.get_tree()` racchiude in una sola chiamata l'accesso al catalogo, la gestione dell'assenza del dato (`DecisionTreeNotFoundError`) e la normalizzazione dell'albero, mentre `create_device()` e `create_asset()` costituiscono il punto unico di validazione delle rispettive entità, condiviso dal percorso di creazione manuale e da quello di importazione.
- *Conseguenze*: pagine e rotte restano prive di logica applicativa e si limitano, rispettivamente, a renderizzare e a deserializzare, delegare e serializzare. L'unicità del punto di validazione evita che due percorsi diversi applichino allo stesso concetto regole divergenti.

=== Factory Method

- *Problema*: un'istanza di Flask creata come oggetto globale a livello di modulo verrebbe condivisa da tutti i test della suite, con il rischio concreto che configurazione e stato residuo si propaghino da un test al successivo, producendo esiti dipendenti dall'ordine di esecuzione. Un problema affine riguarda la costruzione delle entità di dominio a partire dal contenuto dei file di catalogo, dove la classe da istanziare dipende dal dato ricevuto.

- *Soluzione*: delegare a una funzione dedicata la costruzione dell'oggetto, invocabile più volte per ottenere istanze indipendenti, e concentrare in essa la decisione sulla classe concreta da istanziare.
- *Applicazione nel progetto*: `create_app()` costruisce e configura una nuova istanza di `Flask`, registrando i blueprint e i collaboratori. `create_decision_tree_blueprint(service)` e `create_assets_blueprint(service)` costruiscono i rispettivi blueprint a partire dal service ricevuto: la factory è impiegata esattamente dove un collaboratore deve essere iniettato, mentre il blueprint dei device, le cui rotte invocano direttamente le funzioni di validazione e non dipendono da alcun collaboratore costruito a runtime, è registrato senza factory. Sul versante del dominio, `normalize_tree()` costruisce l'entità `DecisionTree` a partire dal contenuto grezzo del file e delega a `_normalize_node()` la scelta fra `QuestionNode` e `LeafNode` in base al campo `type` del nodo.
- *Conseguenze*: ogni test dispone di un'istanza isolata dell'applicazione; `create_app()` è l'unico punto del backend in cui compaiono i nomi delle classi concrete, cosicché la direzione delle dipendenze è verificabile ispezionando un solo file; l'eventuale introduzione di una nuova tipologia di nodo, richiesta da un'evoluzione della norma, riguarderebbe la sola funzione `_normalize_node()`.

=== Observer

- *Problema*: lo stato condiviso fra più viste — il dispositivo in lavorazione, la sessione di valutazione, l'albero corrente — deve provocare l'aggiornamento dei soli componenti effettivamente interessati, senza che i moduli che modificano lo stato debbano conoscere i componenti che lo consumano.

- *Soluzione*: i consumatori si registrano presso il detentore dello stato, che notifica automaticamente ogni variazione ai soli osservatori interessati.
- *Applicazione nel progetto*: gli store Zustand `DeviceStore`, `SessionStore` e `TreeStore` costituiscono i soggetti osservati; i componenti si registrano tramite hook selettori, come `useSessionStore((state) => state.session)`, che circoscrivono la sottoscrizione alla sola porzione di stato utilizzata. Le modifiche avvengono unicamente attraverso le azioni tipizzate esposte da ciascuno store: `setDevice`, `updateDeviceDetails`, `addAsset`, `updateAsset` e `removeAsset` per `DeviceStore`; `start`, `ensureSession`, `resume`, `syncProgress`, `completeCurrent`, `select` e `reopen` per `SessionStore`; `loadTree`, `hydrate`, `answer`, `goBack` e `goForward` per `TreeStore`. Ciascuno store espone inoltre `reset`, che ne ripristina lo stato iniziale.
- *Conseguenze*: il flusso dei dati resta unidirezionale e ogni variazione di stato è riconducibile a un'azione esplicita e tracciabile. La suddivisione per area funzionale, in luogo di un unico store globale, estende allo stato condiviso la separazione delle responsabilità adottata a livello di moduli, mentre la granularità dei selettori evita i re-render indiscriminati. Gli store non sono del tutto indipendenti: `DeviceStore` invoca la reimpostazione di `SessionStore` quando il dispositivo viene sostituito o modificato, poiché una sessione di valutazione riferita a un dispositivo che non esiste più produrrebbe esiti privi di significato. Si tratta di una dipendenza deliberata e a senso unico, che realizza un vincolo di dominio anziché un accoppiamento accidentale.

=== Proxy

- *Problema*: il pattern risponde nel prodotto a due esigenze distinte, entrambe riconducibili al controllo dell'accesso a una risorsa. Da un lato l'albero decisionale di un requisito viene richiesto ripetutamente nel corso di una valutazione, mentre si tratta di dati di catalogo immutabili per l'intera durata della sessione. Dall'altro alcune pagine presuppongono l'esistenza di una sessione attiva e non possono essere raggiunte direttamente per indirizzo, pena l'accesso a una vista priva dei dati che le danno senso.

- *Soluzione*: interporre fra il chiamante e la risorsa un sostituto che ne espone la medesima interfaccia e ne governa l'accesso, aggiungendovi la conservazione del risultato oppure la verifica delle precondizioni.
- *Applicazione nel progetto*: nella variante con conservazione, `DecisionTreeService` avvolge le proprie chiamate in `queryClient.fetchQuery()`, che restituisce il risultato già ottenuto per la medesima chiave anziché ripetere la richiesta. La configurazione dichiara `staleTime` e `gcTime` illimitati e disabilita i ritentativi, coerentemente con la natura immutabile del dato: il proxy serve a non rileggere più volte lo stesso catalogo, non a compensare l'inaffidabilità della comunicazione. L'accesso alla rete continua ad avvenire tramite l'interfaccia `ApiClientService`, che il service riceve nel costruttore. Nella variante con verifica delle precondizioni, il componente `RequireSession` avvolge le pagine di esecuzione e di modifica della sessione: presenta al router la stessa interfaccia della pagina protetta e ne consente il rendering solo in presenza di una sessione, reindirizzando altrimenti alla pagina iniziale.
- *Conseguenze*: i service applicativi non contengono logica di conservazione dei risultati e le pagine non contengono controlli di accesso; entrambi i sostituti sono rimovibili senza modificare il codice che protegge. Si segnala che la conservazione dei risultati è utilizzata in modo imperativo e non attraverso gli hook della libreria: l'applicazione non monta alcun provider, e il proxy resta pertanto confinato all'Infrastructure Layer.

=== Strategy

- *Problema*: il dispositivo e i suoi asset devono poter essere scritti e riletti in formati diversi, oggi JSON e CSV. La decisione VE-7.1 accresce il peso di questa funzionalità: poiché i decision tree modificati non si sincronizzano fra le installazioni ma vengono esportati e distribuiti manualmente, i file di scambio sono il canale con cui gli utenti si trasmettono il lavoro svolto. Governare la varietà dei formati con una struttura condizionale interna al modulo di importazione ed esportazione comporterebbe di modificarlo a ogni nuova esigenza, con conseguente rischio di regressione sui formati già funzionanti.

- *Soluzione*: definire una famiglia di algoritmi intercambiabili dietro un'interfaccia comune e selezionare a runtime l'implementazione corrispondente al formato richiesto.
- *Applicazione nel progetto*: l'interfaccia `DeviceFileFormat` dichiara l'estensione, il tipo di contenuto e le due operazioni simmetriche `serialize(device)` e `parse(text)`; le implementazioni concrete `jsonDeviceFormat` e `csvDeviceFormat` le realizzano per i rispettivi formati, ciascuna con le proprie regole di interpretazione — nel caso del formato tabellare, l'intestazione attesa, la codifica dei campi contenenti separatori e la rappresentazione degli asset su righe successive. La funzione `formatForFile(file)` seleziona la strategia in base al file fornito dall'utente; `importDeviceFromFile()` e `exportDevice()` la utilizzano senza conoscerne l'implementazione.
- *Conseguenze*: l'aggiunta di un formato richiede la sola introduzione di una nuova implementazione dell'interfaccia, senza modifiche ai moduli chiamanti né alle viste, e ciascuna strategia è verificabile con unit test indipendenti dalle altre. 

== Tabella riassuntiva

#table(
  columns: (auto, auto, 1fr),
  align: (left, center, left),
  fill: (x, y) => if y == 0 { blue.lighten(70%) },
  [*Pattern*], [*Ambito*], [*Moduli coinvolti*],

  [Adapter], [Frontend],
  [`ApiClientService`/`FetchApiClient`, `NotificationService`/`NotificationManager`],

  [Repository], [Backend],
  [`IDecisionTreeRepository`, `JsonDecisionTreeRepository`, `DecisionTreeService`],

  [Facade], [Frontend, Backend],
  [`importDeviceFromFile()`, hook applicativi (`useSessionRunner`, `useResult`, `useSessionModify`), `DecisionTreeService`, `create_device()`, `create_asset()`],

  [Factory Method], [Backend],
  [`create_app()`, `create_decision_tree_blueprint()`, `create_assets_blueprint()`, `normalize_tree()`, `_normalize_node()`],

  [Observer], [Frontend],
  [`DeviceStore`, `SessionStore`, `TreeStore` e relativi hook selettori],

  [Proxy], [Frontend],
  [`queryClient` su `DecisionTreeService`, componente `RequireSession`],

  [Strategy], [Frontend],
  [`DeviceFileFormat`, `jsonDeviceFormat`, `csvDeviceFormat`, `formatForFile()`],
)

/* == Pattern non adottati

Si documentano di seguito i pattern del catalogo di riferimento che non trovano applicazione nel
prodotto, con la motivazione tecnica che ne esclude l'adozione.

- *Abstract Factory.* Il pattern risulterebbe giustificato in presenza di famiglie di oggetti correlati da costruire in modo coordinato, ad esempio qualora il sistema dovesse supportare più meccanismi di persistenza alternativi, ciascuno con il proprio insieme di collaboratori. Il backend prevede una sola famiglia di componenti e una sola sorgente dati, per cui il Factory Method già adottato è sufficiente e l'introduzione di una fabbrica astratta aggiungerebbe un livello di indirezione privo di variabilità da governare.

- *Builder.* Il candidato più prossimo è la costruzione della disposizione a grafo dell'albero decisionale, che a partire dalla struttura dei nodi produce un oggetto articolato in nodi posizionati, archi, numero di colonne e profondità. Tale costruzione conduce però a un'unica rappresentazione e non prevede alcuna variante: mancando una reale separazione fra processo e rappresentazione, un Director non avrebbe variabilità da coordinare, e una funzione pura assolve il compito in modo più diretto e più facilmente verificabile.

- *Command.* La navigazione all'indietro e la modifica delle risposte già fornite si presterebbero alla reificazione di ciascuna risposta in un oggetto dotato di operazione inversa. Il prodotto conserva invece la sola sequenza delle risposte unitamente a un cursore di posizione, ricalcolando il nodo corrente per riesecuzione del percorso a partire dalla radice, come realizzato dalla regola pura `resolveNodeId()`. Le risposte sono operazioni pure e prive di effetti collaterali, per cui la riesecuzione produce lo stesso risultato dell'annullamento, a fronte di una struttura più semplice e direttamente serializzabile nel file di sessione.

- *Composite.* L'albero decisionale si presterebbe per natura al pattern, con ciascun nodo domanda a contenere direttamente i propri successori e a essere trattato in modo uniforme e ricorsivo. Il prodotto adotta invece una rappresentazione piatta: `DecisionTree` conserva una lista di nodi e ogni nodo domanda referenzia i successori per identificatore, tramite il campo `branches`. La ragione decisiva è che rami distinti devono poter convergere sullo stesso nodo — situazione presente nei decision tree della norma — mentre una struttura di contenimento richiederebbe di duplicare il nodo condiviso in ciascun ramo che lo raggiunge, con il rischio che le due copie divergano. Vi si aggiungono due motivi pratici: la forma piatta coincide con quella dei file di catalogo e del contratto delle interfacce, evitando una conversione strutturale a ogni serializzazione, e la ricerca di un nodo per identificatore è un'operazione diretta, richiesta a ogni passo della navigazione e in fase di ripresa di una sessione. La navigazione, che nel Composite sarebbe delegata alla ricorsione, è di conseguenza affidata a regole pure — `get_node()` e `next_node_id()` lato server, `resolveNodeId()` e `currentOutcome()` lato client — verificabili in isolamento.

- *Decorator.* Il pattern consentirebbe di arricchire un oggetto di responsabilità aggiuntive mediante una classe che ne realizzi l'interfaccia delegando all'istanza decorata. Le due responsabilità trasversali presenti nel prodotto — la conservazione dei risultati e il controllo delle precondizioni di accesso — non aggiungono comportamento a un oggetto delegando a esso, ma ne governano l'accesso: la loro descrizione corretta è il Proxy, già adottato.

- *Iterator.* Un iteratore sulle coppie asset-requisito da valutare consentirebbe di nascondere ai moduli di esecuzione la struttura interna del piano di valutazione. Il piano prodotto da `buildPlan()` è tuttavia una lista percorsa per indice e per ricerca diretta, e i casi d'uso di ripresa e di modifica richiedono l'accesso a un elemento arbitrario, non il solo avanzamento sequenziale che l'interfaccia di un iteratore offrirebbe.

- *Singleton.* Le istanze del servizio dei decision tree e del gestore della conservazione dei risultati sono di fatto uniche, ottenute istanziandole una sola volta nel rispettivo modulo. Non si è tuttavia introdotto il controllo esplicito dell'istanziazione previsto dal pattern: esso attribuirebbe alla classe la responsabilità del proprio ciclo di vita, ostacolandone la sostituzione nei test, mentre l'unicità è già garantita dalla valutazione unica dei moduli. `DecisionTreeService` conserva infatti un costruttore che accetta un'implementazione alternativa di `ApiClientService`, proprietà che il pattern renderebbe inutilizzabile.

- *Template Method.* Il pattern consentirebbe di fattorizzare uno scheletro comune fra algoritmi affini. Il candidato più prossimo è il metodo privato che nel client di comunicazione concentra invio, traduzione degli errori e interpretazione della risposta per tutti i verbi supportati; si tratta però di una funzione di supporto invocata dai metodi pubblici, non di uno scheletro con passi ridefinibili da sottoclassi, e nel prodotto non esiste alcuna gerarchia di ereditarietà che ne giustifichi l'introduzione.

*/
= Tracciamento

== Stato dei requisiti funzionali

La tabella seguente riporta i requisiti funzionali individuati nell'#underline(text(fill: blue)[#link("https://coderiusgroup.github.io/Documentazione/docs/PB/Documenti/Esterni/Analisi_dei_Requisiti.pdf")[Analisi dei Requisiti]]) e il relativo stato di soddisfacimento rispetto alla progettazione descritta nel presente documento. I codici mantengono la classificazione per priorità adottata in sede di analisi: obbligatori (RF-Ob), desiderabili (RF-D) e opzionali (RF-Op).

#table(
  columns: (auto, 1fr, auto),
  align: (center, left, center),
  fill: (x, y) => if y == 0 { blue.lighten(70%) },
  table.header(
    [Codice], [Descrizione], [Stato],
  ),
  [RF-Ob01], [Il sistema deve permettere l'inserimento di un nuovo dispositivo all'interno della piattaforma.], [Soddisfatto],
  [RF-Ob02], [Il sistema deve permettere l'importazione di un dispositivo tramite un file di configurazione in formato JSON o CSV.], [Soddisfatto],
  [RF-Ob03], [Il sistema deve permettere la selezione del file sorgente per l'importazione del dispositivo.], [Soddisfatto],
  [RF-Ob04], [Il sistema deve supportare la selezione di un file in formato JSON come sorgente per l'importazione del dispositivo.], [Soddisfatto],
  [RF-Ob05], [Il sistema deve supportare la selezione di un file in formato CSV come sorgente per l'importazione del dispositivo.], [Soddisfatto],
  [RF-Ob06], [Il sistema deve verificare la validità strutturale e la conformità del file di configurazione caricato.], [Soddisfatto],
  [RF-Ob07], [Il sistema deve bloccare l'importazione e mostrare un messaggio di errore se il file ha un formato non valido.], [Soddisfatto],
  [RF-Ob08], [Il sistema deve permettere la creazione manuale di un nuovo dispositivo.], [Soddisfatto],
  [RF-Ob09], [Il sistema deve richiedere l'inserimento dei dati identificativi del dispositivo durante la creazione manuale.], [Soddisfatto],
  [RF-Ob10], [Il sistema deve permettere l'inserimento del nome identificativo del dispositivo.], [Soddisfatto],
  [RF-Ob11], [Il sistema deve permettere l'inserimento del sistema operativo del dispositivo.], [Soddisfatto],
  [RF-Ob12], [Il sistema deve permettere l'inserimento di una descrizione testuale del dispositivo.], [Soddisfatto],
  [RF-Ob13], [Il sistema deve validare i dati inseriti nei form e mostrare un errore in caso di campi vuoti o non conformi.], [Soddisfatto],
  [RF-Ob14], [Il sistema deve permettere la visualizzazione delle informazioni e dei dati relativi al dispositivo.], [Soddisfatto],
  [RF-Ob15], [Il sistema deve mostrare in dettaglio il nome del dispositivo registrato.], [Soddisfatto],
  [RF-Ob16], [Il sistema deve mostrare in dettaglio il sistema operativo del dispositivo registrato.], [Soddisfatto],
  [RF-Ob17], [Il sistema deve mostrare in dettaglio la descrizione del dispositivo registrato.], [Soddisfatto],
  [RF-Ob18], [Il sistema deve calcolare e mostrare lo stato aggregato di valutazione del dispositivo (non valutato, PASS, FAIL).], [Soddisfatto],
  [RF-Ob19], [Il sistema deve permettere l'esportazione di tutti i dati di un dispositivo in formato JSON o CSV.], [Soddisfatto],
  [RF-Ob20], [Il sistema deve consentire l'esportazione dei dati del dispositivo e degli asset associati in formato JSON.], [Soddisfatto],
  [RF-Ob21], [Il sistema deve consentire l'esportazione dei dati del dispositivo e degli asset associati in formato CSV.], [Soddisfatto],
  [RF-Ob22], [Il sistema deve permettere l'eliminazione definitiva di un dispositivo dal sistema.], [Soddisfatto],
  [RF-Ob23], [Il sistema deve consentire l'eliminazione diretta di un dispositivo senza effettuare il backup dei dati.], [Soddisfatto],
  [RF-Ob24], [Il sistema deve consentire l'eliminazione del dispositivo previa esportazione automatica di backup dei dati.], [Soddisfatto],
  [RF-Ob25], [Il sistema deve permettere l'inserimento di un nuovo asset all'interno di un dispositivo.], [Soddisfatto],
  [RF-Ob26], [Il sistema deve richiedere la compilazione dei dati dell'asset nel form di creazione.], [Soddisfatto],
  [RF-Ob27], [Il sistema deve permettere l'inserimento del nome dell'asset nel form di creazione.], [Soddisfatto],
  [RF-Ob28], [Il sistema deve permettere la selezione del tipo di asset tra Network, Security, Privacy e Financial.], [Soddisfatto],
  [RF-Ob29], [Il sistema deve permettere l'inserimento della descrizione dell'asset nel form di creazione.], [Soddisfatto],
  [RF-Ob30], [Il sistema deve permettere di impostare la sensibilità dell'asset.], [Soddisfatto],
  [RF-Ob31], [Il sistema deve permettere la visualizzazione della lista degli asset associati ad un determinato dispositivo.], [Soddisfatto],
  [RF-Ob32], [Il sistema deve mostrare le informazioni essenziali del singolo asset all'interno della lista.], [Soddisfatto],
  [RF-Ob33], [Il sistema deve mostrare il nome del singolo asset all'interno della lista.], [Soddisfatto],
  [RF-Ob34], [Il sistema deve mostrare il tipo del singolo asset all'interno della lista.], [Soddisfatto],
  [RF-Ob35], [Il sistema deve mostrare lo stato di valutazione del singolo asset all'interno della lista.], [Soddisfatto],
  [RF-Ob36], [Il sistema deve permettere la visualizzazione in dettaglio di tutte le informazioni di un singolo asset selezionato.], [Soddisfatto],
  [RF-Ob37], [Il sistema deve mostrare nel dettaglio il nome dell'asset selezionato.], [Soddisfatto],
  [RF-Ob38], [Il sistema deve mostrare nel dettaglio il tipo dell'asset selezionato.], [Soddisfatto],
  [RF-Ob39], [Il sistema deve mostrare nel dettaglio la descrizione dell'asset selezionato.], [Soddisfatto],
  [RF-Ob40], [Il sistema deve mostrare nel dettaglio il livello di sensibilità dell'asset selezionato.], [Soddisfatto],
  [RF-Ob41], [Il sistema deve mostrare lo stato complessivo di valutazione dell'asset selezionato.], [Soddisfatto],
  [RF-Ob42], [Il sistema deve mostrare la lista dei requisiti da valutare associati all'asset.], [Soddisfatto],
  [RF-Ob43], [Il sistema deve mostrare il codice identificativo e lo stato di valutazione di ogni requisito nella lista.], [Soddisfatto],
  [RF-Ob44], [Il sistema deve permettere l'eliminazione definitiva di un asset da un dispositivo.], [Soddisfatto],
  [RF-Ob45], [Il sistema deve permettere l'esecuzione di una sessione di valutazione di conformità per un dispositivo.], [Soddisfatto],
  [RF-Ob46], [Il sistema deve mostrare una dashboard di valutazione con la lista degli asset, il loro stato, e il progresso della sessione in tempo reale.], [Soddisfatto],
  [RF-Ob47], [Il sistema deve consentire la selezione e l'avvio della valutazione dei requisiti di un singolo asset.], [Soddisfatto],
  [RF-Ob48], [Il sistema deve mostrare il nome, il tipo, la descrizione, la sensibilità e lo stato di valutazione dell'asset selezionato per la valutazione.], [Soddisfatto],
  [RF-Ob49], [Il sistema deve mostrare la lista dei requisiti associati all'asset in valutazione.], [Soddisfatto],
  [RF-Ob50], [Il sistema deve mostrare, per ciascun requisito nella lista, il codice e lo stato di valutazione.], [Soddisfatto],
  [RF-Ob51], [Il sistema deve mostrare il codice e il nome del requisito selezionato prima dell'avvio dell'esecuzione del decision tree.], [Soddisfatto],
  [RF-Ob52], [Il sistema deve mostrare le dipendenze del requisito selezionato e il loro stato di valutazione prima dell'esecuzione.], [Soddisfatto],
  [RF-Ob53], [Il sistema deve guidare l'utente eseguendo il decision tree associato al requisito selezionato.], [Soddisfatto],
  [RF-Ob54], [Il sistema deve mostrare il codice univoco e il testo della domanda del nodo corrente dell'albero.], [Soddisfatto],
  [RF-Ob55], [Il sistema deve registrare la risposta dell'utente avanzandone il percorso sul grafo.], [Soddisfatto],
  [RF-Ob56], [Il sistema deve gestire la risposta affermativa ("Yes") spostando il flusso sul relativo ramo.], [Soddisfatto],
  [RF-Ob57], [Il sistema deve gestire la risposta negativa ("No") spostando il flusso sul relativo ramo.], [Soddisfatto],
  [RF-Ob58], [Il sistema deve visualizzare a schermo il grafo completo del decision tree durante l'esecuzione.], [Soddisfatto],
  [RF-Ob59], [Il sistema deve evidenziare graficamente nel grafo il nodo corrente e il percorso già intrapreso.], [Soddisfatto],
  [RF-Ob60], [Il sistema deve mostrare un nodo foglia al termine del percorso con l'esito (PASS, FAIL, NOT APPLICABLE).], [Soddisfatto],
  [RF-Ob61], [Il sistema deve generare un file JSON contenente lo stato della sessione di valutazione per il download.], [Soddisfatto],
  [RF-Ob62], [Il sistema deve permettere il caricamento di un file di sessione per riprendere un test interrotto.], [Soddisfatto],
  [RF-Ob63], [Il sistema deve mostrare una schermata finale con il riepilogo complessivo di tutti gli esiti del test.], [Soddisfatto],
  [RF-Ob64], [Il sistema deve mostrare per ogni asset la lista dei requisiti completati e il percorso logico seguito.], [Soddisfatto],
  [RF-Ob65], [Il sistema deve mostrare la sequenza ordinata di domande e risposte fornite per un requisito completato.], [Soddisfatto],
  [RF-Ob66], [Il sistema deve mostrare l'elenco dei decision tree disponibili.], [Soddisfatto],
  [RF-Ob67], [Il sistema deve mostrare l'ID e il nome del requisito per ogni decision tree in elenco.], [Soddisfatto],
  [RF-Ob68], [Il sistema deve permettere la visualizzazione in dettaglio di un decision tree esistente, mostrandone l'identificativo e il nome del requisito associato.], [Soddisfatto],
  [RF-Ob69], [Il sistema deve permettere all'utente di uscire anticipatamente da una sessione di valutazione in corso.], [Soddisfatto],
  [RF-Ob70], [Il sistema deve mostrare il riepilogo degli esiti per ogni singolo asset al termine del test.], [Soddisfatto],
  [RF-Ob71], [Il sistema deve permettere il salvataggio della sessione di valutazione in corso, generando un file con lo stato della sessione.], [Soddisfatto],
  [RF-Ob72], [Il sistema deve visualizzare il grafo del decision tree nel dettaglio, mostrando nodi interni, nodi foglia con esito e collegamenti fra nodi.], [Soddisfatto],
  [RF-Ob73], [Il sistema deve mostrare i nodi interni del grafo del decision tree, con il relativo codice univoco e il testo della domanda.], [Soddisfatto],
  [RF-Ob74], [Il sistema deve mostrare i nodi foglia del grafo del decision tree, con l'esito associato (PASS, FAIL, NOT APPLICABLE).], [Soddisfatto],
  [RF-Ob75], [Il sistema deve mostrare i collegamenti fra i nodi del grafo del decision tree, con l'etichetta Yes/No associata a ciascun ramo.], [Soddisfatto],
  [RF-Ob76], [Il sistema deve mostrare le dipendenze del decision tree, elencando i requisiti da cui esso dipende con il relativo codice.], [Soddisfatto],
  [RF-Ob77], [Il sistema deve permettere l'esportazione di un file di un decision tree in formato JSON o CSV.], [Soddisfatto],
  [RF-Ob78], [Il sistema deve consentire l'esportazione di un decision tree in formato JSON.], [Soddisfatto],
  [RF-Ob79], [Il sistema deve consentire l'esportazione di un decision tree in formato CSV.], [Soddisfatto],
  [RF-Ob80], [Il sistema deve generare un report di conformità finale contenente, per ogni coppia asset-requisito, l'esito del requisito, l'esito aggregato del decision tree e il percorso logico seguito.], [Non soddisfatto],
  [RF-D01], [Il sistema deve permettere l'annullamento della procedura di inserimento di un dispositivo, ripristinando lo stato precedente.], [Soddisfatto],
  [RF-D02], [Il sistema deve permettere l'annullamento della procedura di modifica di un dispositivo, scartando i dati inseriti e mantenendo invariati quelli preesistenti.], [Soddisfatto],
  [RF-D03], [Il sistema deve permettere l'annullamento della procedura di eliminazione di un dispositivo durante la fase di richiesta di conferma.], [Soddisfatto],
  [RF-D04], [Il sistema deve permettere l'annullamento della procedura di inserimento di un asset, ripristinando lo stato precedente.], [Soddisfatto],
  [RF-D05], [Il sistema deve permettere l'annullamento della procedura di modifica di un asset, scartando le modifiche non salvate.], [Soddisfatto],
  [RF-D06], [Il sistema deve permettere l'annullamento della procedura di eliminazione di un asset durante la fase di richiesta di conferma.], [Soddisfatto],
  [RF-D07], [Il sistema deve permettere la navigazione al nodo precedente del decision tree, mostrando la risposta già fornita senza invalidare le risposte successive.], [Soddisfatto],
  [RF-D08], [Il sistema deve permettere il salvataggio intermedio dello stato della sessione di valutazione.], [Soddisfatto],
  [RF-D09], [Il sistema deve permettere all'utente di navigare verso il nodo successivo precedentemente già risposto durante l'esecuzione del decision tree.], [Non soddisfatto],
  [RF-D10], [Il sistema deve permettere la modifica della risposta a un nodo già risposto, invalidando le risposte successive al nodo corrente.], [Soddisfatto],
  [RF-D11], [Il sistema deve permettere la modifica delle informazioni anagrafiche di un dispositivo esistente.], [Soddisfatto],
  [RF-D12], [Il sistema deve consentire la modifica del nome del dispositivo.], [Soddisfatto],
  [RF-D13], [Il sistema deve consentire la modifica del sistema operativo del dispositivo.], [Soddisfatto],
  [RF-D14], [Il sistema deve consentire la modifica della descrizione del dispositivo.], [Soddisfatto],
  [RF-D15], [Il sistema deve permettere la modifica delle informazioni di un asset esistente.], [Soddisfatto],
  [RF-D16], [Il sistema deve consentire la modifica del nome dell'asset.], [Soddisfatto],
  [RF-D17], [Il sistema deve consentire la modifica del tipo dell'asset tramite opzioni predefinite.], [Soddisfatto],
  [RF-D18], [Il sistema deve consentire la modifica della descrizione dell'asset.], [Soddisfatto],
  [RF-D19], [Il sistema deve consentire la modifica della sensibilità dell'asset.], [Soddisfatto],
  [RF-D20], [Il sistema deve permettere l'importazione e la validazione strutturale di un nuovo decision tree da file.], [Soddisfatto],
  [RF-D21], [Il sistema deve permettere la selezione del file sorgente per l'importazione di un decision tree.], [Soddisfatto],
  [RF-D22], [Il sistema deve supportare l'importazione di un decision tree da file in formato JSON.], [Soddisfatto],
  [RF-D23], [Il sistema deve supportare l'importazione di un decision tree da file in formato CSV.], [Soddisfatto],
  [RF-Op01], [Il sistema deve mostrare la notifica dell'avvenuto salvataggio intermedio della sessione di valutazione.], [Non soddisfatto],
  [RF-Op02], [Il sistema deve permettere l'aggiunta manuale di una dipendenza tra requisiti all'interno di un decision tree.], [Non soddisfatto],
  [RF-Op03], [Il sistema deve permettere la rimozione di una dipendenza tra requisiti da un decision tree.], [Non soddisfatto],
  [RF-Op04], [Il sistema deve bloccare l'aggiunta e notificare l'utente se il requisito selezionato crea una dipendenza circolare.], [Non soddisfatto],
  [RF-Op05], [Il sistema deve permettere l'aggiunta di un nuovo nodo all'interno di un decision tree.], [Non soddisfatto],
  [RF-Op06], [Il sistema deve permettere l'inserimento di un codice univoco per il nuovo nodo.], [Non soddisfatto],
  [RF-Op07], [Il sistema deve permettere l'inserimento del testo della domanda del nuovo nodo.], [Non soddisfatto],
  [RF-Op08], [Il sistema deve permettere l'eliminazione di un nodo esistente da un decision tree.], [Non soddisfatto],
  [RF-Op09], [Il sistema deve impedire la creazione di collegamenti duplicati mostrando una notifica di errore.], [Non soddisfatto],
  [RF-Op10], [Il sistema deve validare la struttura dell'albero modificato secondo i vincoli di consistenza predefiniti.], [Non soddisfatto],
  [RF-Op11], [Il sistema deve impedire il salvataggio e mostrare un errore se l'albero non è binario o mancano foglie PASS/FAIL.], [Non soddisfatto],
  [RF-Op12], [Il sistema deve impedire l'eliminazione del nodo radice di un decision tree mostrando un errore.], [Non soddisfatto],
  [RF-Op13], [Il sistema deve consentire l'eliminazione definitiva di un decision tree.], [Non soddisfatto],
  [RF-Op14], [Il sistema deve bloccare l'inserimento e mostrare un messaggio di errore se il codice del nodo è già presente nel decision tree.], [Non soddisfatto],
  [RF-Op15], [Il sistema deve permettere all'utente di assegnare un esito (PASS, FAIL o NOT APPLICABLE) ai rami non collegati di un nodo appena aggiunto o modificato nel decision tree, trasformandoli in nodi foglia.], [Non soddisfatto],
  [RF-Op16], [Il sistema deve assegnare l'esito PASS al ramo non collegato selezionato dall'utente, creando un nodo foglia PASS.], [Non soddisfatto],
  [RF-Op17], [Il sistema deve assegnare l'esito FAIL al ramo non collegato selezionato dall'utente, creando un nodo foglia FAIL.], [Non soddisfatto],
  [RF-Op18], [Il sistema deve assegnare l'esito NOT APPLICABLE al ramo non collegato selezionato dall'utente, creando un nodo foglia NOT APPLICABLE.], [Non soddisfatto],
  [RF-Op19], [Il sistema deve permettere l'annullamento delle modifiche effettuate su un decision tree, ripristinando lo stato iniziale del grafo.], [Non soddisfatto],
  [RF-Op20], [Il sistema deve permettere la modifica della destinazione di un collegamento tra nodi (Yes/No).], [Non soddisfatto],
  [RF-Op21], [Il sistema deve permettere la modifica strutturale di un decision tree esistente.], [Non soddisfatto],
  [RF-Op22], [Il sistema deve consentire il download del report di conformità in formato PDF.], [Non soddisfatto],
  [RF-Op23], [Il sistema deve consentire il download del report di conformità in formato JSON.], [Non soddisfatto],
  [RF-Op24], [Il sistema deve consentire il download del report di conformità in formato CSV.], [Non soddisfatto],
  [RF-Op25], [Il sistema deve mostrare la giustificazione testuale del risultato raggiunto al termine dell'esecuzione del decision tree.], [Non soddisfatto],
  [RF-Op26], [Il sistema deve permettere l'inserimento di una giustificazione testuale per l'esito della coppia asset-requisito al termine dell'esecuzione del decision tree.], [Non soddisfatto],
)


