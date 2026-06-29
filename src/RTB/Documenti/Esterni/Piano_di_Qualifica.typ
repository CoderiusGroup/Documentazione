#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Piano di Qualifica], align(right)[Coderius Group],
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
  #text(size: 26pt, weight: "bold")[Piano di Qualifica]
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
    [0.3.0], [2026/06/29], [Edis Hodja], [], [Aggiunta dei grafici relativi agli errori ortografici e Gulpease],
    [0.2.4], [2026/06/25], [Giovanni Bronte], [Edis Hodja], [Aggiornamento tabelle dei requisiti e aggiunta sezione relativa allo sprint 6],
    [0.2.3], [2026/06/12], [Leonardo Lorenzin], [Ines Iadadi], [Aggiornamento tabelle delle metriche e aggiunta sezione relativa allo sprint 5],
    [0.2.2], [2026/06/08], [Leonardo Lorenzin], [Ines Iadadi], [Aggiornamento sezioni e correzione refusi],
    [0.2.1], [2026/05/29], [Alberto Canavese], [Giovanni Bronte], [Espansione dei Test di Sistema con tracciamento ai requisiti, aggiunta di nuove metriche di prodotto e correzione refusi],
    [0.2.0], [2026/05/28], [Alberto Canavese], [Giovanni Bronte], [Stesura sezioni 2–5: metriche di qualità (MPC/MPD), strategie di testing (TS-01..47, TA-01..10), cruscotto di valutazione con dati EVM e grafici, automiglioramento],
    [0.1.1], [2026/05/11], [Leonardo Lorenzin], [Filippo Zonta Rocha], [Correzione refusi e aggiornamento sezioni 1.1, 1.2, 1.3],
    [0.1.0], [2026/05/07], [Giovanni Bronte], [Leonardo Lorenzin], [Prima stesura del documento con sezione 1],
  )
]
#pagebreak()
#show outline.entry.where(level: 1): set block(above: 1.5em)
#show link: underline;
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 3)

#pagebreak()

#outline(
  title: [Elenco delle Tabelle],
  target: figure.where(kind: table),
)

#pagebreak()

#outline(
  title: [Elenco delle Figure],
  target: figure.where(kind: image),
)

#set page(numbering: "1 / 1")
#counter(page).update(1)
#show link: set text(fill: blue)
#show link: underline
#show figure.where(kind: table): set block(breakable: true)
#let nota(corpo) = text(size: 8pt, [#corpo])

= Introduzione

== Scopo del documento
Il presente documento ha lo scopo di definire le strategie di verifica e validazione adottate dal gruppo Coderius, con l’obiettivo di monitorare e garantire la qualità del software e dei processi correlati per tutta la durata del progetto attraverso l'utilizzo di metriche quantitative.

Il documento si divide in tre componenti essenziali:
- *Piano della Qualità*: attività del sistema qualità mirate a fissare gli obiettivi di qualità, insieme ai processi e alle risorse necessarie per conseguirli.
- *Controllo della Qualità*: attività pianificate e attuate per assicurare che il prodotto soddisfi le attese e i requisiti concordati.
- *Miglioramento continuo*: attività periodiche che analizzano i risultati, identificano criticità e ottimizzano i processi per accrescere l'efficienza del team.
Il Piano di Qualifica verrà revisionato periodicamente lungo l’intero ciclo di vita del progetto per fare fronte alle esigenze del committente e del team stesso, garantendo un'elevata qualità e monitoraggio costante dello sviluppo del software.

== Glossario
#v(0.5em)
All'interno del *Piano di Qualifica*, così come negli altri documenti formali, i termini che trovano una definizione specifica nel relativo documento _Glossario_ verranno contrassegnati da una lettera "G" maiuscola a pedice (es. Termine#sub[G]). Tale lettera funge anche da collegamento ipertestuale alla relativa voce nel documento citato.

Questa convenzione permette al lettore di individuare immediatamente i vocaboli che possiedono un significato particolare nel contesto del progetto, invitandolo a consultarne la definizione per evitare ambiguità riguardo al linguaggio tecnico utilizzato e garantire così una migliore comprensione dei contenuti.

== Riferimenti
#v(0.5em)

=== Riferimenti Normativi
#v(0.5em)
- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[*Norme di Progetto v0.9.0*] #nota[(documento su branch feature, non ancora unito al main — non consultabile dal sito; il link verrà aggiornato al momento del merge)]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[*Capitolato C1 — Automated EN18031 Compliance Verification*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[*Regolamento del Progetto Didattico*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://www.iso.org/standard/63712.html")[*Standard ISO/IEC 12207:2017*] #nota[(ultimo accesso: 2026-04-04)]

- *Standard EN 18031* #nota[(Consultato tramite copia fornita dal proponente)]
\
=== Riferimenti Informativi
- #link("https://it.wikipedia.org/wiki/ISO/IEC_9126")[*Standard ISO/IEC 9126*] #nota[(ultimo accesso: 2026-04-04)]
- #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf")[*Standard ISO/IEC 12207:1995*] #nota[(ultimo accesso: 2026-04-24)]
- Dispense del corso di Ingegneria del Software 2025/2026 riguardanti gli argomenti trattati nel Piano di Qualifica:
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T07.pdf")[*T07 - Qualità del software*] #nota[(ultimo accesso: 2026-04-24)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T08.pdf")[*T08 - Qualità di processo*] #nota[(ultimo accesso: 2026-04-24)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T09.pdf")[*T09 - Verifica e validazione: introduzione*] #nota[(ultimo accesso: 2026-04-24)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T10.pdf")[*T10 - Verifica e validazione: analisi statica*] #nota[(ultimo accesso: 2026-04-24)]
  - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T11.pdf")[*T11 - Verifica e validazione: analisi dinamica*] #nota[(ultimo accesso: 2026-04-24)]

= Metriche di qualità

In questa sezione vengono definite le soglie quantitative — composte da *valore accettabile* e *valore ottimo* — per valutare l'efficacia e l'efficienza dei processi e del prodotto. Le metriche applicate, con le relative formule di calcolo, sono descritte in dettaglio nel documento #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Norme_di_Progetto.pdf")[*Norme di Progetto*].

#let metriche-table(caption-text, ..rows) = figure(
  table(
    columns: (3cm, 1fr, 4cm, 3cm),
    align: (center, left, center, center),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 3 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    [*Codice*], [*Metrica*], [*Accettabile*], [*Ottimo*],
    ..rows,
  ),
  caption: caption-text,
  supplement: [Tabella],
)

== Qualità di processo

Garantire la qualità dei processi è il presupposto per ottenere un prodotto finale valido: soltanto seguendo metodologie e pratiche consolidate è possibile costruire un software di livello elevato. Tali pratiche devono orientare ogni attività lungo l'intero ciclo di vita del prodotto. Il mantenimento di standard elevati passa quindi attraverso verifiche periodiche e un costante perfezionamento dei processi che lo sostengono, così da conseguire risultati pienamente in linea con le attese.

=== Processi primari

Rientrano tra i processi primari tutte le attività direttamente connesse al ciclo di vita del software. Per tenerne sotto controllo l'andamento, l'efficienza e l'aderenza agli obiettivi stabiliti, si ricorre a metriche quantitative capaci di seguire lo stato di avanzamento, l'impiego delle risorse e il livello qualitativo di quanto realizzato.

==== Fornitura

#metriche-table(
  [Metriche per il processo di Fornitura],
  [MPC-01], [Planned Value],               [Almeno $0$],                   [Fino a $"BAC"$],
  [MPC-02], [Earned Value],                  [Maggiore di $"PV" * 0.75$],    [Almeno $"PV"$],
  [MPC-03], [Actual Cost],                  [Tra $0$ e $1.2 * "EV"$],       [Non oltre $"EV"$],
  [MPC-04], [Schedule Performance Index],  [Da $0.9$ in su],               [Pari o oltre $1.0$],
  [MPC-05], [Cost Performance Index],      [Da $0.9$ in su],               [Pari o oltre $1.0$],
  [MPC-06], [Estimate at Completion],      [Entro $1.1 * "BAC"$],          [Non oltre $"BAC"$],
  [MPC-07], [Estimate to Complete],        [Entro $("BAC" - "AC") * 1.1$], [Non oltre $"BAC" - "AC"$],
)

==== Sviluppo

#metriche-table(
  [Metriche per il processo di Sviluppo],
  [MPC-08], [Requirements Stability Index], [Da $0.7$ in su], [Pari a $1.0$],
)

=== Processi di supporto

I processi di supporto raccolgono le attività che assicurano controllo, tracciabilità e affidabilità all'intero processo di sviluppo, quali la documentazione tecnica, le attività di verifica e l'assicurazione della qualità.

==== Documentazione

#metriche-table(
  [Metriche per il processo di Documentazione],
  [MPC-09], [Indice di leggibilità Gulpease], [Almeno $60$], [Almeno $75$],
  [MPC-10], [Accuratezza Ortografica],      [Al massimo 1 ], [Pari a $0$],
)

==== Verifica

#metriche-table(
  [Metriche per il processo di Verifica],
  [MPC-11], [Test Pass Rate],   [Almeno $90\%$], [Pari al $100\%$],
  [MPC-12], [Code Coverage], [Almeno $70\%$], [Almeno $90\%$],
)

