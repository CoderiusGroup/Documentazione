#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Manuale Utente], align(right)[Coderius Group],
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
  #text(size: 26pt, weight: "bold")[Manuale Utente]
  #v(1em)
  #line(length: 70%, stroke: 1pt)
  #v(1.5em)
  #text(size: 16pt)[*Gruppo Coderius*] \
  #v(2pt)
  #link("mailto:coderius01@gmail.com")[coderius01\@gmail.com]
  #v(4em)
  #text(size: 20pt)[*Versione 0.3.0*]
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
    [0.3.0], [2026/09/07], [Alberto Canavese], [], [Stesura dalla sezione 4 alla sezione 4.6],
    [0.2.0], [2026/09/06], [Leonardo Lorenzin], [], [Stesura Sezione 3],
    [0.1.0], [2026/09/06], [Alberto Canavese], [], [Stesura Sezioni 1 e 2]
    
  )
]
#pagebreak()

#show outline.entry.where(level: 1): set block(above: 1.5em)
#show link: underline;
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 3)
#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)
#show link: set text(fill: blue)
#show link: underline

// ---------------------------------------------------------
// Funzioni di supporto al contenuto
// ---------------------------------------------------------

// Screenshot / figura.
//   #screenshot[Didascalia]                              -> segnaposto grigio
//   #screenshot(file: "../../../images/manualeUtente/x.png")[Didascalia]
//   #screenshot(file: "...", width: 70%)[Didascalia]      -> larghezza personalizzata
#let screenshot(didascalia, file: none, width: 85%) = figure(
  if file == none {
    rect(
      width: 100%,
      height: 190pt,
      fill: luma(240),
      stroke: 0.5pt + luma(160),
      inset: 12pt,
    )[
      #align(center + horizon)[
        #text(fill: luma(90))[*Segnaposto screenshot*] \
        #v(0.2em)
        #text(fill: luma(110), size: 10pt)[#didascalia]
      ]
    ]
  } else {
    block(
      stroke: 0.5pt + luma(180),
      radius: 2pt,
      clip: true,
      image(file, width: width),
    )
  },
  caption: didascalia,
  kind: image,
  supplement: [Figura],
)

