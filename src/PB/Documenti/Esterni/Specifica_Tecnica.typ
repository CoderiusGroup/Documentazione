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
  #text(size: 20pt)[*Versione 0.6.0*]
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

L'Infrastructure Layer racchiude i dettagli tecnici dietro interfacce stabili usate dal layer applicativo. FetchApiClient realizza la comunicazione HTTP tramite fetch nativo, esposto ai service tramite l'interfaccia ApiClientService. Sopra questo livello, *TanStack Query* orchestra le chiamate al decision tree occupandosi di cache, retry e deduplica delle richieste, senza che i service debbano gestirle manualmente; una funzione di mapping degli errori converte i fallimenti di rete o di protocollo in errori applicativi tipizzati, in modo che il resto dell'applicazione non debba mai interpretare direttamente uno stato HTTP o un'eccezione di rete. In particolare, TanStack Query utilizza FetchApiClient tramite un adapter/fetcher dedicato: in questo modo la serializzazione dei payload e il mapping degli errori restano centralizzati nell'Infrastructure Layer.
NotificationManager realizza in modo analogo la consegna concreta delle notifiche dietro l'interfaccia NotificationService, appoggiandosi alla libreria *react-hot-toast* per la gestione di coda, timer di auto-dismiss e stacking dei messaggi. /*L'isolamento di questi dettagli in un layer separato consente di sostituire un'implementazione tecnica, ad esempio il client HTTP, senza modificare il layer applicativo che la utilizza.*/

==== Domain Layer

Il Domain Layer rappresenta il problema applicativo in modo indipendente da React, dal routing e dal backend. Le entità Device e Asset incapsulano i propri dati ed espongono metodi per la gestione degli asset e l'assegnazione dei requisiti, mantenendosi internamente coerenti; Node e DecisionTree offrono una rappresentazione tipizzata di domanda/foglia e dell'albero di valutazione, con una funzione di conversione esplicita dal payload restituito dal backend. Le regole pure treeRules determinano se un requisito è ancora riprendibile o va considerato concluso, mentre la validazione della struttura dei dati in ingresso è affidata a schemi *Zod*, così da individuare payload malformati prima che raggiungano il resto dell'applicazione.

=== Moduli applicativi del frontend /*Elementi costitutivi del frontend*/
Le sezioni precedenti hanno definito i livelli architetturali del frontend e le relative scelte
tecnologiche. Questa sezione ne descrive l'implementazione concreta: le pagine, gli hook, i service, gli store e le entità del, con ruolo e responsabilità di ciascun modulo.
==== Pagine dell'applicazione

Il Presentation Layer è composto da otto pagine, ciascuna corrispondente a un caso d'uso
specifico del flusso di valutazione, dalla creazione del device fino alla consultazione dei
risultati finali. Di seguito è riportato il ruolo di ciascuna pagina: 

- *HomeView*: permette di creare un nuovo device, caricarne uno esistente o riprendere una sessione di valutazione già avviata.

- *DeviceFormView*: raccolta e validazione dei dati descrittivi del device.
- *DeviceAssetManagementView*: gestione dell'elenco degli asset associati al device (aggiunta, modifica, rimozione).
- *AssetFormView*: creazione o modifica di un singolo asset e assegnazione dei requisiti EN 18031 da valutare.
- *DeviceSummaryView*: riepilogo di device e asset prima di avviare la valutazione.
- *SessionRunnerView*: presenta la domanda corrente del decision tree e gestisce la navigazione tra le risposte.
- *ModifySessionView*: permette di scegliere quale requisito/asset riprendere o rifare all'interno di una sessione in corso.
- *ResultView*: mostra i risultati aggregati della valutazione e ne consente l'esportazione.

#v(1em)
#figure(
  image("../../../images/specifica_tecnica/diagramma_pagine.png", width: 100%),
  caption: [Diagramma delle pagine],
)

== Dettaglio dei moduli applicativi del frontend

In questa sezione si documentano i moduli implementativi del frontend, partendo dalle viste reali fino ai servizi e al modello di dominio. L'intento è mostrare come l'architettura a livelli si traduce in elementi concreti dell'applicazione.

