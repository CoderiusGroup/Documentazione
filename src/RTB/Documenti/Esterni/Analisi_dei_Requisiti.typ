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
  #text(size: 20pt)[*Versione 0.1.2*]
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
    [0.1.4], [2026/04/24], [Bronte Giovanni], [],[Integrazione casi d'uso: da UC-2 a UC-7 e UC-17 con le appropriate sottosezioni e diagrammi UML. Modificate le numerazioni di vari use case  assieme ai loro diagrammi UML in modo da essere più coerenti.],
    [0.1.3], [2026/04/21], [Bronte Giovanni], [Filippo Zonta Rocha],[Integrazione casi d'uso: UC9 a UC13],
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
- al *committente*, che può verificare la corretta interpretazione delle esigenze espresse;
- al *team di sviluppo*, per il quale rappresenta una guida operativa durante la realizzazione del sistema;
- al *team di verifica*, che utilizzerà le informazioni contenute per definire i criteri di validazione e accertare la conformità del prodotto ai requisiti stabiliti.\
In considerazione della natura incrementale del processo di sviluppo adottato, il documento sarà soggetto a revisioni periodiche, al fine di recepire eventuali aggiornamenti o modifiche dei requisiti.

== Glossario
#align(center)[
_(Da aggiungere quando si inizierà la stesura)_
]

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

Il sistema si basa sull’utilizzo di *decision tree* che guidano l’utente attraverso una sequenza strutturata di domande, al fine di valutare l’implementazione di specifici meccanismi di sicurezza, quali autenticazione e controllo degli accessi. Tali verifiche consentono di determinare se il dispositivo analizzato soddisfa i requisiti previsti dalla normativa.

Il contesto di applicazione è quello dei *dispositivi IoT* e delle apparecchiature radio connesse, che devono rispettare i requisiti introdotti dalla direttiva RED in ambito di sicurezza informatica. In questo scenario, la complessità e la natura interconnessa dei requisiti rendono difficoltosa una valutazione manuale da parte dell'utente finale.

L’applicazione nasce quindi con l’obiettivo di semplificare il processo di analisi, offrendo uno strumento dedicato che consenta di:
- identificare i requisiti applicabili;
- guidare l’utente nella valutazione tramite decision tree;
- fornire un esito finale di conformità (*PASS, FAIL, NOT APPLICABLE*).

Il sistema si propone di rendere il processo di verifica più strutturato, tracciabile e accessibile, supportando sia utenti esperti sia utenti con conoscenze limitate del dominio normativo.

== Funzionalità
#v(1em)
Il prodotto da realizzare deve fornire un insieme di *funzionalità* volte a supportare l’utente nel processo di *verifica della conformità* ai requisiti dello standard *EN 18031*, garantendo un’interazione *semplice* e *guidata*.

In particolare, il sistema dovrà consentire:

- la possibilità di *importare* o *inserire i dati* relativi al dispositivo da analizzare, necessari per l’avvio del processo di verifica;

- la possibilità di *individuare* e *selezionare i requisiti applicabili* in base alle caratteristiche del sistema in esame;

- la possibilità di *navigare* in modo chiaro e strutturato all’interno dei *decision tree* associati ai requisiti, seguendo un percorso guidato basato su domande;

- la possibilità di *visualizzare in tempo reale* lo stato della verifica e il percorso seguito all’interno del decision tree;

- la possibilità di ottenere un *esito finale* per ciascun requisito analizzato, espresso in termini di *PASS*, *FAIL* o *NOT APPLICABLE*;

- la possibilità di *consultare* e *riesaminare le risposte* fornite, al fine di comprendere e giustificare il risultato ottenuto;

Il sistema dovrà inoltre garantire un’esperienza d’uso *fluida* e *intuitiva*, facilitando la comprensione dei requisiti anche da parte di utenti *non esperti* del dominio normativo e supportando efficacemente l’intero processo di valutazione.

== Classificazione degli utenti
Gli utenti del sistema possono essere classificati in base al livello di competenze tecniche e alla familiarità con il dominio della sicurezza informatica e delle normative europee.

La categoria principale di riferimento è costituita da *utenti esperti*, quali professionisti del settore della cybersecurity, consulenti o tecnici coinvolti nei processi di verifica della conformità normativa.

Il sistema può essere utilizzato anche da utenti con competenze tecniche *intermedie*, che pur non avendo una conoscenza approfondita della normativa, con l’applicazione viene fornito un supporto guidato attraverso l’utilizzo di _decision tree_, semplificando il processo di verifica.

= Casi d'Uso

== Introduzione
#v(1em)
La presente sezione descrive i casi d'uso del sistema *Automated EN18031
Compliance Verification*, identificando le interazioni tra gli attori esterni
e il sistema al fine di soddisfare i requisiti funzionali definiti nel
capitolo precedente.

Il sistema ha lo scopo di guidare l'utente nella valutazione di conformità
di un dispositivo radio ai requisiti della norma EN 18031, con particolare
riferimento ai meccanismi di controllo accessi (ACM) e autenticazione (AUM).

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

== UC-1 : Importazione del documento di configurazione del dispositivo
#v(1em)

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente dispone di un file di configurazione del dispositivo in un formato supportato (es. CSV, XML, JSON). \

- *Postcondizioni:* Il sistema ha acquisito le informazioni relative al dispositivo e le rende disponibili per il processo di verifica. \

- *Scenario principale:*
 + L'utente accede alla funzionalità di importazione.
 + L'utente seleziona o trascina il file di configurazione.
 + Il sistema valida il formato e la struttura del file.
 + Il sistema acquisisce le informazioni sul dispositivo (asset, interfacce, configurazioni di rete).
 + Il sistema conferma l'avvenuta importazione e mostra un riepilogo delle informazioni caricate.

*Scenari alternativi:*
- *1a.* Il file non rispetta il formato atteso: il sistema notifica l'errore e
  richiede all'utente di fornire un file valido.

#figure(
  image("../../../images/diagrammiUML/UC-1(modificato).png", width: 90%),
  caption: [UC-1 : Importazione del documento di configurazione del dispositivo]
)