#let nota(corpo) = block(
  width: 100%,
  fill: luma(245),
  stroke: (left: 2pt + luma(140)),
  inset: 10pt,
  radius: 2pt,
)[#text(size: 10.5pt)[*Nota.* #corpo]]

#show raw.where(block: true): it => block(
  width: 100%,
  fill: luma(247),
  inset: (x: 8pt, y: 6pt),
  radius: 3pt,
  breakable: true,
)[#text(size: 9.5pt)[#it]]

// ---------------------------------------------------------
// Contenuto del Manuale Utente
// ---------------------------------------------------------

= Introduzione

== Scopo del documento

Il presente documento è il _Manuale Utente_ dell'applicazione realizzata dal gruppo *Coderius*
per il capitolato *C1 --- Automated EN 18031 Compliance Verification*, proposto da
*Bluewind S.r.l.* nell'ambito del corso di Ingegneria del Software dell'Università degli Studi
di Padova (a.a. 2025/2026).

Il manuale ha l'obiettivo di guidare l'utente finale nell'installazione, nell'avvio e
nell'utilizzo di tutte le funzionalità del prodotto. Sono descritti i requisiti hardware e
software necessari, la procedura di installazione tramite container e, nel dettaglio, ogni
schermata e ogni operazione messa a disposizione dall'interfaccia.

Il documento non descrive scelte implementative o architetturali interne: per quelle si
rimanda alla documentazione tecnica di progetto (@sec-riferimenti).

== Scopo del prodotto

L'applicazione assiste un valutatore nella *verifica di conformità di un dispositivo allo
standard EN 18031*, richiamato dalla Direttiva RED per gli apparecchi che utilizzano onde
radio.

Il flusso di lavoro supportato è il seguente:

+ si descrive il *dispositivo* da valutare e se ne elencano gli *asset* (le risorse di
  rete, sicurezza, privacy o carattere finanziario che il dispositivo espone);
+ per ogni asset l'applicazione individua i *requisiti* EN 18031 applicabili e, per
  ciascuno, propone il relativo *decision tree* (albero di decisione), cioè una sequenza
  guidata di domande a risposta affermativa o negativa;
+ percorrendo gli alberi, l'utente raggiunge per ogni coppia asset--requisito un *esito*:
  `PASS`, `FAIL` oppure `NOT APPLICABLE`;
+ al termine, l'applicazione aggrega gli esiti e produce un *report di conformità*
  consultabile a schermo ed esportabile in formato JSON e PDF.

L'applicazione mette inoltre a disposizione un *catalogo dei decision tree*, dal quale è
possibile consultare, importare, esportare ed eliminare gli alberi di decisione usati
durante la valutazione.

== Contesto d'uso e utenti destinatari

Il prodotto è destinato a *utenti esperti*: valutatori e tecnici che possiedono competenze
in materia di sicurezza informatica e conoscenza della normativa EN 18031. Per questa
ragione, nel manuale e nell'interfaccia viene fatto uso di terminologia tecnica di settore;
i termini principali sono comunque raccolti nel glossario (@sec-glossario).

L'applicazione è una *applicazione web* che l'utente esegue in locale sulla propria
macchina tramite Docker. Non è previsto alcun account: l'accesso è diretto e non
autenticato. Tutti i dati di lavoro (dispositivi e sessioni di valutazione) restano sulla
macchina dell'utente.

== Glossario <sec-glossario>
All'interno del *Manuale Utente*, così come negli altri documenti formali, i termini che trovano una definizione specifica nel relativo documento _Glossario_ verranno contrassegnati da una lettera "G" maiuscola a pedice (es. Termine#sub[G]). Tale lettera funge anche da collegamento ipertestuale alla relativa voce nel documento citato.

Questa convenzione permette al lettore di individuare immediatamente i vocaboli che possiedono un significato particolare nel contesto del progetto, invitandolo a consultarne la definizione per evitare ambiguità riguardo al linguaggio tecnico utilizzato e garantire così una migliore comprensione dei contenuti.

== Riferimenti <sec-riferimenti>
#v(0.5em)

=== Riferimenti Normativi
#v(0.5em)
- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[*Capitolato C1 --- Automated EN 18031 Compliance Verification*] #text(size: 8pt)[(ultimo accesso: 2026-09-06)]

- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[*Norme di Progetto*] #text(size: 8pt)[(ultimo accesso: 2026-09-06)]

- *Standard EN 18031* #text(size: 8pt)[(consultato tramite copia fornita dal proponente)]
\
=== Riferimenti Informativi
#v(0.5em)
- #link("https://coderiusgroup.github.io/Documentazione/")[*Documentazione di progetto del gruppo Coderius*] #text(size: 8pt)[(ultimo accesso: 2026-09-06)]

- *Analisi dei Requisiti* e *Specifica Tecnica* del gruppo Coderius #text(size: 8pt)[(consultabili dal sito della documentazione)]

- #link("https://docs.docker.com/")[*Documentazione ufficiale di Docker*] #text(size: 8pt)[(ultimo accesso: 2026-09-06)]

== Panoramica delle funzionalità

L'applicazione consente di:

- *creare un dispositivo* inserendo manualmente i suoi dati e i suoi asset;
- *importare un dispositivo* da un file JSON o CSV precedentemente esportato;
- *gestire gli asset* di un dispositivo (aggiunta, modifica, rimozione, consultazione del
  dettaglio e dello stato di valutazione);
- *esportare un dispositivo* in JSON o CSV, con o senza eliminazione;
- *eseguire una valutazione di conformità* guidata, asset per asset e requisito per
  requisito, percorrendo i decision tree;
- *salvare in qualsiasi momento la sessione* di valutazione in un file JSON e *riprenderla*
  in un secondo momento;
- *consultare i risultati* con drill-down fino al percorso logico (domande e risposte) di
  ogni requisito;
- *esportare il report di conformità* in formato PDF;
- *consultare il catalogo dei decision tree*, visualizzarne la struttura a grafo e
  *importarne / esportarne / eliminarne*.

== Architettura <sec-architettura>

Dal punto di vista dell'utente è utile sapere che l'applicazione è composta da due parti,
avviate insieme tramite Docker:

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (left, left, center),
    stroke: 0.5pt + luma(150),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(235) } else { none },
    [*Componente*], [*Ruolo*], [*Porta locale*],
    [Interfaccia web], [Applicazione a pagina singola (SPA) che l'utente utilizza dal browser], [8080],
    [Servizio applicativo], [Espone le operazioni su dispositivi, asset e decision tree], [5000],
  ),
  caption: [Componenti dell'applicazione e porte utilizzate in locale],
)