=== Viste dell'applicazione

Le viste corrispondono ai casi d'uso principali e sono rese esplicite con i nomi delle pagine.

- *HomeView*: ingresso dell'applicazione e scelta tra nuovo dispositivo, importazione da JSON e ripresa di una sessione salvata.
- *DeviceFormView*: inserimento dei metadati del dispositivo.
- *DeviceAssetManagementView*: gestione della lista degli asset associati e visualizzazione dello stato di valutazione.
- *AssetFormView*: creazione o modifica di un asset e assegnazione dei requisiti EN 18031.
- *DeviceSummaryView*: riepilogo dei dati del dispositivo e degli asset prima dell'avvio della valutazione.
- *SessionRunnerView*: esecuzione guidata del decision tree, con presentazione della domanda corrente e raccolta delle risposte.
- *ModifySessionView*: selezione del requisito o dell'asset da riprendere o rivalutare nella sessione in corso.
- *ResultView*: consultazione degli esiti finali e avvio dell'esportazione del report.

Componenti riutilizzabili:

- *Esito*: etichetta che rappresenta lo stato di valutazione con un codice colore.
- *GrafoDecisionTree*: visualizzazione dell'albero decisionale per un requisito.

=== Orchestrazione applicativa

La logica operativa è gestita da hook e service che coordinano i casi d'uso senza disperdere la complessità nelle viste.

- Gli *hook applicativi* espongono lo stato e le azioni necessarie alle viste; tradiscono così solo ciò che serve per il rendering e l'interazione.
- I *service applicativi* centralizzano le operazioni trasversali:
  - *DeviceService*: crea, aggiorna e persiste device e asset.
  - *SessionService*: avvia e gestisce la sessione di valutazione, registra risposte e abilita la ripresa.
  - *DecisionTreeService*: carica gli alberi decisionali, ne normalizza la struttura e mette a disposizione le regole di navigazione tra i nodi.
  - *ExportService*: produce i dati pronti per l'esportazione in JSON, PDF.

Questi service si appoggiano alle astrazioni tecniche dell'Infrastructure Layer per le chiamate al backend e la consegna delle notifiche.

=== Stato applicativo

Lo stato condiviso è suddiviso su store distinti, uno per ciascuna area funzionale.

- *DeviceStore*: mantiene il device in lavorazione e i relativi asset.
- *SessionStore*: mantiene la sessione attiva, il requisito corrente, il percorso svolto e l'avanzamento.
- *TreeStore*: conserva i dati dei decision tree e la rappresentazione dell'albero in uso.
- *ResultStore*: contiene gli esiti aggregati della valutazione e i dati per l'esportazione.
- *UIStore*: gestisce lo stato di presentazione, come notifiche e indicatori di caricamento.

Ogni store espone hook selettori dedicati, in modo che gli strati superiori leggano lo stato senza dipendere dalla sua struttura interna.

=== Modello di dominio e validazione

Il dominio applicativo è rappresentato da entità indipendenti dall'interfaccia e dalla persistenza.

- *Device*: rappresenta il dispositivo e aggrega gli asset.
- *Asset*: rappresenta un bene da valutare, con metadati e requisiti assegnati.
- *DecisionTree* e *Node*: rappresentano l'albero decisionale e i suoi nodi di domanda o foglia.
- *Result*: rappresenta l'esito di conformità per requisito e asset.

La validazione dei dati in ingresso, sia quelli raccolti dall'utente sia quelli ricevuti dal backend, è delegata a schemi *Zod*.

Le regole pure di decisione (*treeRules*) definiscono quando un requisito è ancora riprendibile, quando un ramo si conclude e quale esito applicare a una foglia.

=== Dettagli infrastrutturali

L'Infrastructure Layer isola i meccanismi tecnici dal comportamento dell'applicazione.

- *FetchApiClient* / *ApiClientService*: eseguono le chiamate HTTP verso il backend, serializzano i payload JSON e convertono gli errori di rete in errori applicativi tipizzati.
- *TanStack Query*: gestisce fetch, cache, retry e deduplica delle richieste per i dati dei decision tree.
- *NotificationManager* / *NotificationService*: consegnano messaggi all'utente tramite `react-hot-toast`.

