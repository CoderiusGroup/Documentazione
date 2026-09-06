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
  #text(size: 20pt)[*Versione 0.1.0*]
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
    [0.1.0], [2026/09/06], [Alberto Canavese], [], [Stesura Sezioni 1,2]
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

#let screenshot(didascalia) = figure(
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
  ],
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