#v(2em)
#pagebreak()

== UC-2: Formato file non valido

- *Attori coinvolti*: Utente
- *Precondizioni*: 
+ Il sistema è attivo
+ L'utente sta inserendo un nuovo dispositivo
- *Postcondizioni*: 
+ L'inserimento del file di configurazione del dispositivo è stato annullato.
+ L'utente ha visualizzato un messaggio di errore mostrato dal sistema.
- *Scenario principale*: 
+ L'utente inserisce un file con un formato non valido.
+ Il sistema mostra un messaggio di errore.

#figure(
  image("../../../images/diagrammiUML/UC-2.png", width: 50%),
  caption: [UC-2: Formato file non valido]
)

#pagebreak()

== UC-3: Annullamento di importazione del documento di configurazione del dispositivo

- *Attori coinvolti*: Utente
- *Precondizioni*: 
+ Il sistema è attivo
+ L'utente sta inserendo un nuovo dispositivo
- *Postcondizioni*: L'inserimento del file di configurazione del dispositivo è stato annullato
- *Scenario principale*: L'utente seleziona la funzionalità di annullamento dell'inserimento del dispositivo.

#figure(
  image("../../../images/diagrammiUML/UC-3(modificato).png", width: 50%),
  caption: [UC-2: Formato file non valido]
)

#pagebreak()

== UC-4 : Aggiunta nuova dispositivo manuale
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* Il sistema è attivo. \

- *Postcondizioni:* Il sistema ha aggiunto un nuovo dispositivo. \

- *Scenario principale:*
 + L'utente sceglie l'opzione di aggiungere un nuovo dispositivo alla lista.
 + L'utente inserisce un nome per il nuovo dispositivo.
 + L'utente inserisce un sistema operativo per il dispositivo.
 + L'utente inserisce una descrizione per il dispositivo.
 + Il sistema aggiunge alla lista di dispositivi il nuovo dispositivo.