Questa separazione consente di sostituire l'implementazione HTTP o il sistema di notifiche senza modificare il comportamento delle viste e dei service.

=== Flussi applicativi principali

I moduli del frontend collaborano nei flussi end-to-end principali:

- *Nuova valutazione*: HomeView → DeviceFormView → DeviceAssetManagementView → AssetFormView → DeviceSummaryView. Il DeviceService costruisce il modello del dispositivo, il DeviceStore mantiene l'elenco degli asset e il frontend verifica la completezza dei dati prima di procedere.
- *Importazione di un dispositivo*: HomeView carica un JSON, il servizio di importazione valida il payload con Zod e popola il DeviceStore prima di passare al riepilogo.
- *Avvio della valutazione*: DeviceSummaryView attiva il SessionService, che crea la sessione e carica il decision tree iniziale tramite DecisionTreeService.
- *Esecuzione del decision tree*: SessionRunnerView presenta la domanda corrente, raccoglie la risposta `yes`/`no` e delega al SessionService l'aggiornamento dello stato e la scelta del nodo successivo.
- *Ripresa/modifica di sessione*: ModifySessionView legge il SessionStore e permette di selezionare il requisito o l'asset da rivalutare; il SessionService applica le modifiche senza invalidare l'intera sessione.
- *Esportazione dei risultati*: ResultView utilizza l'ExportService per generare i file scaricabili a partire dai dati del ResultStore.

Questa organizzazione mantiene il frontend modulare e facilmente estendibile: nuove viste o requisiti EN 18031 possono essere introdotti estendendo i moduli del dominio e dei service senza riprogettare l'intera applicazione.


=== Componenti principali e flussi

Al fine di garantire la manutenibilità del codice e una chiara separazione delle responsabilità, il flusso dei dati all'interno del frontend segue un approccio rigorosamente *unidirezionale*. Le pagine e i componenti di presentazione non modificano mai direttamente lo stato globale né comunicano direttamente con il backend, ma si affidano a un ciclo di interazione standardizzato basato su tre attori principali: le *Viste* (Presentation Layer), gli *Hook/Service* (Application Layer) e gli *Store* (State Management).

Il flusso tipico per l'esecuzione di un'operazione di business si articola nei seguenti step:
+ *Innesco (Trigger):* L'utente interagisce con la UI (es. preme un pulsante per rispondere a una domanda del decision tree). La vista cattura l'evento e invoca il metodo esposto dal custom hook applicativo (es. `useSessionRunner`).
+ *Orchestrazione:* L'hook delega la logica di business al servizio di competenza (es. `SessionService`).
+ *Comunicazione asincrona:* Il servizio, tramite l'Infrastructure Layer (`ApiClientService`), inoltra la richiesta HTTP al backend.
+ *Mutazione dello stato:* Al ricevimento di una risposta positiva dal server, il servizio invoca le azioni tipizzate degli store Zustand (es. `SessionStore.updateCurrentNode()`) per aggiornare lo stato locale in base ai nuovi dati.
+ *Reattività:* Gli store notificano automaticamente i componenti React in ascolto, innescando il re-render della UI con i dati aggiornati (es. mostrando la domanda successiva).

Di seguito viene illustrato il diagramma di sequenza relativo al flusso critico di *Avanzamento nell'Albero Decisionale*, che rappresenta il cuore del processo di valutazione della conformità EN 18031.

#v(1em)

#figure(
  image("../../../images/specifica_tecnica/seq_avanzamento_albero.png", width: 120%),
  caption: [Diagramma delle pagine],
)

#v(1em)

Questo pattern architetturale, oltre a disaccoppiare la logica visiva da quella applicativa, garantisce che lo stato del client (gestito da Zustand) e lo stato del server (gestito dal backend Flask) rimangano costantemente sincronizzati, centralizzando la gestione degli errori e del caricamento (loading state) all'interno dell'Application Layer.


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

= Tracciamento