= Requisiti (verificare compatibilità con altri documenti)

Questa sezione elenca ciò che deve essere presente sulla macchina dell'utente per
installare ed eseguire l'applicazione.

== Requisiti hardware 

L'applicazione non impone requisiti hardware propri significativi: il fattore
dimensionante è l'esecuzione di Docker. I valori seguenti sono *indicativi* e coincidono
con quelli raccomandati per Docker.

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt + luma(150),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(235) } else { none },
    [*Risorsa*], [*Requisito indicativo*],
    [Memoria RAM], [4 GB o più],
    [Processore], [CPU a 64 bit (x86-64 o ARM64) con supporto alla virtualizzazione],
    [Spazio su disco], [Almeno 2 GB liberi per le immagini e i container],
    [Rete], [Connessione a Internet necessaria solo per il download di Docker e dell'applicazione],
  ),
  caption: [Requisiti hardware indicativi],
)

== Requisiti software

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt + luma(150),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(235) } else { none },
    [*Software*], [*Note*],
    [Docker], [Obbligatorio. Su Linux: _Docker Engine_ con il plugin _Docker Compose_ (v2). Su Windows e macOS: _Docker Desktop_. L'applicazione è stata sviluppata e provata con Docker 28.4.0 e Docker Compose v5.1.0.],
    [Git], [Facoltativo. Serve solo per clonare il repository; in alternativa si può scaricare l'archivio ZIP da GitHub.],
    [Browser web], [Obbligatorio. È sufficiente un browser aggiornato (Google Chrome, Mozilla Firefox, Microsoft Edge, Safari). L'esportazione del report PDF avviene tramite browser.],
    /*[Node.js 22 e Python 3.12], [Necessari solo per l'avvio in modalità sviluppo (@sec-dev), non per l'uso normale tramite Docker.],*/
  ),
  caption: [Requisiti software],
)

== Sistemi operativi supportati

L'applicazione è indipendente dal sistema operativo, poiché viene eseguita in container.
È sufficiente un sistema su cui Docker sia supportato:

- Windows 10 o 11 a 64 bit (con backend WSL2);
- macOS 12 o successivo;
- distribuzioni Linux recenti a 64 bit.

= Installazione

La procedura consiste nel verificare la presenza di Docker, ottenere il codice
dell'applicazione e avviare i container. Al termine l'applicazione è raggiungibile dal
browser all'indirizzo `http://localhost:8080`.

== Verifica di Docker

Aprire un terminale e digitare:

```bash
docker --version
```

Se il comando restituisce un numero di versione (ad esempio `Docker version 28.5.1, build ...`)
Docker è installato. Verificare anche la presenza di Docker Compose v2:

```bash
docker compose version
```

Se uno dei due comandi restituisce un errore, installare Docker seguendo la guida ufficiale
(#link("https://docs.docker.com/get-started/get-docker/")) e, su Windows e macOS, avviare
_Docker Desktop_ prima di proseguire.

/*#screenshot[Verifica della versione di Docker dal terminale]*/

#pagebreak()
== Download dell'applicazione

Il codice dell'applicazione si ottiene in uno dei due modi seguenti.

/ Con Git: clonare il repository del progetto.

```bash
git clone https://github.com/CoderiusGroup/MVP.git
```

/ Senza Git: dalla pagina del repository, scaricare l'archivio `.zip` ed estrarlo in una
  cartella a scelta.

Al termine, posizionarsi nella cartella principale del progetto (`MVP`, oppure `MVP-main`
se si è estratto l'archivio ZIP):

```bash
cd MVP
```

Non è richiesta alcuna configurazione preliminare: non è necessario creare né
modificare file di ambiente. La cartella contiene già tutto il necessario, incluso il
catalogo iniziale dei decision tree.

== Avvio dei container

Dalla cartella principale del progetto, eseguire:

```bash
docker compose up --build
```

Il comando costruisce le immagini (operazione richiesta solo la prima volta o dopo un
aggiornamento del codice; richiede alcuni minuti) e avvia i due container
dell'applicazione. Il terminale resta occupato e mostra i log dei servizi.

Gli avvii successivi, se le immagini sono già state costruite, possono usare la forma
abbreviata:

```bash
docker compose up
```

/*#screenshot[Log di avvio dei container nel terminale]*/

== Primo accesso all'applicazione

Quando nel terminale i servizi risultano avviati, aprire il browser e visitare:

```
http://localhost:8080
```

Viene mostrata la *pagina iniziale* dell'applicazione(@sec-home), pronta all'uso.

Se la porta 8080 o la porta 5000 risultano già occupate da un altro programma,
l'avvio dei container fallisce. Chiudere il programma in conflitto oppure liberare le porte
prima di riprovare.

#pagebreak()
== Arresto e riavvio

- Per *arrestare* l'applicazione, tornare nel terminale in cui è in esecuzione e premere
  `Ctrl` + `C`. In alternativa, da un altro terminale nella stessa cartella:

```bash
docker compose down
```

- Per *riavviare* l'applicazione in un secondo momento, ripetere dalla cartella del
  progetto:

```bash
docker compose up
```

I decision tree del catalogo (comprese le modifiche apportate dall'utente) vengono
conservati tra un riavvio e l'altro. I dispositivi e le sessioni non salvati su file, invece,
non sopravvivono alla chiusura del browser.

= Istruzioni per l'uso

Questa sezione descrive nel dettaglio ogni schermata e ogni operazione
dell'applicazione, nell'ordine tipico di utilizzo.

== Pagina iniziale <sec-home>

La pagina iniziale, intitolata *Gestione Valutazione Dispositivi*, è il punto di partenza
per tutte le attività. Presenta quattro riquadri:

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt + luma(150),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(235) } else { none },
    [*Riquadro*], [*Azione*],
    [Nuovo dispositivo], [Il pulsante *Crea nuovo dispositivo* apre il modulo di creazione manuale (@sec-crea-dispositivo).],
    [Importa dispositivo da JSON o CSV], [Il pulsante *Scegli un file* apre la finestra di selezione file del sistema operativo per caricare un dispositivo salvato in precedenza (@sec-importa-dispositivo).],
    [Riprendi una sessione salvata], [Il pulsante *Scegli un file* apre la finestra di selezione file per caricare una sessione di valutazione salvata /*(@sec-riprendi)*/.],
    [Catalogo decision tree], [Il pulsante *Apri catalogo decision tree* apre il catalogo degli alberi di decisione /*(@sec-catalogo)*/.],
  ),
  caption: [Azioni disponibili nella pagina iniziale],
)

#screenshot(file: "../../../images/manualeUtente/pagina-iniziale.png")[
  Pagina iniziale con i quattro riquadri di azione
]