*Scenari alternativi:*
- L'utente annulla l'aggiunta di un nuovo dispositivo.

#figure(
  image("../../../images/diagrammiUML/UC-4.png", width: 100%),
  caption: [UC-4 : Aggiunta nuova dispositivo manuale]
)


=== UC-4.1: Inserimento nome dispositivo
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di aggiunta nuovo dispositivo manualmente. \

- *Postcondizioni:* Il sistema ha aggiunto il nome del dispositivo. \

- *Scenario principale:*
 + L'utente inserisce un nome per il nuovo dispositivo.

*Scenari alternativi:*
- L'utente annulla l'aggiunta di un nome per il dispositivo.

=== UC-4.2: Inserimento sistema operativo del dispositivo
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di aggiunta nuovo dispositivo manualmente. \

- *Postcondizioni:* Il sistema ha aggiunto il sistema operativo del dispositivo. \

- *Scenario principale:*
 + L'utente inserisce un sistema operativo per il nuovo dispositivo.

*Scenari alternativi:*
- L'utente annulla l'aggiunta di un sistema operativo per il dispositivo.

=== UC-4.3: Inserimento descrizione del dispositivo
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha scelto l'opzione di aggiunta nuovo dispositivo manualmente. \

- *Postcondizioni:* Il sistema ha aggiunto una descrizione del dispositivo. \

- *Scenario principale:*
 + L'utente inserisce una descrizione per il nuovo dispositivo.

*Scenari alternativi:*
- L'utente annulla l'aggiunta di una descrizione per il dispositivo.


#pagebreak()

== UC-5 : Scelta di modalità per selezione requisiti da applicare
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ Il documento di configurazione del dispositivo è stato importato (UC-1). 
+ I decision tree sono stati caricati (UC-2). \

- *Postcondizioni:* L'utente ha selezionato che modalità usare per scegliere l'insieme di requisiti da verificare per il dispositivo in esame. \

- *Scenario principale:*
 + Il sistema presenta una scelta tra selezione dei requisiti manuale o tramite domande
 + L'utente sceglie una delle due opzioni.

#figure(
  image("../../../images/diagrammiUML/UC-5.png", width: 70%),
  caption: [UC-5 : Scelta di modalità per selezione requisiti da applicare]
)

=== UC-5.1 : Selezione dei requisiti applicabili manuale
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* La modalità per la selezione del requisiti è stata scelta.\

- *Postcondizioni:* L'utente ha selezionato l'insieme di requisiti da verificare per il dispositivo in esame. \

- *Scenario principale:*
 + Il sistema presenta l'elenco dei requisiti disponibili, suddivisi per
  categoria (es. ACM — Access Control Mechanism, AUM — Authentication
  Mechanism).
 + L'utente visualizza le descrizioni dei requisiti.
 + L'utente seleziona i requisiti da sottoporre a verifica.
 + Il sistema conferma la selezione e prepara il percorso di verifica.


#v(2em)

=== UC-5.2 : Selezione dei requisiti applicabili tramite domande
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* La modalità per la selezione del requisiti è stata scelta. \

- *Postcondizioni:* Il sistema ha selezionato l'insieme di requisiti da verificare per il dispositivo in esame. \

- *Scenario principale:*
 + Il sistema presenta una serie di domande per l'utente
 + L'utente visualizza e risponde in modo appripriato alle domande.
 + Il sistema seleziona i requisiti da sottoporre a verifica in base alle risposte fornite.
 + Il sistema conferma la selezione e prepara il percorso di verifica.


#v(2em)

== UC-6 : Annulla inserimento dispositivo
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha selezionato l'opzione di aggiunta di un dispositivo.\

- *Postcondizioni:* Il sistema ha annullato l'inserimento del dispositivo. \

- *Scenario principale:*
+ L'utente seleziona il pulsante di annullamento dell'inserimento del dispositivo.
+ Il sistema scarta i dati del dispositivo.