==== Assicurazione della qualità

#metriche-table(
  [Metriche per il processo di Assicurazione della Qualità],
  [MPC-13], [Quality Metrics Satisfied], [$>= 80%$], [$100%$],
)

=== Processi organizzativi

I processi organizzativi attengono alla sfera gestionale del gruppo: spaziano dalla definizione delle convenzioni interne al governo della qualità, fino alla crescita delle competenze e al miglioramento continuo. Gli indicatori a essi collegati ne misurano l'aderenza e l'efficacia sul piano della governance.

==== Gestione dei processi

#metriche-table(
  [Metriche per la Gestione dei Processi],
  [MPC-14], [Time Efficiency],[Almeno $80%$], [Pari al $100%$],
)

== Qualità di prodotto

La qualità del prodotto è il fine ultimo di qualunque progetto software e si traduce nella capacità dell'applicazione finale di rispondere appieno a requisiti, aspettative ed esigenze di utenti e committenti. Essa discende direttamente dalla bontà dei processi seguiti lungo tutto il ciclo di vita. Un software di qualità elevata si riconosce perché funzionale, affidabile, usabile, efficiente e manutenibile.

=== Funzionalità

Misura quanto il software realizzi in modo corretto le funzioni previste dai requisiti, verificandone la completezza e l'aderenza rispetto a quanto specificato nell'Analisi dei Requisiti.

#metriche-table(
  [Metriche di Funzionalità del prodotto],
  [MPD-01], [Soddisfacimento dei Requisiti Obbligatori],  [Pari al $100%$],    [Pari al $100%$],
  [MPD-02], [Soddisfacimento dei Requisiti Desiderabili], [Almeno $50%$],      [Almeno $75%$],
  [MPD-03], [Soddisfacimento dei Requisiti Opzionali],    [A partire da $0%$], [Almeno $50%$],
)

#pagebreak()

=== Affidabilità

Esprime la continuità di servizio del prodotto: la capacità di mantenere un funzionamento corretto e prevedibile nel tempo, contenendo il numero di anomalie e preservando un comportamento stabile anche nelle condizioni operative attese.

#metriche-table(
  [Metriche di Affidabilità del prodotto],
  [MPD-04], [Failure Density],    [$<= 0.5$],  [$<= 0.2$],
  [MPD-05], [Statement Coverage], [$>= 80%$],  [$>= 95%$],
  [MPD-06], [Branch Coverage],    [$>= 60%$],  [$>= 80%$],
)

=== Usabilità

Valuta il grado di accessibilità del prodotto dal punto di vista dell'utente finale: quanto risulta immediato apprenderne l'utilizzo, quanto sono lineari le interazioni offerte e con quale efficacia le persone riescono a completare le operazioni senza incorrere in errori.

#metriche-table(
  [Metriche di Usabilità del prodotto],
  [MPD-07], [Error Rate], [$<= 5% $], [$<= 2% $],
  [MPD-08], [Time To Complete Task], [$<= 60 upright(" sec")$], [$<= 30 upright(" sec")$],
)

=== Efficienza

Riguarda il rapporto tra i risultati prodotti e le risorse impiegate: tempi di risposta contenuti, un buon sfruttamento di processore e memoria e la capacità di reagire prontamente alle richieste, anche al crescere del carico di lavoro.

#metriche-table(
  [Metriche di Efficienza del prodotto],
  [MPD-09], [Response Time], [$<= 3 upright(" sec")$], [$<= 1 upright(" sec")$],
)
#pagebreak()

=== Manutenibilità

Indica con quanta facilità il codice può essere compreso, corretto ed esteso nel tempo senza introdurre regressioni. Dipende da fattori quali la modularità delle componenti, il grado di accoppiamento reciproco e la complessità interna delle singole unità di codice.

#metriche-table(
  [Metriche di Manutenibilità del prodotto],
  [MPD-10], [Coefficient of Coupling], [$<= 0.4$],                 [$<= 0.2$],
  [MPD-11], [Cyclomatic Complexity], [$<= 10$],                 [$<= 8$],
  [MPD-12], [Instability Index],     [$I >= 0.7 or I <= 0.30$], [$I >= 0.85 or I <= 0.15$],
  [MPD-13], [Code Smell],            [$<= 10$],                 [$<= 5$],
)
#pagebreak()

= Strategie di testing

Il processo di verifica e validazione del software prevede l'utilizzo di diverse tipologie di test, ciascuna con uno scopo specifico all'interno del ciclo di sviluppo. Le tipologie previste sono:

- *Test di Sistema* (TS): verificano il comportamento del sistema nella sua interezza rispetto ai requisiti funzionali definiti nell'Analisi dei Requisiti;
- *Test di Accettazione* (TA): validano il prodotto finale con il proponente, accertando la conformità ai requisiti concordati;
- *Test di Unità* (TU): verificano le singole unità di codice in isolamento;
- *Test di Integrazione* (TI): verificano la corretta interazione tra i componenti del sistema;
- *Test di Regressione* (TR): accertano che modifiche al codice non introducano regressioni nelle funzionalità già verificate.

Durante la Requirements Technology Baseline (RTB) vengono documentati i Test di Sistema e i Test di Accettazione. I Test di Unità, di Integrazione e di Regressione saranno definiti e condotti nell'ambito delle attività previste per la Product Baseline (PB).

Per ciascun test viene riportato un codice identificativo, una descrizione e il codice del requisito funzionale di riferimento definito nell'Analisi dei Requisiti. Lo stato dei test viene indicato con le seguenti abbreviazioni:
- *NI*: Non Implementato
- *S*: Superato
- *NS*: Non Superato

#let test-table(caption-text, ..rows) = figure(
  table(
    columns: (1.8cm, 1fr, 2.6cm, 1.4cm),
    align: (center, left, center, center),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 3 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 7pt,
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    [*Codice*], [*Descrizione*], [*Requisito*], [*Stato*],
    ..rows,
  ),
  caption: caption-text,
  supplement: [Tabella],
)

== Test di Sistema

I test di sistema verificano il comportamento complessivo del sistema rispetto ai requisiti funzionali definiti nell'Analisi dei Requisiti. È previsto un test per ciascun requisito funzionale (obbligatorio, desiderabile e opzionale), in modo da garantire la copertura completa e la tracciabilità bidirezionale tra requisiti e test.

=== Gestione dei dispositivi