== Convenzioni dell'interfaccia

=== Notifiche

L'esito delle operazioni viene comunicato tramite brevi messaggi temporanei ("toast") che
compaiono per pochi secondi. I messaggi di conferma (ad esempio "Dispositivo creato
correttamente") e i messaggi di errore (ad esempio "Errore di rete: impossibile contattare
il server") usano stili diversi ma spariscono automaticamente.

=== Navigazione

Le schermate diverse dalla pagina iniziale presentano in alto a sinistra un collegamento
di ritorno (freccia "←") con un'etichetta che indica la destinazione (ad esempio
*Torna alla Home* o *Torna alla gestione asset*). L'applicazione funziona a pagina singola:
è consigliabile usare i comandi di navigazione interni anziché il pulsante "Indietro" del
browser, che potrebbe far perdere il lavoro non salvato.

=== Indicatori di stato <sec-stati>

Accanto a dispositivi, asset e requisiti compare un'etichetta colorata ("badge") che ne
sintetizza lo stato di valutazione:

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt + luma(150),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(235) } else { none },
    [*Stato*], [*Significato*],
    [Non valutato], [La valutazione non è ancora stata avviata.],
    [In corso], [Il decision tree è stato iniziato ma non ancora concluso.],
    [PASS], [Esito positivo: il requisito è soddisfatto.],
    [FAIL], [Esito negativo: il requisito non è soddisfatto.],
    [Non applicabile], [Il requisito non si applica all'asset (foglia `NOT APPLICABLE`).],
    [Nessun requisito applicabile], [All'asset non è associato alcun requisito da valutare.],
  ),
  caption: [Stati di valutazione mostrati dai badge],
)