#figure(
  image("../../../images/diagrammiUML/UC-6.png", width: 60%),
  caption: [UC-6 : Importazione del file di definizione dei decision tree]
)

#pagebreak()

== UC-7 : Elimina dispositivo
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha selezionato l'opzione di eliminazione di un dispositivo.\

- *Postcondizioni:* Il sistema ha rimosso i dati del dispositivo scelto. \

- *Scenario principale:*
+ L'utente seleziona quale dispositivo eliminare.
+ Il sistema rimuove i dati del dispositivo scelto.

#figure(
  image("../../../images/diagrammiUML/UC-7.png", width: 50%),
  caption: [UC-7 : Elimina dispositivo]
)

#pagebreak()

== UC-8 : Visualizzazione dello stato di avanzamento della verifica
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* È in corso almeno una sessione di verifica. \

- *Postcondizioni:* L'utente ha preso visione dello stato corrente del percorso di verifica. \

- *Scenario principale:*
 + In qualsiasi momento durante la navigazione del decision tree, il sistema
  mostra una rappresentazione visiva del percorso percorso e del nodo
  corrente.
 + L'utente può visualizzare le domande già risposte e le risposte fornite.
 + Il sistema indica quanti requisiti sono stati completati e quanti sono
  ancora in attesa.

#figure(
  image("../../../images/diagrammiUML/UC-8.png", width: 60%),
  caption: [UC-8 : Visualizzazione dello stato di avanzamento della verifica]
)

#v(2em)
#pagebreak()

== UC-9 : Visualizzazione della dashboard dei risultati
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* Almeno un requisito ha ricevuto un esito (UC-4). \

- *Postcondizioni:* L'utente ha consultato il riepilogo degli esiti dei requisiti verificati. \

- *Scenario principale:*
 + L'utente accede alla dashboard.
 + Il sistema mostra per ciascun requisito verificato l'esito ottenuto
  (*PASS*, *FAIL* o *NOT APPLICABLE*).
 + L'utente può selezionare un singolo requisito per visualizzare il
  dettaglio del percorso seguito nel decision tree e le risposte fornite.

#figure(
  image("../../../images/diagrammiUML/UC-9.png", width: 45%),
  caption: [UC-9 : Visualizzazione della dashboard dei risultati]
)

#v(2em)
#pagebreak()

== UC-10 : Riesame delle risposte fornite
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* Un requisito ha già ricevuto un esito. \

- *Postcondizioni:* L'utente ha consultato o modificato le risposte fornite durante la verifica di un requisito. \

- *Scenario principale:*
 + Dalla dashboard o dal dettaglio di un requisito, l'utente richiede il
  riesame delle risposte.
 + Il sistema mostra la sequenza di domande e risposte registrate per quel
  requisito.
 + L'utente può modificare una risposta precedente.
 + Il sistema ricalcola l'esito del requisito a partire dal nodo modificato.

#figure(
  image("../../../images/diagrammiUML/UC-10.png", width: 70%),
  caption: [UC-10 : Riesame delle risposte fornite]
)

#pagebreak()

== UC-11 : Esportazione dei risultati
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* Almeno un requisito ha ricevuto un esito. \

- *Postcondizioni:* Il sistema ha prodotto e reso disponibile all'utente un file contenente i risultati della verifica. \

- *Scenario principale:*
 + L'utente richiede l'esportazione dei risultati.
 + L'utente seleziona il formato desiderato (es. PDF, CSV, JSON, XML).
 + Il sistema genera il file con l'elenco dei requisiti, gli esiti e le
  relative giustificazioni.
 + Il sistema mette a disposizione il file per il download.

#figure(
  image("../../../images/diagrammiUML/UC-11.png", width: 70%),
  caption: [UC-11 : Esportazione dei risultati]
)


#pagebreak()

== UC-12: Inserisci asset
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha inserito il documento di configurazione del dispositivo. \

- *Postcondizioni:* Il sistema ha aggiunto un nuovo asset alla lista di assets. \