#test-table(
  [Test di Sistema — Gestione dei dispositivi],
  [TS-01], [Verificare che l'utente possa inserire un nuovo dispositivo all'interno della piattaforma.], [RF-Ob01], [NI],
  [TS-02], [Verificare che l'utente possa importare un dispositivo tramite file di configurazione in formato JSON o CSV.], [RF-Ob02], [NI],
  [TS-03], [Verificare che l'utente possa selezionare il file sorgente per l'importazione del dispositivo.], [RF-Ob03], [NI],
  [TS-04], [Verificare che il sistema supporti la selezione di un file in formato JSON come sorgente per l'importazione del dispositivo.], [RF-Ob04], [NI],
  [TS-05], [Verificare che il sistema supporti la selezione di un file in formato CSV come sorgente per l'importazione del dispositivo.], [RF-Ob05], [NI],
  [TS-06], [Verificare che il sistema controlli la validità strutturale e la conformità del file di configurazione caricato.], [RF-Ob06], [NI],
  [TS-07], [Verificare che il sistema blocchi l'importazione e mostri un messaggio di errore quando il file ha formato non valido.], [RF-Ob07], [NI],
  [TS-08], [Verificare che l'utente possa creare manualmente un nuovo dispositivo.], [RF-Ob08], [NI],
  [TS-09], [Verificare che il sistema richieda l'inserimento dei dati identificativi del dispositivo durante la creazione manuale.], [RF-Ob09], [NI],
  [TS-10], [Verificare che l'utente possa inserire il nome identificativo del dispositivo.], [RF-Ob10], [NI],
  [TS-11], [Verificare che l'utente possa inserire il sistema operativo del dispositivo.], [RF-Ob11], [NI],
  [TS-12], [Verificare che l'utente possa inserire una descrizione testuale del dispositivo.], [RF-Ob12], [NI],
  [TS-13], [Verificare che il sistema validi i dati inseriti nei form e mostri un errore in caso di campi vuoti o non conformi.], [RF-Ob13], [NI],
  [TS-14], [Verificare che l'utente possa visualizzare le informazioni e i dati relativi al dispositivo.], [RF-Ob14], [NI],
  [TS-15], [Verificare che il sistema mostri in dettaglio il nome del dispositivo registrato.], [RF-Ob15], [NI],
  [TS-16], [Verificare che il sistema mostri in dettaglio il sistema operativo del dispositivo registrato.], [RF-Ob16], [NI],
  [TS-17], [Verificare che il sistema mostri in dettaglio la descrizione del dispositivo registrato.], [RF-Ob17], [NI],
  [TS-18], [Verificare che il sistema calcoli e mostri lo stato aggregato di valutazione del dispositivo (non valutato, PASS, FAIL).], [RF-Ob18], [NI],
  [TS-19], [Verificare che l'utente possa esportare tutti i dati di un dispositivo in formato JSON o CSV.], [RF-Ob19], [NI],
  [TS-20], [Verificare che l'utente possa esportare i dati del dispositivo e degli asset associati in formato JSON.], [RF-Ob20], [NI],
  [TS-21], [Verificare che l'utente possa esportare i dati del dispositivo e degli asset associati in formato CSV.], [RF-Ob21], [NI],
  [TS-22], [Verificare che l'utente possa eliminare definitivamente un dispositivo dal sistema.], [RF-Ob22], [NI],
  [TS-23], [Verificare che l'utente possa eliminare un dispositivo senza effettuare il backup dei dati.], [RF-Ob23], [NI],
  [TS-24], [Verificare che l'utente possa eliminare un dispositivo previa esportazione automatica di backup dei dati.], [RF-Ob24], [NI],
)

#pagebreak()

=== Gestione degli asset

#test-table(
  [Test di Sistema — Gestione degli asset],
  [TS-25], [Verificare che l'utente possa inserire un nuovo asset all'interno di un dispositivo.], [RF-Ob25], [NI],
  [TS-26], [Verificare che il sistema richieda la compilazione dei dati dell'asset nel form di creazione.], [RF-Ob26], [NI],
  [TS-27], [Verificare che l'utente possa inserire il nome dell'asset nel form di creazione.], [RF-Ob27], [NI],
  [TS-28], [Verificare che l'utente possa selezionare il tipo di asset tra Network, Security, Privacy e Financial.], [RF-Ob28], [NI],
  [TS-29], [Verificare che l'utente possa inserire la descrizione dell'asset nel form di creazione.], [RF-Ob29], [NI],
  [TS-30], [Verificare che l'utente possa impostare la sensibilità dell'asset.], [RF-Ob30], [NI],
  [TS-31], [Verificare che l'utente possa visualizzare la lista degli asset associati a un dispositivo.], [RF-Ob31], [NI],
  [TS-32], [Verificare che il sistema mostri le informazioni essenziali del singolo asset all'interno della lista.], [RF-Ob32], [NI],
  [TS-33], [Verificare che il sistema mostri il nome del singolo asset all'interno della lista.], [RF-Ob33], [NI],
  [TS-34], [Verificare che il sistema mostri il tipo del singolo asset all'interno della lista.], [RF-Ob34], [NI],
  [TS-35], [Verificare che il sistema mostri lo stato di valutazione del singolo asset all'interno della lista.], [RF-Ob35], [NI],
  [TS-36], [Verificare che l'utente possa visualizzare in dettaglio tutte le informazioni di un singolo asset selezionato.], [RF-Ob36], [NI],
  [TS-37], [Verificare che il sistema mostri nel dettaglio il nome dell'asset selezionato.], [RF-Ob37], [NI],
  [TS-38], [Verificare che il sistema mostri nel dettaglio il tipo dell'asset selezionato.], [RF-Ob38], [NI],
  [TS-39], [Verificare che il sistema mostri nel dettaglio la descrizione dell'asset selezionato.], [RF-Ob39], [NI],
  [TS-40], [Verificare che il sistema mostri nel dettaglio la sensibilità dell'asset selezionato.], [RF-Ob40], [NI],
  [TS-41], [Verificare che il sistema mostri lo stato complessivo di valutazione dell'asset selezionato.], [RF-Ob41], [NI],
  [TS-42], [Verificare che il sistema mostri la lista dei requisiti (ACM e AUM) da valutare associati all'asset.], [RF-Ob42], [NI],
  [TS-43], [Verificare che il sistema mostri il codice identificativo e lo stato di valutazione di ogni requisito nella lista.], [RF-Ob43], [NI],
  [TS-44], [Verificare che l'utente possa eliminare definitivamente un asset da un dispositivo.], [RF-Ob44], [NI],
)

#pagebreak()

=== Esecuzione della valutazione

#test-table(
  [Test di Sistema — Esecuzione della valutazione],
  [TS-45], [Verificare che l'utente possa eseguire una sessione di valutazione di conformità per un dispositivo.], [RF-Ob45], [NI],
  [TS-46], [Verificare che il sistema mostri una dashboard di valutazione con la lista degli asset, il loro stato e il progresso in tempo reale.], [RF-Ob46], [NI],
  [TS-47], [Verificare che l'utente possa selezionare e avviare la valutazione dei requisiti di un singolo asset.], [RF-Ob47], [NI],
  [TS-48], [Verificare che il sistema mostri il codice e il nome del requisito selezionato prima dell'avvio del decision tree.], [RF-Ob48], [NI],
  [TS-49], [Verificare che il sistema mostri le dipendenze del requisito selezionato e il loro stato prima dell'esecuzione.], [RF-Ob49], [NI],
  [TS-50], [Verificare che il sistema guidi l'utente eseguendo il decision tree associato al requisito selezionato.], [RF-Ob50], [NI],
  [TS-51], [Verificare che il sistema mostri il codice univoco e il testo della domanda del nodo corrente dell'albero.], [RF-Ob51], [NI],
  [TS-52], [Verificare che il sistema registri la risposta dell'utente avanzando il percorso sul grafo.], [RF-Ob52], [NI],
  [TS-53], [Verificare che il sistema gestisca la risposta affermativa ("Yes") spostando il flusso sul relativo ramo.], [RF-Ob53], [NI],
  [TS-54], [Verificare che il sistema gestisca la risposta negativa ("No") spostando il flusso sul relativo ramo.], [RF-Ob54], [NI],
  [TS-55], [Verificare che il sistema visualizzi a schermo il grafo completo del decision tree durante l'esecuzione.], [RF-Ob55], [NI],
  [TS-56], [Verificare che il sistema evidenzi graficamente nel grafo il nodo corrente e il percorso già intrapreso.], [RF-Ob56], [NI],
  [TS-57], [Verificare che il sistema mostri un nodo foglia con l'esito (PASS, FAIL, NOT APPLICABLE) al termine del percorso.], [RF-Ob57], [NI],
  [TS-58], [Verificare che il sistema generi un file JSON contenente lo stato della sessione di valutazione per il download.], [RF-Ob58], [NI],
  [TS-59], [Verificare che l'utente possa caricare un file di sessione per riprendere un test interrotto.], [RF-Ob59], [NI],
  [TS-60], [Verificare che il sistema mostri una schermata finale con il riepilogo complessivo di tutti gli esiti del test.], [RF-Ob60], [NI],
  [TS-61], [Verificare che il sistema mostri per ogni asset la lista dei requisiti completati e il percorso logico seguito.], [RF-Ob61], [NI],
  [TS-62], [Verificare che il sistema mostri la sequenza ordinata di domande e risposte fornite per un requisito completato.], [RF-Ob62], [NI],
  [TS-63], [Verificare che l'utente possa uscire anticipatamente da una sessione di valutazione in corso.], [RF-Ob66], [NI],
  [TS-64], [Verificare che il sistema mostri il riepilogo degli esiti per ogni singolo asset al termine del test.], [RF-Ob67], [NI],
  [TS-65], [Verificare che l'utente possa salvare la sessione di valutazione in corso, generando un file con lo stato della sessione.], [RF-Ob68], [NI],
  [TS-66], [Verificare che il sistema generi un report di conformità finale contenente, per ogni coppia asset-requisito, l'esito del requisito, l'esito aggregato del decision tree e il percorso logico seguito.], [RF-Ob77], [NI],
)

#pagebreak()

=== Gestione dei decision tree

#test-table(
  [Test di Sistema — Gestione dei decision tree],
  [TS-67], [Verificare che il sistema mostri l'elenco dei decision tree disponibili memorizzati.], [RF-Ob63], [NI],
  [TS-68], [Verificare che il sistema mostri l'ID e il nome del requisito per ogni decision tree in elenco.], [RF-Ob64], [NI],
  [TS-69], [Verificare che l'utente possa visualizzare in dettaglio un decision tree esistente, mostrandone l'identificativo e il nome del requisito associato.], [RF-Ob65], [NI],
  [TS-70], [Verificare che il sistema visualizzi il grafo del decision tree nel dettaglio, mostrando nodi interni, nodi foglia con esito e collegamenti fra nodi.], [RF-Ob69], [NI],
  [TS-71], [Verificare che il sistema mostri i nodi interni del grafo del decision tree, con il relativo codice univoco e il testo della domanda.], [RF-Ob70], [NI],
  [TS-72], [Verificare che il sistema mostri i nodi foglia del grafo del decision tree, con l'esito associato (PASS, FAIL, NOT APPLICABLE).], [RF-Ob71], [NI],
  [TS-73], [Verificare che il sistema mostri i collegamenti fra i nodi del grafo del decision tree, con l'etichetta Yes/No associata a ciascun ramo.], [RF-Ob72], [NI],
  [TS-74], [Verificare che il sistema mostri le dipendenze del decision tree, elencando i requisiti da cui esso dipende con il relativo codice.], [RF-Ob73], [NI],
  [TS-75], [Verificare che l'utente possa esportare un decision tree in formato JSON o CSV.], [RF-Ob74], [NI],
  [TS-76], [Verificare che l'utente possa esportare un decision tree in formato JSON.], [RF-Ob75], [NI],
  [TS-77], [Verificare che l'utente possa esportare un decision tree in formato CSV.], [RF-Ob76], [NI],
)

#pagebreak()

=== Funzionalità desiderabili

#test-table(
  [Test di Sistema — Funzionalità desiderabili],
  [TS-78], [Verificare che l'utente possa annullare la procedura di inserimento di un dispositivo, ripristinando lo stato precedente.], [RF-D01], [NI],
  [TS-79], [Verificare che l'utente possa annullare la procedura di modifica di un dispositivo, scartando i dati inseriti e mantenendo quelli preesistenti.], [RF-D02], [NI],
  [TS-80], [Verificare che l'utente possa annullare la procedura di eliminazione di un dispositivo durante la fase di richiesta di conferma.], [RF-D03], [NI],
  [TS-81], [Verificare che l'utente possa annullare la procedura di inserimento di un asset, ripristinando lo stato precedente.], [RF-D04], [NI],
  [TS-82], [Verificare che l'utente possa annullare la procedura di modifica di un asset, scartando le modifiche non salvate.], [RF-D05], [NI],
  [TS-83], [Verificare che l'utente possa annullare la procedura di eliminazione di un asset durante la fase di richiesta di conferma.], [RF-D06], [NI],
  [TS-84], [Verificare che l'utente possa navigare al nodo precedente del decision tree, visualizzando la risposta già fornita senza invalidare le risposte successive.], [RF-D07], [NI],
  [TS-85], [Verificare che l'utente possa effettuare il salvataggio intermedio dello stato della sessione di valutazione.], [RF-D08], [NI],
  [TS-86], [Verificare che l'utente possa navigare verso il nodo successivo precedentemente già risposto durante l'esecuzione del decision tree.], [RF-D09], [NI],
  [TS-87], [Verificare che l'utente possa modificare la risposta a un nodo già risposto, invalidando le risposte successive al nodo corrente.], [RF-D10], [NI],
  [TS-88], [Verificare che l'utente possa modificare le informazioni anagrafiche di un dispositivo esistente.], [RF-D11], [NI],
  [TS-89], [Verificare che l'utente possa modificare il nome del dispositivo.], [RF-D12], [NI],
  [TS-90], [Verificare che l'utente possa modificare il sistema operativo del dispositivo.], [RF-D13], [NI],
  [TS-91], [Verificare che l'utente possa modificare la descrizione del dispositivo.], [RF-D14], [NI],
  [TS-92], [Verificare che l'utente possa modificare le informazioni di un asset esistente.], [RF-D15], [NI],
  [TS-93], [Verificare che l'utente possa modificare il nome dell'asset.], [RF-D16], [NI],
  [TS-94], [Verificare che l'utente possa modificare il tipo dell'asset tramite opzioni predefinite.], [RF-D17], [NI],
  [TS-95], [Verificare che l'utente possa modificare la descrizione dell'asset.], [RF-D18], [NI],
  [TS-96], [Verificare che l'utente possa modificare la sensibilità dell'asset.], [RF-D19], [NI],
  [TS-97], [Verificare che l'utente possa importare e validare strutturalmente un nuovo decision tree da file.], [RF-D20], [NI],
  [TS-98], [Verificare che l'utente possa selezionare il file sorgente per l'importazione di un decision tree.], [RF-D21], [NI],
  [TS-99], [Verificare che il sistema supporti l'importazione di un decision tree da file in formato JSON.], [RF-D22], [NI],
  [TS-100], [Verificare che il sistema supporti l'importazione di un decision tree da file in formato CSV.], [RF-D23], [NI],
)

#pagebreak()

=== Funzionalità opzionali

#test-table(
  [Test di Sistema — Funzionalità opzionali],
  [TS-101], [Verificare che il sistema mostri la notifica dell'avvenuto salvataggio intermedio della sessione di valutazione.], [RF-Op01], [NI],
  [TS-102], [Verificare che l'utente possa aggiungere manualmente una dipendenza tra requisiti all'interno di un decision tree.], [RF-Op02], [NI],
  [TS-103], [Verificare che l'utente possa rimuovere una dipendenza tra requisiti da un decision tree.], [RF-Op03], [NI],
  [TS-104], [Verificare che il sistema blocchi l'aggiunta e notifichi l'utente se il requisito selezionato crea una dipendenza circolare.], [RF-Op04], [NI],
  [TS-105], [Verificare che l'utente possa aggiungere un nuovo nodo all'interno di un decision tree.], [RF-Op05], [NI],
  [TS-106], [Verificare che l'utente possa inserire un codice univoco per il nuovo nodo.], [RF-Op06], [NI],
  [TS-107], [Verificare che l'utente possa inserire il testo della domanda del nuovo nodo.], [RF-Op07], [NI],
  [TS-108], [Verificare che l'utente possa eliminare un nodo esistente da un decision tree.], [RF-Op08], [NI],
  [TS-109], [Verificare che il sistema impedisca la creazione di collegamenti duplicati mostrando una notifica di errore.], [RF-Op09], [NI],
  [TS-110], [Verificare che il sistema validi la struttura dell'albero modificato secondo i vincoli di consistenza predefiniti.], [RF-Op10], [NI],
  [TS-111], [Verificare che il sistema impedisca il salvataggio e mostri un errore se l'albero non è binario o mancano foglie PASS/FAIL.], [RF-Op11], [NI],
  [TS-112], [Verificare che il sistema impedisca l'eliminazione del nodo radice di un decision tree mostrando un errore.], [RF-Op12], [NI],
  [TS-113], [Verificare che l'utente possa eliminare definitivamente un decision tree.], [RF-Op13], [NI],
  [TS-114], [Verificare che il sistema blocchi l'inserimento e mostri un messaggio di errore se il codice del nodo è già presente nel decision tree.], [RF-Op14], [NI],
  [TS-115], [Verificare che l'utente possa assegnare un esito (PASS, FAIL o NOT APPLICABLE) ai rami non collegati di un nodo appena aggiunto o modificato nel decision tree, trasformandoli in nodi foglia.], [RF-Op15], [NI],
  [TS-116], [Verificare che l'utente possa annullare le modifiche effettuate su un decision tree, ripristinando lo stato iniziale del grafo.], [RF-Op16], [NI],
  [TS-117], [Verificare che l'utente possa modificare la destinazione di un collegamento tra nodi (Yes/No).], [RF-Op17], [NI],
  [TS-118], [Verificare che l'utente possa modificare strutturalmente un decision tree esistente.], [RF-Op18], [NI],
  [TS-119], [Verificare che l'utente possa scaricare il report di conformità finale in formato PDF.], [RF-Op19], [NI],
  [TS-120], [Verificare che l'utente possa scaricare il report di conformità finale in formato JSON.], [RF-Op20], [NI],
  [TS-121], [Verificare che l'utente possa scaricare il report di conformità finale in formato CSV.], [RF-Op21], [NI],
  [TS-122], [Verificare che il sistema mostri la giustificazione testuale del risultato raggiunto al termine dell'esecuzione del decision tree.], [RF-Op22], [NI],
  [TS-123], [Verificare che l'utente possa inserire una giustificazione testuale per l'esito della coppia asset-requisito al termine dell'esecuzione del decision tree.], [RF-Op23], [NI],
)

#pagebreak()

== Tracciamento test di sistema

La seguente tabella riporta il tracciamento bidirezionale completo: ogni test di sistema è associato al requisito funzionale che verifica e, attraverso di esso, al caso d'uso dell'Analisi dei Requisiti da cui il requisito deriva. La corrispondenza uno-a-uno tra test e requisiti garantisce la copertura totale dei requisiti funzionali (77 obbligatori, 23 desiderabili, 23 opzionali).

#let tracc-table(..rows) = table(
  columns: (1.6cm, 2.6cm, 1fr),
  align: (center, center, left),
  stroke: (x, y) => (
    bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
    left: 0.4pt + luma(150),
    right: if x == 2 { 0.4pt + luma(150) } else { none },
    top: if y == 0 { 0.4pt + luma(150) } else { none },
  ),
  inset: 6pt,
  fill: (x, y) => if y == 0 { luma(230) } else { none },
  [*Test*], [*Requisito*], [*Caso d'uso*],
  ..rows.pos(),
)

#figure(
  tracc-table(
    [TS-01], [RF-Ob01], [UC-1],
    [TS-02], [RF-Ob02], [UC-2],
    [TS-03], [RF-Ob03], [UC-2.1],
    [TS-04], [RF-Ob04], [UC-2.1.1],
    [TS-05], [RF-Ob05], [UC-2.1.2],
    [TS-06], [RF-Ob06], [UC-2],
    [TS-07], [RF-Ob07], [UC-3],
    [TS-08], [RF-Ob08], [UC-4],
    [TS-09], [RF-Ob09], [UC-4.1],
    [TS-10], [RF-Ob10], [UC-4.1.1],
    [TS-11], [RF-Ob11], [UC-4.1.2],
    [TS-12], [RF-Ob12], [UC-4.1.3],
    [TS-13], [RF-Ob13], [UC-5],
    [TS-14], [RF-Ob14], [UC-7],
    [TS-15], [RF-Ob15], [UC-7.1],
    [TS-16], [RF-Ob16], [UC-7.2],
    [TS-17], [RF-Ob17], [UC-7.3],
    [TS-18], [RF-Ob18], [UC-7.4],
    [TS-19], [RF-Ob19], [UC-10],
    [TS-20], [RF-Ob20], [UC-10.1],
    [TS-21], [RF-Ob21], [UC-10.2],
    [TS-22], [RF-Ob22], [UC-11],
    [TS-23], [RF-Ob23], [UC-11.1],
    [TS-24], [RF-Ob24], [UC-11.2],
    [TS-25], [RF-Ob25], [UC-12],
    [TS-26], [RF-Ob26], [UC-12.1],
    [TS-27], [RF-Ob27], [UC-12.1.1],
    [TS-28], [RF-Ob28], [UC-12.1.2],
    [TS-29], [RF-Ob29], [UC-12.1.3],
    [TS-30], [RF-Ob30], [UC-12.1.4],
    [TS-31], [RF-Ob31], [UC-14],
    [TS-32], [RF-Ob32], [UC-14.1],
    [TS-33], [RF-Ob33], [UC-14.1.1],
    [TS-34], [RF-Ob34], [UC-14.1.2],
    [TS-35], [RF-Ob35], [UC-14.1.3],
    [TS-36], [RF-Ob36], [UC-15, UC-20.1],
    [TS-37], [RF-Ob37], [UC-15.1],
    [TS-38], [RF-Ob38], [UC-15.2],
    [TS-39], [RF-Ob39], [UC-15.3],
    [TS-40], [RF-Ob40], [UC-15.4],
    [TS-41], [RF-Ob41], [UC-15.5],
    [TS-42], [RF-Ob42], [UC-15.6, UC-20.2],
    [TS-43], [RF-Ob43], [UC-15.6.1, UC-20.2.1],
    [TS-44], [RF-Ob44], [UC-18],
    [TS-45], [RF-Ob45], [UC-19],
    [TS-46], [RF-Ob46], [UC-19.1],
    [TS-47], [RF-Ob47], [UC-20],
    [TS-48], [RF-Ob48], [UC-21],
    [TS-49], [RF-Ob49], [UC-21.1],
    [TS-50], [RF-Ob50], [UC-22],
    [TS-51], [RF-Ob51], [UC-22.1],
    [TS-52], [RF-Ob52], [UC-22.3],
    [TS-53], [RF-Ob53], [UC-22.3.1],
    [TS-54], [RF-Ob54], [UC-22.3.2],
    [TS-55], [RF-Ob55], [UC-22.2],
    [TS-56], [RF-Ob56], [UC-22.2],
    [TS-57], [RF-Ob57], [UC-23],
    [TS-58], [RF-Ob58], [UC-25],
    [TS-59], [RF-Ob59], [UC-26],
    [TS-60], [RF-Ob60], [UC-27],
    [TS-61], [RF-Ob61], [UC-27.1.1],
    [TS-62], [RF-Ob62], [UC-27.1.1.1],
    [TS-63], [RF-Ob66], [UC-24],
    [TS-64], [RF-Ob67], [UC-27.1],
    [TS-65], [RF-Ob68], [UC-25],
    [TS-66], [RF-Ob77], [UC-28],
    [TS-67], [RF-Ob63], [UC-29],
    [TS-68], [RF-Ob64], [UC-29.1],
    [TS-69], [RF-Ob65], [UC-30],
    [TS-70], [RF-Ob69], [UC-30.1],
    [TS-71], [RF-Ob70], [UC-30.1.1],
    [TS-72], [RF-Ob71], [UC-30.1.2],
    [TS-73], [RF-Ob72], [UC-30.1.3],
    [TS-74], [RF-Ob73], [UC-30.2],
    [TS-75], [RF-Ob74], [UC-38],
    [TS-76], [RF-Ob75], [UC-38.1],
    [TS-77], [RF-Ob76], [UC-38.2],
    [TS-78], [RF-D01], [UC-6],
    [TS-79], [RF-D02], [UC-9],
    [TS-80], [RF-D03], [UC-11],
    [TS-81], [RF-D04], [UC-13],
    [TS-82], [RF-D05], [UC-17],
    [TS-83], [RF-D06], [UC-18],
    [TS-84], [RF-D07], [UC-22.4],
    [TS-85], [RF-D08], [UC-25],
    [TS-86], [RF-D09], [UC-22.5],
    [TS-87], [RF-D10], [UC-22.6],
    [TS-88], [RF-D11], [UC-8],
    [TS-89], [RF-D12], [UC-8.1],
    [TS-90], [RF-D13], [UC-8.2],
    [TS-91], [RF-D14], [UC-8.3],
    [TS-92], [RF-D15], [UC-16],
    [TS-93], [RF-D16], [UC-16.1],
    [TS-94], [RF-D17], [UC-16.2],
    [TS-95], [RF-D18], [UC-16.3],
    [TS-96], [RF-D19], [UC-16.4],
    [TS-97], [RF-D20], [UC-42],
    [TS-98], [RF-D21], [UC-42.1],
    [TS-99], [RF-D22], [UC-42.1.1],
    [TS-100], [RF-D23], [UC-42.1.2],
    [TS-101], [RF-Op01], [UC-25],
    [TS-102], [RF-Op02], [UC-40],
    [TS-103], [RF-Op03], [UC-41],
    [TS-104], [RF-Op04], [UC-40.1],
    [TS-105], [RF-Op05], [UC-32],
    [TS-106], [RF-Op06], [UC-32.1],
    [TS-107], [RF-Op07], [UC-32.2],
    [TS-108], [RF-Op08], [UC-33],
    [TS-109], [RF-Op09], [UC-35],
    [TS-110], [RF-Op10], [UC-36],
    [TS-111], [RF-Op11], [UC-36],
    [TS-112], [RF-Op12], [UC-39],
    [TS-113], [RF-Op13], [UC-43],
    [TS-114], [RF-Op14], [UC-32.1.1],
    [TS-115], [RF-Op15], [UC-32.3],
    [TS-116], [RF-Op16], [UC-37],
    [TS-117], [RF-Op17], [UC-34],
    [TS-118], [RF-Op18], [UC-31],
    [TS-119], [RF-Op19], [UC-28.1],
    [TS-120], [RF-Op20], [UC-28.2],
    [TS-121], [RF-Op21], [UC-28.3],
    [TS-122], [RF-Op22], [UC-23],
    [TS-123], [RF-Op23], [UC-23.1],
  ),
  caption: [Tracciamento Test di Sistema → Requisito → Caso d'uso],
  supplement: [Tabella],
)

== Test di Accettazione

I test di accettazione validano il prodotto finale rispetto ai requisiti concordati con il proponente Bluewind S.r.l. A differenza dei test di sistema, che verificano i singoli requisiti in modo atomico, i test di accettazione raggruppano flussi operativi completi e sono condotti in collaborazione con il proponente al termine dello sviluppo. La colonna "Requisito" riporta i principali requisiti funzionali coperti da ciascuno scenario.

#test-table(
  [Test di Accettazione],
  [TA-01], [Verificare che l'utente possa inserire manualmente un nuovo dispositivo fornendo tutti i dati richiesti e che il sistema lo registri correttamente.],                                             [RF-Ob08, RF-Ob09, RF-Ob13], [NI],
  [TA-02], [Verificare che l'utente possa importare un dispositivo da file e che il sistema gestisca correttamente i file con formato non valido.],                                                         [RF-Ob02, RF-Ob06, RF-Ob07], [NI],
  [TA-03], [Verificare che l'utente possa visualizzare, modificare ed eliminare i dati di un dispositivo.],                                                                                                [RF-Ob14, RF-D11, RF-Ob22], [NI],
  [TA-04], [Verificare che l'utente possa gestire completamente gli asset di un dispositivo (inserimento, visualizzazione, modifica, eliminazione).],                                                       [RF-Ob25, RF-Ob31, RF-D15, RF-Ob44], [NI],
  [TA-05], [Verificare che l'utente possa completare una sessione di valutazione di conformità EN 18031 navigando i decision tree per tutti gli asset.],                                                    [RF-Ob45, RF-Ob47, RF-Ob50], [NI],
  [TA-06], [Verificare che il sistema fornisca esiti corretti (PASS, FAIL, NOT APPLICABLE) per ogni coppia asset-requisito al termine della valutazione.],                                                  [RF-Ob57, RF-Ob60], [NI],
  [TA-07], [Verificare che l'utente possa salvare una sessione di valutazione in corso e riprenderla in un momento successivo dal punto di interruzione.],                                                  [RF-Ob68, RF-Ob59], [NI],
  [TA-08], [Verificare che l'utente possa esportare il report di conformità completo in formato PDF e in formato JSON.],                                                                                    [RF-Ob77, RF-Op19, RF-Op20], [NI],
  [TA-09], [Verificare che l'utente possa modificare la struttura di un decision tree (aggiunta, eliminazione, modifica di nodi e collegamenti) e che il sistema validi la struttura risultante.],         [RF-Op05, RF-Op08, RF-Op17, RF-Op10], [NI],
  [TA-10], [Verificare che l'utente possa esportare un decision tree nel formato previsto.],                                                                                                                [RF-Ob74], [NI],
)

/*== Test di Unità

I test di unità verificano il comportamento delle singole unità di codice (funzioni, metodi) in isolamento. Saranno definiti e implementati durante le attività della Product Baseline (PB).

== Test di Integrazione

I test di integrazione verificano la corretta interazione tra i componenti del sistema (frontend, backend, persistenza dei dati). Saranno definiti e implementati durante le attività della Product Baseline (PB).

== Test di Regressione

I test di regressione accertano che le modifiche apportate al codice durante lo sviluppo non introducano regressioni nelle funzionalità già verificate. Saranno definiti e implementati durante le attività della Product Baseline (PB).
*/
= Cruscotto di valutazione

La presente sezione costituisce il quadro di monitoraggio quantitativo del progetto e viene aggiornata iterativamente al termine di ogni sprint, registrando l'evoluzione delle metriche di qualità definite nella sezione 2 con il progredire delle attività. I dati economici e orari sono ricavati dal documento #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Progetto.pdf")[*Piano di Progetto*] #nota[(documento su branch feature, non ancora unito al main — non consultabile dal sito; il link verrà aggiornato al momento del merge)]; il Budget at Completion (BAC) del progetto è pari a *€ 10.680* per *522 ore* totali.

Le metriche che richiedono la disponibilità di codice sorgente — tra cui Code Coverage, Test Success Rate e le metriche di prodotto — vengono attivate non appena prendono avvio le corrispondenti attività di sviluppo, e saranno pertanto popolate progressivamente a partire dalla Product Baseline.

#let cruscotto-table(caption-text, headers, ..rows) = figure(
  table(
    columns: headers.len(),
    align: center,
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == headers.len() - 1 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else if calc.rem(y, 2) == 0 { luma(248) } else { none },
    ..headers.map(h => [*#h*]),
    ..rows.pos(),
  ),
  caption: caption-text,
  supplement: [Tabella],
)

== MPC-01, MPC-02, MPC-03 — Planned Value, Earned Value, Actual Cost

I valori sono cumulativi: ogni sprint riporta il totale progressivo dall'inizio del progetto. Poiché tutti e sei gli sprint si sono conclusi entro le date previste, l'Earned Value coincide con il Planned Value cumulativo.
#pagebreak()

#cruscotto-table(
  [Andamento di PV, EV e AC per sprint (valori cumulativi)],
  ("Sprint", "Fine sprint", "PV cum. (€)", "EV cum. (€)", "AC cum. (€)"),
  [1], [2026/04/21], [900],   [900],   [885],
  [2], [2026/05/01], [1.680], [1.680], [1.655],
  [3], [2026/05/15], [2.550], [2.550], [2.465],
  [4], [2026/05/29], [3.365], [3.365], [3.225],
  [5], [2026/06/12], [4.130], [4.130], [3.960],
  [6], [2026/06/26], [4.810], [4.810], [4.610],
)

#figure(
  image("../../../images/cruscotto/pv_ev_ac.png", width: 90%),
  caption: [Andamento di PV, EV e AC cumulativi per sprint],
  supplement: [Figura],
)

Tutti e sei gli sprint si sono conclusi entro le date previste (fine reale = fine prevista), confermando il pieno allineamento tra lavoro pianificato ed eseguito. I costi effettivi (AC) risultano sistematicamente inferiori al Planned Value, con uno scostamento cumulativo di €200 a favore del progetto al termine dello Sprint 6. Questo andamento indica una stima iniziale delle ore sostanzialmente accurata e una gestione del budget efficiente lungo tutta la fase RTB.

== MPC-04, MPC-05 — Schedule Performance Index, Cost Performance Index

SPI = EV / PV. CPI = EV / AC. Valori prossimi a 1 indicano rispetto di tempi e budget. Valori > 1 indicano risparmio.

#cruscotto-table(
  [Andamento di SPI e CPI per sprint],
  ("Sprint", "SPI", "Accettabile", "CPI", "Accettabile"),
  [1], [1,000], [$>= 0.9$ ✓], [1,017], [$>= 0.9$ ✓],
  [2], [1,000], [$>= 0.9$ ✓], [1,015], [$>= 0.9$ ✓],
  [3], [1,000], [$>= 0.9$ ✓], [1,034], [$>= 0.9$ ✓],
  [4], [1,000], [$>= 0.9$ ✓], [1,043], [$>= 0.9$ ✓],
  [5], [1,000], [$>= 0.9$ ✓], [1,043], [$>= 0.9$ ✓],
  [6], [1,000], [$>= 0.9$ ✓], [1,043], [$>= 0.9$ ✓],
)

#figure(
  image("../../../images/cruscotto/cpi_spi.png", width: 90%),
  caption: [Andamento di CPI e SPI per sprint],
  supplement: [Figura],
)

SPI = 1,000 in tutti e sei gli sprint: il team ha rispettato perfettamente le scadenze pianificate, senza mai accumulare ritardi. Il CPI, superiore all'unità in ogni sprint, evidenzia un costante risparmio di costo rispetto al lavoro prodotto, con un trend complessivamente crescente (da 1,017 a 1,043, dopo una lieve flessione a 1,015 nello Sprint 2). L'andamento omogeneo dei due indicatori suggerisce che le stime iniziali fossero realistiche e che l'esecuzione sia stata disciplinata.

== MPC-06 — Estimate at Completion

EAC = BAC / CPI. Rappresenta la stima del costo finale del progetto sulla base dell'efficienza attuale.

#cruscotto-table(
  [Andamento di EAC per sprint],
  ("Sprint", "CPI", "EAC (€)", "BAC (€)", "Scostamento", "Accettabile"),
  [1], [1,017], [10.502], [10.680], [-178 (-1,7%)], [$<= 1.1 times "BAC"$ (110%) ✓],
  [2], [1,015], [10.522], [10.680], [-158 (-1,5%)], [$<= 1.1 times "BAC"$ (110%) ✓],
  [3], [1,034], [10.329], [10.680], [-351 (-3,3%)], [$<= 1.1 times "BAC"$ (110%) ✓],
  [4], [1,043], [10.240], [10.680], [-440 (-4,1%)], [$<= 1.1 times "BAC"$ (110%) ✓],
  [5], [1,043], [10.240], [10.680], [-440 (-4,1%)], [$<= 1.1 times "BAC"$ (110%) ✓],
  [6], [1,043], [10.240], [10.680], [-440 (-4,1%)], [$<= 1.1 times "BAC"$ (110%) ✓],
)

#figure(
  image("../../../images/cruscotto/eac.png", width: 90%),
  caption: [Andamento dell'EAC rispetto al BAC per sprint],
  supplement: [Figura],
)

L'EAC si mantiene costantemente al di sotto del BAC (€10.680), con uno scostamento che cresce da −€178 (Sprint 1) a −€440 (Sprint 6) man mano che l'efficienza di costo si consolida. La tendenza decrescente dell'EAC indica che il progetto ha progressivamente migliorato la propria stima di costo finale, stabilizzandosi su un risparmio attorno al 4% del budget totale.

== MPC-07 — Estimate to Complete

ETC = EAC − AC. Rappresenta la stima del costo ancora necessario per portare a termine il progetto.

#cruscotto-table(
  [Andamento di ETC per sprint],
  ("Sprint", "ETC (€)", "Accettabile"),
  [1], [9.617], [$<= 10.775$ ✓],
  [2], [8.867], [$<= 9.928$ ✓],
  [3], [7.864], [$<= 9.037$ ✓],
  [4], [7.015], [$<= 8.201$ ✓],
  [5], [6.280], [$<= 7.392$ ✓],
  [6], [5.630], [$<= 6.677$ ✓],
)

L'ETC decresce regolarmente sprint dopo sprint (da €9.617 nello Sprint 1 a €5.630 nello Sprint 6), confermando la progressione costante delle attività e la corretta imputazione dei costi.

== MPC-08 — Requirements Stability Index

RSI = (NR − NRC) / NR, dove NR è il numero di requisiti definiti e NRC il numero di requisiti modificati dopo la loro introduzione. In questa fase i requisiti sono tracciati attraverso i casi d'uso dell'Analisi dei Requisiti, il cui numero è cresciuto progressivamente nei sei sprint (da 8 a 43), con un numero contenuto di modifiche retroattive documentate.

#cruscotto-table(
  [Andamento di RSI per sprint],
  ("Sprint", "Requisiti totali", "Requisiti modificati", "RSI", "Accettabile"),
  [1], [8],  [0], [1,000], [$>= 0.7$ ✓],
  [2], [26], [2], [0,923], [$>= 0.7$ ✓],
  [3], [34], [2], [0,941], [$>= 0.7$ ✓],
  [4], [42], [2], [0,952], [$>= 0.7$ ✓],
  [5], [43], [3], [0,930], [$>= 0.7$ ✓],
  [6], [43], [3], [0,930], [$>= 0.7$ ✓],
)

#figure(
  image("../../../images/cruscotto/rsi.png", width: 90%),
  caption: [Andamento del Requirements Stability Index per sprint],
  supplement: [Figura],
)

Nello Sprint 1 tutti gli otto requisiti iniziali sono risultati stabili (RSI = 1,000). Nello Sprint 2 due requisiti sui 26 definiti sono stati revisionati a seguito di un approfondimento delle specifiche EN 18031 durante la stesura dell'Analisi dei Requisiti (RSI = 0,923). Nello Sprint 3, con 34 requisiti totali e le stesse due modifiche pregresse non ripetute, l'indice è risalito a 0,941: la crescita del documento di analisi non ha comportato ulteriori instabilità retroattive. Nello Sprint 4 il documento è cresciuto fino a 42 casi d'uso senza nuove modifiche retroattive, portando l'indice a 0,952. Nello Sprint 5, durante la finalizzazione dell'Analisi dei Requisiti, il numero di casi d'uso si è assestato a 43 — l'UC-44, introdotto temporaneamente, è stato successivamente eliminato — ed è stato revisionato l'UC-31, con l'RSI a 0,930. Nello Sprint 6 non sono state apportate ulteriori modifiche ai casi d'uso e l'indice è rimasto stabile a 0,930, sempre ampiamente al di sopra della soglia di 0,7.

== MPC-09, MPC-10 — Indice di Gulpease, Correttezza Ortografica

#figure(
  image("../../../images/cruscotto/grafico_gulpease.png", width: 90%),
  caption: [Andamento dell'Indice di Gulpease dei documenti],
  supplement: [Figura],
)

Dal grafico si osserva un moderato miglioramento complessivo dell'Indice di Gulpease per la documentazione prodotta. Pur registrando una fisiologica flessione nella leggibilità di alcuni documenti divenuti più complessi, come le Norme di Progetto, a fronte di altri sensibilmente migliorati, come l'Analisi dei Requisiti, i valori si mantengono per tutti i testi al di sopra della soglia di accettabilità. Questo andamento riflette l'impegno del team nel preservare una buona chiarezza espositiva.

#figure(
  image("../../../images/cruscotto/grafico_errori_ortografici.png", width: 90%),
  caption: [Andamento degli errori ortografici nei documenti],
  supplement: [Figura],
)

L'analisi relativa agli errori ortografici evidenzia che il team ha curato con attenzione la revisione dei testi, mantenendo quasi tutta la documentazione formale priva di refusi. Si osserva che i verbali sono gli unici documenti a presentare un limitato numero di errori; ciò è un effetto naturale della loro maggiore frequenza di stesura, che rende fisiologicamente più probabile la presenza di qualche piccola disattenzione.

== MPC-11, MPC-12 — Test Success Rate, Code Coverage

Misurazione non disponibile in questa fase: sarà rilevata a partire dalla Product Baseline.

#pagebreak()

== MPC-13 — Quality Metrics Satisfied

Percentuale di metriche misurabili che rientrano nel range accettabile. Sono escluse dal calcolo: TSR e Code Coverage (MPC-11, MPC-12), non applicabili in assenza di codice prodotto; Correttezza Ortografica (MPC-10), non ancora monitorata con strumento automatico; Indice di Gulpease (MPC-09), non ancora misurabile in questa fase perché i documenti RTB non sono stati ancora mergiati nel branch main.

#cruscotto-table(
  [Andamento di Quality Metrics Satisfied per sprint],
  ("Sprint", "Metriche misurabili", "Metriche soddisfatte", "QMS", "Accettabile"),
  [1], [9], [9], [100%], [$>= 80%$ ✓],
  [2], [9], [9], [100%], [$>= 80%$ ✓],
  [3], [9], [9], [100%], [$>= 80%$ ✓],
  [4], [9], [9], [100%], [$>= 80%$ ✓],
  [5], [9], [9], [100%], [$>= 80%$ ✓],
  [6], [9], [9], [100%], [$>= 80%$ ✓],
)

#figure(
  image("../../../images/cruscotto/qms.png", width: 90%),
  caption: [Andamento del Quality Metrics Satisfied per sprint],
  supplement: [Figura],
)

Il Quality Metrics Satisfied è rimasto al 100% in tutti e sei gli sprint: ogni metrica inclusa nel computo ha rispettato la propria soglia di accettazione. Le nove metriche considerate sono MPC-01..08 e MPC-14 (metriche EVM, RSI e Time Efficiency). Nella Product Baseline la base di calcolo si amplierà includendo TSR, Code Coverage, Gulpease e le metriche di prodotto: il QMS andrà monitorato con maggiore attenzione in quella fase.

#pagebreak()

== MPC-14 — Time Efficiency

Time Efficiency (TE) = (Ore Previste Cumulative / Ore Effettive Cumulative) × 100. Misura se il team sta rispettando le stime orarie pianificate.

#cruscotto-table(
  [Andamento di Time Efficiency per sprint],
  ("Sprint", "Ore prev. cum.", "Ore eff. cum.", "TE", "Accettabile"),
  [1], [41],  [41],  [100,0%], [$>= 80%$ ✓],
  [2], [75],  [75],  [100,0%], [$>= 80%$ ✓],
  [3], [115], [112], [102,7%], [$>= 80%$ ✓],
  [4], [150], [145], [103,4%], [$>= 80%$ ✓],
  [5], [187], [181], [103,3%], [$>= 80%$ ✓],
  [6], [226], [218], [103,7%], [$>= 80%$ ✓],
)

#figure(
  image("../../../images/cruscotto/time_efficiency.png", width: 90%),
  caption: [Andamento della Time Efficiency per sprint],
  supplement: [Figura],
)

La Time Efficiency si mantiene tra il 100,0% (Sprint 1 e 2) e il 103,7% (Sprint 6), sempre ampiamente al di sopra della soglia dell'80%. Su base cumulativa il team ha impiegato 218 ore effettive a fronte delle 226 preventivate (−8 ore, circa il 3,5% in meno): uno scostamento contenuto e a favore del progetto, indicativo di una buona affidabilità delle stime.

== Metriche di qualità di prodotto (MPD)

Le metriche di prodotto definite nella sezione 2 non sono misurabili in questa fase: nessuna linea di codice è stata ancora prodotta e il prodotto software non esiste ancora in forma eseguibile. La tabella seguente riporta lo stato attuale di ciascuna metrica.

#figure(
  table(
    columns: (2cm, 1fr, 4cm),
    align: (center, left, center),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 2 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else if calc.rem(y, 2) == 0 { luma(248) } else { none },
    [*Codice*], [*Metrica*], [*Stato RTB*],
    [MPD-01], [Requisiti obbligatori soddisfatti],  [Non disponibile],
    [MPD-02], [Requisiti desiderabili soddisfatti],  [Non disponibile],
    [MPD-03], [Requisiti opzionali soddisfatti],     [Non disponibile],
    [MPD-04], [Failure Density],                     [Non disponibile],
    [MPD-05], [Statement Coverage],                  [Non disponibile],
    [MPD-06], [Branch Coverage],                     [Non disponibile],
    [MPD-07], [Error Rate],                          [Non disponibile],
    [MPD-08], [Time to Complete Task],               [Non disponibile],
    [MPD-09], [Response Time],                       [Non disponibile],
    [MPD-10], [Coefficient of Coupling],             [Non disponibile],
    [MPD-11], [Cyclomatic Complexity],               [Non disponibile],
    [MPD-12], [Instability Index],                   [Non disponibile],
    [MPD-13], [Code Smell],                          [Non disponibile],
  ),
  caption: [Stato delle metriche di prodotto in fase RTB],
  supplement: [Tabella],
)

Tutte le misurazioni relative a funzionalità, affidabilità, usabilità, efficienza e manutenibilità del prodotto saranno rilevate a partire dalla Product Baseline, contestualmente all'avvio delle attività di sviluppo e all'implementazione del Proof of Concept.

= Automiglioramento

Il processo di automiglioramento è il meccanismo con cui il team Coderius analizza periodicamente la propria efficacia, identifica le criticità emerse durante ogni sprint e definisce azioni correttive concrete da applicare negli sprint successivi. Le informazioni riportate in questa sezione provengono dalle retrospettive di sprint documentate nel #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Esterni/Piano_di_Progetto.pdf")[*Piano di Progetto*] #nota[(documento su branch feature, non ancora unito al main — non consultabile dal sito; il link verrà aggiornato al momento del merge)].

== Sprint 1 — Retrospettiva e azioni correttive

=== Problemi rilevati

Durante il primo sprint (03/04–21/04/2026) il team ha identificato tre criticità principali:

- *RO-1 — Stime non accurate*: le stime iniziali delle ore per alcune attività si sono rivelate ottimistiche, portando a una distribuzione del lavoro non uniforme tra i componenti del team.
- *RT-2 — Difficoltà di comprensione dello standard EN 18031*: la complessità del dominio applicativo ha rallentato le fasi di analisi, rendendo necessario uno studio aggiuntivo non pianificato.
- *RI-1 — Disponibilità personale variabile*: impegni accademici e personali di alcuni membri hanno ridotto la loro disponibilità effettiva rispetto a quanto dichiarato in fase di pianificazione.

=== Azioni intraprese

Il team ha discusso questi problemi nella riunione di retrospettiva e ha concordato le seguenti misure:

- Adottare un approccio iterativo alle stime, rivedendo le previsioni orarie all'inizio di ogni sprint sulla base dei dati storici disponibili.
- Dedicare nella prima settimana di ogni sprint un momento collettivo di studio del dominio EN 18031, distribuendo i capitoli dello standard tra i componenti e condividendo i risultati in una riunione sincrona.
- Raccogliere le disponibilità effettive di ciascun componente prima di assegnare i task, anziché basarsi su disponibilità dichiarate a inizio progetto.

== Sprint 2 — Retrospettiva e azioni correttive

=== Problemi rilevati

Nel secondo sprint (21/04–01/05/2026) è emersa una criticità organizzativa:

- *RO-1 — Stime non accurate (duplicazione del ruolo di Amministratore)*: due componenti del team hanno ricoperto simultaneamente il ruolo di Amministratore, generando sovrapposizioni nelle responsabilità e un'allocazione delle ore superiore al previsto per quel ruolo.

Si tratta di una ricorrenza del rischio RO-1 già emerso nello Sprint 1: le azioni di mitigazione sulle stime introdotte nel primo sprint hanno richiesto questo ulteriore raffinamento per risultare pienamente efficaci.

=== Azioni intraprese

Il team ha stabilito che solo determinati ruoli chiave, come quello di Amministratore, vengano limitati a un singolo componente per sprint, in modo da evitare sovrapposizioni di responsabilità e conflitti. I ruoli operativi e di revisione, come Verificatore e Programmatore, possono invece essere assegnati contemporaneamente a più membri, così da parallelizzare il lavoro e aumentarne la produttività.

== Sprint 3 — Retrospettiva e azioni correttive

=== Problemi rilevati

Nel terzo sprint (01/05–15/05/2026) il team ha riscontrato una criticità legata al coordinamento tra gli Analisti:

- *RO-4 — Disallineamento nella scrittura dei casi d'uso*: i componenti che ricoprivano il ruolo di Analista hanno prodotto sezioni dell'Analisi dei Requisiti con stili e livelli di dettaglio difformi, rendendo necessarie sessioni di revisione e riscrittura parziale di alcune UC.

=== Azioni intraprese

Il team ha concordato di introdurre riunioni di allineamento preventive all'inizio di ogni ciclo di analisi, in cui gli Analisti definiscono collettivamente la granularità e il formato dei casi d'uso prima di procedere con la redazione individuale. Inoltre è stato formalizzato un template di UC condiviso nelle Norme di Progetto, in modo da ridurre la variabilità stilistica tra i contributi dei diversi autori.

== Sprint 4 — Retrospettiva e azioni correttive

=== Problemi rilevati

- RI-3 (Errori nei verbali): Sono state rilevate imprecisioni formali in alcuni verbali, che hanno richiesto tempo aggiuntivo non pianificato per la correzione.
- RI-1 (Ridotta disponibilità): Calo del tempo utile di alcuni membri a causa del carico accademico e dell'avvicinarsi della sessione estiva.
- RT-1 (Complessità casi d'uso): Difficoltà nella definizione degli ultimi scenari dell'Analisi dei Requisiti e nella loro corretta modellazione nei diagrammi UML.

=== Azioni intraprese

- Correzione e allineamento: Corretti i verbali errati e ottimizzate le procedure di stesura tramite confronti di gruppo per prevenire future imprecisioni.
- Coordinamento flessibile: Riorganizzati i task in modo più elastico per garantire la continuità del lavoro ordinario (Glossario, verbali e terzo Diario di Bordo).
- Supporto esterno per l'AdR: Effettuato un colloquio con il professore Cardin per risolvere i dubbi su UC e UML, completando così la ristrutturazione dell'Analisi dei Requisiti.
- Qualità e prototipazione: Strutturata la base del Piano di Qualifica (metriche e criteri) da parte dell'Amministratore e realizzato il mock-up grafico preliminare per la proponente.
== Sprint 5 — Retrospettiva e azioni correttive

=== Problemi rilevati

Nel quinto sprint (29/05–12/06/2026) il team ha riscontrato una nuova occorrenza di una criticità già emersa in precedenza:

- *RI-3 — Errori di tracciabilità nei verbali esterni*: a seguito di un'ulteriore verifica sono stati rilevati errori che compromettevano la tracciabilità di alcuni verbali esterni, rendendo necessario un intervento di allineamento redazionale.

Si segnala inoltre che i rischi attesi *RI-1* (ridotta disponibilità) e *RO-2* (attività incompiute), individuati in fase di pianificazione, non si sono concretizzati: il team ha mantenuto una disponibilità adeguata e ha completato l'intero carico di lavoro nei tempi previsti.

=== Azioni intraprese

- Il team è intervenuto tempestivamente per ripristinare la coerenza redazionale dei verbali esterni, estendendo a essi le medesime procedure di revisione già adottate per i verbali interni nello sprint precedente.
- La correzione è stata gestita durante una riunione di allineamento dedicata, così da risolvere le imprecisioni entro la chiusura dello sprint senza impatti sulle altre attività.

== Sprint 6 — Retrospettiva e azioni correttive

=== Problemi rilevati

Nel sesto sprint (13/06–26/06/2026), collocato in piena sessione estiva degli esami, sono emerse due criticità:

- *RI-1 — Ridotta disponibilità per impegni accademici*: la concomitanza con la sessione d'esami ha sottratto tempo al progetto, riducendo la disponibilità di alcuni membri e rendendo difficoltoso lavorare in modo continuativo.
- *RO-4 — Difficoltà di coordinamento*: la difficoltà a far coincidere gli impegni personali dei membri ha reso complicato organizzare momenti di lavoro condiviso, in un periodo critico in vista della consegna dell'RTB.

=== Azioni intraprese

- Per assorbire la riduzione di disponibilità, lo sprint è stato prorogato da una a due settimane, così da completare tutte le attività necessarie alla consegna dell'RTB senza comprometterne la qualità.
- Le attività sono state ridistribuite con maggiore flessibilità sulle date di completamento interne, mantenendo invariata la scadenza dello sprint.
- Il coordinamento è stato rafforzato attraverso i canali di comunicazione rapidi (WhatsApp e Discord), per allineare il lavoro anche al di fuori dei meeting prefissati.

== Valutazione sugli strumenti di lavoro

Oltre alle criticità organizzative analizzate sprint per sprint, il team ha valutato periodicamente l'efficacia degli strumenti di lavoro adottati durante la fase RTB, introducendo miglioramenti dove necessario.

#figure(
  table(
    columns: (3.5cm, 1fr, 1fr),
    align: (left, left, left),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 2 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    [*Strumento*], [*Valutazione*], [*Azione di miglioramento*],
    [GitHub e Issue Tracking System], [Il tracciamento delle attività tramite GitHub Projects ha garantito una buona visibilità sull'avanzamento dei task.], [Affinamento dell'Issue Tracking System nello Sprint 3 per una migliore categorizzazione e organizzazione delle attività.],
    [GitHub Actions (CI)], [La pipeline compila automaticamente i documenti Typst in PDF e applica i pedici del Glossario.], [Estensione dell'automazione al calcolo dell'Indice di Gulpease ad ogni integrazione nel branch main, riducendo l'errore manuale.],
    [Typst], [Sistema di composizione adottato per tutta la documentazione, con una curva di apprendimento iniziale non trascurabile.], [Condivisione di template e convenzioni comuni per uniformare la produzione dei documenti.],
    [Canali di comunicazione], [Riunioni settimanali integrate da canali rapidi (Discord, WhatsApp) per il coordinamento tra i membri.], [Formalizzazione dell'uso dei canali rapidi come misura di risposta al rischio RO-4 (coordinamento del team).],
  ),
  caption: [Valutazione degli strumenti di lavoro adottati],
  supplement: [Tabella],
)

#pagebreak()

== Sintesi delle azioni di miglioramento

#figure(
  table(
    columns: (1.5cm, 2cm, 1fr, 1fr),
    align: (center, center, left, left),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 3 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    [*Sprint*], [*Codice*], [*Problema rilevato*], [*Azione correttiva*],
    [1], [RO-1], [Stime orarie non accurate], [Revisione iterativa delle stime a inizio sprint sulla base dei dati storici],
    [1], [RT-2], [Difficoltà di comprensione dello standard EN 18031], [Studio collettivo del dominio con distribuzione dei capitoli e condivisione in riunione],
    [1], [RI-1], [Disponibilità personale variabile e non aggiornata], [Raccolta delle disponibilità effettive prima dell'assegnazione dei task],
    [2], [RO-1], [Duplicazione del ruolo di Amministratore (stime ore non accurate)], [Regola: ruoli chiave (es. Amministratore) limitati a un componente per sprint; ruoli operativi assegnabili a più membri],
    [3], [RO-4], [Disallineamento nella scrittura dei casi d'uso tra Analisti], [Riunioni di allineamento preventive e template UC formalizzato nelle Norme di Progetto],
    [4], [RI-3], [Imprecisioni formali in alcuni verbali], [Correzione dei verbali e ottimizzazione delle procedure di stesura tramite confronti di gruppo],
    [4], [RI-1], [Ridotta disponibilità per carico accademico e sessione estiva], [Riorganizzazione flessibile dei task per garantire la continuità del lavoro ordinario],
    [4], [RT-1], [Complessità nella definizione e modellazione UML degli ultimi casi d'uso], [Colloquio di confronto con il prof. Cardin per chiarire UC e diagrammi UML],
    [5], [RI-3], [Errori di tracciabilità in alcuni verbali esterni], [Revisione tempestiva con le procedure dei verbali interni, in una riunione di allineamento dedicata],
    [6], [RI-1], [Ridotta disponibilità per la sessione estiva degli esami], [Proroga dello sprint da una a due settimane e ridistribuzione flessibile dei task],
    [6], [RO-4], [Difficoltà di coordinamento degli impegni personali del team], [Rafforzamento del coordinamento tramite canali rapidi (WhatsApp, Discord)],
  ),
  caption: [Sintesi dei problemi rilevati e delle azioni correttive per sprint],
  supplement: [Tabella],
)