Per un asset o per l'intero dispositivo, il badge mostra l'*esito aggregato*, calcolato
dando priorità agli stati nell'ordine: `FAIL`, poi "In corso", poi "Non valutato", poi
`PASS`, poi "Non applicabile". In pratica un asset risulta `PASS` solo quando tutti i suoi
requisiti sono `PASS` o "Non applicabile"; è sufficiente un solo `FAIL` perché l'asset, e
quindi il dispositivo, risultino `FAIL`.

== Creazione di un dispositivo <sec-crea-dispositivo>

=== Inserimento dei dati del dispositivo

Dal pulsante *Crea nuovo dispositivo* si apre il modulo *Crea un nuovo dispositivo*, con
tre campi:

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: (left, center, left),
    stroke: 0.5pt + luma(150),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(235) } else { none },
    [*Campo*], [*Obbligatorio*], [*Note*],
    [Nome], [Sì], [Da 1 a 100 caratteri.],
    [Sistema operativo], [Sì], [Da 1 a 100 caratteri.],
    [Descrizione], [Sì], [Da 1 a 1000 caratteri.],
  ),
  caption: [Campi del modulo di creazione del dispositivo],
)

Premendo *Salva e procedi agli asset* il dispositivo viene creato e si passa alla schermata
di *Gestione asset* (@sec-gestione-asset). Se un campo obbligatorio non è valido viene
mostrato un messaggio di errore e il dispositivo non viene creato.

#screenshot(file: "../../../images/manualeUtente/creazione-dispositivo.png")[Modulo di creazione di un nuovo dispositivo]

=== Gestione degli asset <sec-gestione-asset>

La schermata *Gestione asset* mostra il nome del dispositivo in lavorazione e l'elenco dei
suoi asset. Da qui è possibile:

- *Aggiungi asset*: apre il modulo di creazione di un nuovo asset (@sec-crea-asset);
- *Visualizza dettaglio dispositivo*: apre il *Riepilogo dispositivo* (@sec-riepilogo).
  Il pulsante è disabilitato finché non è presente almeno un asset;
- per ciascun asset in elenco: *Modifica* e *Rimuovi*;
- fare clic sul nome di un asset per espanderne il dettaglio.