- *Scenario principale:*
+ L'utente inserisce il nome dell'asset.
+ L'utente inserisce il tipo di asset.
+ L'utente inserisce una descrizione per l'asset.

- *Scenari alternativi:* 
+ L'utente annulla l'inserimento dell'asset.
+ L'utente inserisce un asset con il tipo sbagliato

#figure(
  image("../../../images/diagrammiUML/UC-12.png", width: 70%),
  caption: [UC-12 : Inserisci asset]
)

=== UC-12.1: Inserisci nome asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha inserito il documento di configurazione del dispositivo. \

- *Postcondizioni:* Il sistema ha aggiunto un nome al nuovo asset. \

- *Scenario principale:*
+ L'utente inserisce il nome dell'asset.

- *Scenari alternativi:* 
+ L'utente annulla l'inserimento dell'asset.
+ L'utente annulla l'inserimento del nome dell'asset.

#figure(
  image("../../../images/diagrammiUML/UC-12.1.png", width: 70%),
  caption: [UC-12.1 : Inserisci nome asset]
)

=== UC-12.2: Inserisci tipo asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha inserito il documento di configurazione del dispositivo. \

- *Postcondizioni:* Il sistema ha aggiunto un tipo al nuovo asset. \

- *Scenario principale:*
+ L'utente inserisce il tipo dell'asset.

- *Scenari alternativi:* 
+ L'utente annulla l'inserimento dell'asset.
+ L'utente annulla l'inserimento del tipo dell'asset.
+ L'utente inserisce un tipo di asset non valido per l'asset messo.

- *Specializzazioni:*
- UC-9.2.1
- UC-9.2.2
- UC-9.2.3
- UC-9.2.4

#figure(
  image("../../../images/diagrammiUML/UC-12.2.png", width: 70%),
  caption: [UC-12.2 : Inserisci tipo asset]
)

==== UC-12.2.1: Seleziona network asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica o inserisci asset.\

- *Postcondizioni:* Il sistema ha modificato il tipo di asset. \

- *Scenario principale:*
+ L'utente seleziona network asset.

==== UC-12.2.2: Seleziona security asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica o inserisci asset.\

- *Postcondizioni:* Il sistema ha modificato il tipo di asset. \

- *Scenario principale:*
+ L'utente seleziona security asset.

==== UC-12.2.3: Seleziona privacy asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica o inserisci asset.\

- *Postcondizioni:* Il sistema ha modificato il tipo di asset. \

- *Scenario principale:*
+ L'utente seleziona privacy asset.

==== UC-12.2.4: Seleziona financial asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica o inserisci asset.\

- *Postcondizioni:* Il sistema ha modificato il tipo di asset. \

- *Scenario principale:*
+ L'utente seleziona financial asset.

=== UC-12.3: Inserisci descrizione asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha inserito il documento di configurazione del dispositivo. \

- *Postcondizioni:* Il sistema ha aggiunto una descrizione al nuovo asset. \

- *Scenario principale:*
+ L'utente inserisce una descrizione per l'asset.

#figure(
  image("../../../images/diagrammiUML/UC-9.3.png", width: 70%),
  caption: [UC-12.3 : Inserisci descrizione asset]
)

#pagebreak()

== UC-13: Annulla inserimento asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ L'utente ha inserito il documento di configurazione del dispositivo. 
+ L'utente ha aggiunto un asset tramite un documento o tramite tasto di aggiunta di un asset.\

- *Postcondizioni:* Il sistema ha annullato l'inserimento dell'asset. \

- *Scenario principale:*
+ L'utente preme il tasto di annullamento di inserimento dell'asset.

#figure(
  image("../../../images/diagrammiUML/UC-13.png", width: 70%),
  caption: [UC-13 : Annulla inserimento asset]
)

#pagebreak()

== UC-14: Elimina Asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ L'utente ha inserito il documento di configurazione del dispositivo.
+ L'utente ha inserito almeno un asset\

- *Postcondizioni:* L'utente ha eliminato un asset. \

- *Scenario principale:*
+ L'utente seleziona uno degli asset inseriti precedentemente per eliminarlo.
+ Il sistema mostra un avviso.
+ L'utente conferma l'eliminazione dell'asset.
+ Il sistema elimina l'asset selezionato.

#figure(
  image("../../../images/diagrammiUML/UC-14.png", width: 70%),
  caption: [UC-14 : Elimina asset]
)

#pagebreak()

== UC-15: Modifica Asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ L'utente ha inserito il documento di configurazione del dispositivo.
+ L'utente ha inserito almeno un asset\

- *Postcondizioni:* L'utente ha modificato un asset. \

- *Scenario principale:*
+ L'utente seleziona uno degli asset inseriti precedentemente per modificarlo.
+ L'utente modifica il nome dell'asset.
+ L'utente modifica il tipo di asset.
+ L'utente modifica la descrizione dell'asset.

#figure(
  image("../../../images/diagrammiUML/UC-15.png", width: 70%),
  caption: [UC-15 : Visualizza dati dispositivo]
)

=== UC-15.1: Modifica nome asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica di un asset.\

- *Postcondizioni:* L'utente ha modificato il nome di un asset. \

- *Scenario principale:*
+ L'utente modifica il nome di un asset.

=== UC-15.2: Modifica tipo asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica di un asset.\

- *Postcondizioni:* L'utente ha modificato il tipo di un asset. \

- *Scenario principale:*
+ L'utente modifica il tipo di un asset.

- *Scenari alternativi:*
+ L'utente modifica il tipo di un asset in un tipo non valido

=== UC-15.3: Modifica descrizione asset

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha premuto il tasto di modifica di un asset.\

- *Postcondizioni:* L'utente ha modificato la descrizione di un asset. \

- *Scenario principale:*
+ L'utente modifica la descrizione di un asset.

#pagebreak()


== UC-16: Visualizza dati dispositivo

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
 L'utente ha inserito il documento di configurazione del dispositivo.\

- *Postcondizioni:* L'utente ha visualizzato i dati del dispositivo. \

- *Scenario principale:*
+ L'utente seleziona uno dei dispositivi caricati per visualizzarlo.
+ L'utente visualizza il nome del dispositivo.
+ L'utente visualizza il sistema operativo del dispositivo.
+ L'utente visualizza la descrizione del dispositivo.

#figure(
  image("../../../images/diagrammiUML/UC-16.png", width: 70%),
  caption: [UC-16 : Visualizza dati dispositivo]
)

=== UC-16.1: Visualizza nome dispositivo

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.\

- *Postcondizioni:* L'utente ha visualizzato il nome del dispositivo. \

- *Scenario principale:*
+ L'utente visualizza il nome del dispositivo.

=== UC-16.2: Visualizza sistema operativo dispositivo

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.\

- *Postcondizioni:* L'utente ha visualizzato il sistema operativo del dispositivo.\

- *Scenario principale:*
+ L'utente visualizza il sistema operativo del dispositivo.

=== UC-16.3: Visualizza descrizione dispositivo

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ L'utente ha premuto il tasto di visualizzazione dei dati del dispositivo.\

- *Postcondizioni:* L'utente ha visualizzato la descrizione del dispositivo. \

- *Scenario principale:*
+ L'utente visualizza la descrizione del dispositivo.

#pagebreak()


== UC-17 : Visualizza lista asset
#v(1em)

- *Attori coinvolti:* Utente \

- *Precondizioni:* 
+ L'utente ha inserito il documento di configurazione del dispositivo.
+ L'utente ha inserito almeno un asset.\

- *Postcondizioni:* L'utente ha visualizzato la lista di assets. \

- *Scenario principale:*
+ L'utente seleziona la lista di asset da vedere
+ Per ogni asset nella lista l'utente:
  - 2.1: L'utente visualizza le informazioni di un singolo asset
#figure(
  image("../../../images/diagrammiUML/UC-17.png", width: 70%),
  caption: [UC-17 : Visualizza lista asset]
)