Il dettaglio espanso di un asset riporta descrizione, indicazione se l'asset è sensibile,
stato di valutazione e l'elenco dei requisiti applicabili, ognuno con il proprio stato.

#screenshot(file: "../../../images/manualeUtente/gestione-asset.png")[Schermata di gestione degli asset con un asset espanso]

=== Aggiunta di un asset <sec-crea-asset>

Il modulo *Nuovo Asset* contiene i campi seguenti:

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    stroke: 0.5pt + luma(150),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(235) } else { none },
    [*Campo*], [*Note*],
    [Nome], [Obbligatorio, da 1 a 100 caratteri.],
    [Tipo], [Da scegliere tra `Network`, `Security`, `Privacy`, `Financial`. Predefinito: `Network`.],
    [Descrizione], [Obbligatoria, da 1 a 1000 caratteri.],
    [Asset sensibile], [Casella da spuntare se l'asset è sensibile.],
  ),
  caption: [Campi del modulo di creazione di un asset],
)

Premendo *Invia* l'asset viene creato e aggiunto all'elenco. Se il nome o la descrizione
sono vuoti compare il messaggio "Dati asset non validi" e l'asset non viene creato.

#screenshot(file: "../../../images/manualeUtente/creazione-asset.png")[Modulo di creazione di un asset]

=== Requisiti applicabili e loro derivazione <sec-derivazione> DA VALUTARE

Quando si crea un asset l'applicazione deriva automaticamente i requisiti in base al tipo dell'asset:
associa all'asset tutti i decision tree del catalogo che si applicano a quel tipo.

Nel catalogo iniziale tutti i decision tree si applicano ai tipi `network` e `security`.
Di conseguenza:

- un asset di tipo *Network* o *Security* riceve l'intero elenco dei requisiti del catalogo
  iniziale (`ACM-1`, `ACM-2`, `AUM-1-1`, `AUM-1-2`, `AUM-2`, `AUM-3`, `AUM-4`, `AUM-5-1`,
  `AUM-5-2`, `AUM-6`);
- un asset di tipo *Privacy* o *Financial* non riceve alcun requisito e viene mostrato con
  lo stato "Nessun requisito applicabile".

Modificando in seguito il *tipo* di un asset, l'elenco dei requisiti applicabili
viene ricalcolato in base al nuovo tipo. Le modifiche agli altri campi (nome, descrizione,
sensibilità) non toccano i requisiti.

=== Modifica di un asset

Il pulsante *Modifica* accanto a un asset apre il modulo *Modifica Asset*, identico a
quello di creazione ma precompilato. Premendo il tasto di conferma le modifiche vengono salvate.

- Se il tipo non cambia, la modifica è immediata e i requisiti restano invariati.
- Se il tipo cambia, i requisiti applicabili vengono riderivati dal nuovo tipo
  (@sec-derivazione).

=== Rimozione di un asset