=== UC-17.1 : Visualizza singolo asset nella lista
#v(1em)

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha selezionato di visualizzare la lista di asset.\

- *Postcondizioni:* L'utente ha visualizzato le informazioni di un singolo asset. \

- *Scenario principale:*
+ L'utente seleziona l'asset da visualizzare.
+ L'utente seleziona di visualizzare il nome dell'asset.
+ L'utente seleziona di visualizzare il tipo di asset.
+ L'utente seleziona di visualizzare la descrizione dell'asset.

#figure(
  image("../../../images/diagrammiUML/UC-17.1.png", width: 70%),
  caption: [UC-17 : Visualizza lista asset]
)

==== UC-17.1.1 : Visualizza nome asset nella lista
#v(1em)

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha selezionato di visualizzare il nome di un asset.\

- *Postcondizioni:* L'utente ha visualizzato il nome di un singolo asset. \

- *Scenario principale:*
+ L'utente visualizza il nome di un asset.

==== UC-17.1.2 : Visualizza tipo asset nella lista
#v(1em)

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha selezionato di visualizzare il tipo di un asset.\

- *Postcondizioni:* L'utente ha visualizzato il tipo di un singolo asset. \

- *Scenario principale:*
+ L'utente visualizza il tipo di un asset.

==== UC-17.1.3 : Visualizza descrizione asset nella lista
#v(1em)

- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente ha selezionato di visualizzare la descriozione di un asset.\

- *Postcondizioni:* L'utente ha visualizzato la descrizione di un singolo asset. \

- *Scenario principale:*
+ L'utente visualizza la descrizione di un asset.

#pagebreak()


== UC-18 : Importazione del file di definizione dei decision tree
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* L'utente dispone di uno o più file che descrivono i decision tree dei requisiti EN 18031 in un formato supportato (es. XML, JSON). \

- *Postcondizioni:* Il sistema ha acquisito la struttura dei decision tree e li rende disponibili per l'esecuzione. \

- *Scenario principale:*
 + L'utente accede alla funzionalità di importazione dei decision tree.
 + L'utente seleziona il file o i file da importare.
 + Il sistema valida la struttura dei decision tree (nodi, rami, esiti).
 + Il sistema carica i decision tree e li associa ai requisiti corrispondenti.
 + Il sistema conferma il caricamento e mostra l'elenco dei requisiti disponibili.

*Scenari alternativi:*
- *2a.* Il file contiene errori strutturali: il sistema segnala le incongruenze
  e non procede con il caricamento.

#figure(
  image("../../../images/diagrammiUML/UC-18.png", width: 40%),
  caption: [UC-18 : Importazione del file di definizione dei decision tree]
)

#pagebreak()

== UC-19 : Esecuzione del decision tree per un requisito
#v(1em)
- *Attori coinvolti:* Utente \

- *Precondizioni:* Almeno un requisito è stato selezionato (UC-3). \

- *Postcondizioni:* Il sistema ha eseguito l'intero percorso del decision tree per il requisito selezionato e ha determinato un esito. \

- *Scenario principale:*
 + Il sistema presenta all'utente la prima domanda del decision tree associato
  al requisito.
 + L'utente risponde alla domanda (es. _Yes_ / _No_).
 + Il sistema avanza al nodo successivo in base alla risposta fornita.
 + I passi 2–3 si ripetono fino al raggiungimento di un nodo foglia.
 + Il sistema registra l'esito del requisito: *PASS*, *FAIL* o
  *NOT APPLICABLE*.

*Scenari alternativi:*
- *4a.* L'utente non comprende la domanda: può consultare la descrizione
  estesa del nodo prima di rispondere.
- *4b.* L'utente desidera tornare indietro: il sistema consente di
  annullare l'ultima risposta e riprendere dal nodo precedente.

#figure(
  image("../../../images/diagrammiUML/UC-19.png", width: 70%),
  caption: [UC-19 : Esecuzione del decision tree per un requisito]
)

#v(2em)