Il pulsante *Rimuovi* accanto a un asset chiede conferma ("Confermi l'eliminazione
dell'asset?") e, se confermato, lo elimina dall'elenco.

== Importazione di un dispositivo da file <sec-importa-dispositivo>

Dal riquadro *Importa dispositivo da JSON o CSV* della pagina iniziale, il pulsante
*Scegli un file* consente di caricare un dispositivo salvato in precedenza.  Sono ammessi
file con estensione `.json` o `.csv` /*conformi ai formati descritti in (@sec-formati)*/.

Al termine del caricamento l'applicazione segnala "Dispositivo caricato correttamente" e
apre la schermata di *Gestione asset* con il dispositivo importato e i suoi asset, se presenti. In caso di file non valido viene mostrato un messaggio di errore e il dispositivo
non viene caricato /*(@sec-errori)*/.


== Riepilogo del dispositivo <sec-riepilogo>

La schermata *Riepilogo dispositivo* si raggiunge dalla gestione asset con il pulsante
*Visualizza dettaglio dispositivo*.

=== Dati e stato

La schermata mostra ID, nome, sistema operativo, descrizione e lo *stato* del dispositivo
(esito aggregato, @sec-stati).

I pulsanti disponibili sono:

- *Avvia valutazione*: avvia (o riprende) la sessione di valutazione e apre la schermata di
  esecuzione (@sec-valutazione).
- *Gestisci asset*: torna alla schermata di gestione asset;
- *Modifica dispositivo*: apre il modulo di modifica dei dati anagrafici.
- *Esportazione dispositivo*: permette di esportare il dispositivo in formato JSON o CSV.
- *Eliminazione del dispositivo*: permette di eliminare il dispositivo dalla memoria, con o senza
  backup.


#screenshot(file: "../../../images/manualeUtente/riepilogo-dispositivo.png")[Schermata di riepilogo del dispositivo]

=== Esportazione del dispositivo

I pulsanti *Esporta in JSON* ed *Esporta in CSV* scaricano immediatamente il dispositivo
corrente, con tutti i suoi asset, in un file nominato con l'identificativo del dispositivo. Il file esportato può essere ricaricato in seguito
tramite *Importa dispositivo* (@sec-importa-dispositivo).

=== Modifica dei dati del dispositivo

Il pulsante *Modifica dispositivo* apre il modulo *Modifica dispositivo*, precompilato con
i dati correnti. Premendo *Salva modifiche* si torna al riepilogo con i dati aggiornati.

=== Eliminazione del dispositivo

Nella parte inferiore del riepilogo sono presenti due pulsanti:

- *Elimina dispositivo*: previa conferma ("Confermi l'eliminazione definitiva del
  dispositivo? L'operazione non è reversibile."), rimuove il dispositivo dalla memoria e
  riporta alla pagina iniziale;
- *Elimina con backup*: previa conferma, scarica prima un file JSON di backup del
  dispositivo e poi lo rimuove.

== Esecuzione di una valutazione di conformità <sec-valutazione>

=== Avvio della valutazione

Dal riepilogo del dispositivo, il pulsante *Avvia valutazione* crea la sessione e apre la
schermata di esecuzione. La sessione contiene una *valutazione per ogni coppia
asset--requisito* derivata dal dispositivo; tutte partono dallo stato "Non valutato".


Se nessun asset del dispositivo ha requisiti applicabili, la sessione risulta
immediatamente conclusa e si viene portati direttamente alla schermata dei risultati
/*(@sec-risultati)*/.

=== Cruscotto di avanzamento

La prima schermata della valutazione è il cruscotto, intitolato *Valutazione dispositivo*.
Riporta:

- il numero di *asset completati sul totale*;
- se una coppia è in esame, l'asset e il requisito correnti con il numero di requisiti
  completati per quell'asset;
- l'elenco di tutti gli asset del dispositivo, ciascuno con tipo, badge di stato e pulsante
  *Valuta*.

#screenshot(file: "../../../images/manualeUtente/cruscotto-avanzamento.png")[Cruscotto di avanzamento della valutazione]

=== Scheda dell'asset

Premendo *Valuta* su un asset si apre la sua scheda, che mostra tipo, descrizione,
sensibilità e stato dell'asset, seguiti dall'elenco dei *Requisiti* applicabili. Ogni
requisito ha un badge di stato e un pulsante:

- *Apri*: apre il dettaglio del requisito;
- *Completato* (disabilitato): il requisito è già stato valutato in questa sessione.


Il collegamento *← Torna alla dashboard* riporta al cruscotto.



#screenshot(file: "../../../images/manualeUtente/scheda-asset.png")[Scheda di un asset con l'elenco dei requisiti]

=== Dettaglio del requisito e dipendenze

Il dettaglio del requisito mostra il codice e il nome esteso del requisito e la sezione
*Dipendenze*, che elenca gli altri requisiti da cui quello corrente dipende, ciascuno con
lo stato della corrispondente valutazione per l'asset in esame (oppure "Nessuna
dipendenza").

Le dipendenze hanno valore *informativo*: aiutano a decidere l'ordine di valutazione ma
non vengono imposte dall'applicazione. Il pulsante *Avvia decision tree* è sempre
disponibile e apre l'albero di decisione del requisito.

#screenshot(file: "../../../images/manualeUtente/dettaglio-requisito.png")[Dettaglio di un requisito con la sezione Dipendenze]

=== Esecuzione del decision tree

Durante l'esecuzione dell'albero, la schermata riporta in alto l'asset e il requisito in
esame. Al centro viene mostrato un *nodo* alla volta:

- *Nodo domanda*: sono visualizzati il codice del nodo e il testo della domanda, con i
  pulsanti *Sì* e *No*. La risposta fa avanzare l'albero lungo la diramazione
  corrispondente.
- *Nodo foglia*: è visualizzato l'*esito* raggiunto (`PASS`, `FAIL` o `N/A`), con l'eventuale
  testo esplicativo e il pulsante *Conferma esito*.

#screenshot(file: "../../../images/manualeUtente/esecuzione-DT.png")[Nodo domanda del decision tree con i pulsanti Sì / No]

=== Navigazione tra le domande

Sotto l'area del nodo sono presenti i pulsanti *Indietro* e *Avanti*:

- *Indietro* riporta alla domanda precedente, permettendo di rivedere o cambiare una
  risposta;
- *Avanti* è disponibile solo per ripercorrere in avanti le domande a cui si è già
  risposto (ad esempio dopo aver usato *Indietro*).

Se, tornando indietro, si fornisce a una domanda una risposta *diversa* da quella
data in precedenza, il percorso successivo a quel punto viene scartato: le domande
seguenti dovranno essere ripercorse. Questo perché il percorso viene registrato via via che
si procede. Il pulsante *Avanti* in quel caso resta disabilitato.

#pagebreak()

=== Il grafo del decision tree

Sotto la domanda corrente è mostrato il *grafo* dell'intero albero di decisione. I nodi
già attraversati e il nodo corrente sono evidenziati, così come le diramazioni percorse;
i restanti nodi sono in trasparenza. Il grafo dispone di comandi per adattare la vista
(zoom e adattamento automatico) e serve solo alla consultazione: non è possibile
rispondere alle domande facendo clic sui nodi.

#screenshot(file: "../../../images/manualeUtente/grafo-DT.png")[Grafo del decision tree con evidenziato il percorso seguito]

=== Conferma dell'esito

Quando si raggiunge un nodo foglia, il pulsante *Conferma esito* registra l'esito per la
coppia asset--requisito corrente e riporta alla scheda dell'asset, dove il requisito
appena valutato risulta "Completato". Si prosegue quindi con il requisito successivo o si
torna al cruscotto per scegliere un altro asset.

Quando tutte le coppie asset--requisito sono state completate, la sessione passa allo
stato "conclusa" e viene mostrata la schermata dei risultati /*(@sec-risultati)*/.

=== Salvataggio della sessione

Il pulsante *Salva sessione*, presente nella barra inferiore durante tutta la valutazione,
scarica un file JSON con lo stato completo della sessione (dispositivo, avanzamento,
risposte date fino a quel momento). Il file può essere ricaricato in seguito dalla pagina iniziale
/*(@sec-riprendi)*/.

=== Uscita dalla valutazione

Il pulsante *Esci dal test* apre una richiesta di conferma con tre opzioni:

- *Salva ed esci*: scarica il file di sessione e poi torna alla pagina iniziale;
- *Esci senza salvare*: torna alla pagina iniziale scartando lo stato della sessione in
  memoria;
- *Annulla*: chiude la richiesta e resta nella valutazione.


