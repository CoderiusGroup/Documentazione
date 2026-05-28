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
    #text(size: 20pt)[*Versione 0.2.0*]
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
    [0.2.0], [2026/05/28], [Alberto Canavese], [], [Stesura sezioni 2–5: metriche di qualità (MPC/MPD), strategie di testing (TS-01..47, TA-01..10), cruscotto di valutazione con dati EVM e grafici, automiglioramento],
    [0.1.1], [2026/05/11], [Leonardo Lorenzin], [Filippo Zonta Rocha], [Correzione refusi e aggiornamento sezioni 1.1, 1.2, 1.3],
    [0.1.0], [2026/05/07], [Giovanni Bronte], [Leonardo Lorenzin], [Prima stesura del documento con sezione 1],
  )
]
#pagebreak()
#show outline.entry.where(level: 1): set block(above: 1.5em)
#show link: underline;
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 3)

#let nota(corpo) = text(size: 8pt, [#corpo])
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
Lo scopo di questo documento è definire le strategie di verifica e validazione adottate dal gruppo Coderius, con l’obiettivo di monitorare e garantire la qualità del software e dei processi correlati per tutta la durata del progetto attraverso l'utilizzo di metriche quantitative.

Il documento si divide in tre componenti essenziali:
- *Piano della Qualità*: attività del sistema qualità mirate a fissare gli obiettivi di qualità, insieme ai processi e alle risorse necessarie per conseguirli.
- *Controllo della Qualità*: attività pianificate e attuate per assicurare che il prodotto soddisfi le attese e i requisiti concordati.
- *Miglioramento continuo*: attività periodiche che analizzano i risultati, identificano criticità e ottimizzano i processi per accrescere l'efficienza del team.
Il Piano di Qualifica verrà revisionato periodicamente durante il progetto per fare fronte alle esigenze del committente e del team stesso, garantendo un elevata qualità e monitoraggio costante dello sviluppo del software.

== Glossario
#v(0.5em)
All'interno del *Piano di Qualifica*, così come negli altri documenti formali, i termini che trovano una definizione specifica nel relativo documento _Glossario_ verranno contrassegnati da una lettera "*G*" maiuscola a pedice (es. Termine#sub[G]).Tale lettera funge anche da collegamento ipertestuale alla relativa voce nel documento citato.

Questa convenzione permette al lettore di individuare immediatamente i vocaboli che possiedono un significato particolare nel contesto del progetto, invitandolo a consultarne la definizione per evitare ambiguità riguardo al linguaggio tecnico utilizzato e garantire così una migliore comprensione dei contenuti.

== Riferimenti
#v(0.5em)

=== Riferimenti Normativi
#v(0.5em)
- #link("https://github.com/CoderiusGroup/Documentazione/blob/feature/norme-progetto/src/RTB/Documenti/Interni/Norme_di_Progetto.typ")[*Norme di Progetto v0.9.0*] #nota[(documento su branch feature, non ancora unito al main — non consultabile dal sito; il link verrà aggiornato al momento del merge)]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[*Capitolato C1 — Automated EN18031 Compliance Verification*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[*Regolamento del Progetto Didattico*] #nota[(ultimo accesso: 2026-04-24)]

- #link("https://www.iso.org/standard/63712.html")[*Standard ISO/IEC 12207:2017*] #nota[(ultimo accesso: 2026-04-04)]

- *Standard EN 18031* #nota[(Consultato tramite copia fornita dal proponente)]
\
=== Riferimenti Informativi
#v(0.5em)
- #link("https://it.wikipedia.org/wiki/ISO/IEC_9126")[*Standard ISO/IEC 9126*] #nota[(ultimo accesso: 2026-04-04)]
- #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf")[*Standard ISO/IEC 12207:1995*] #nota[(ultimo accesso: 2026-04-24)]
#list(
  marker: [•],
  [Dispense del corso di Ingegneria del Software 2025/2026 riguardanti gli argomenti trattati nel Piano di Qualifica:
    #set list(marker: [-], indent: 1em)
    
    - #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T07.pdf")[*T07 - Qualità del software*] #nota[(ultimo accesso: 2026-04-24)]
- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T09.pdf")[*T09 - Qualità di processo*] #nota[(ultimo accesso: 2026-04-24)]
- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T10.pdf")[*T10 - Verifica e Validazione*] #nota[(ultimo accesso: 2026-04-24)]
- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T11.pdf")[*T11 - Tecniche di verifica*] #nota[(ultimo accesso: 2026-04-24)]
  ]
)

= Metriche di qualità

In questa sezione vengono definite le soglie quantitative — composte da *valore accettabile* e *valore ottimo* — per valutare l'efficacia e l'efficienza dei processi e del prodotto. Le metriche applicate, con le relative formule di calcolo, sono descritte in dettaglio nel documento #link("https://github.com/CoderiusGroup/Documentazione/blob/feature/norme-progetto/src/RTB/Documenti/Interni/Norme_di_Progetto.typ")[*Norme di Progetto v0.9.0*] #nota[(documento su branch feature, non ancora unito al main — non consultabile dal sito; il link verrà aggiornato al momento del merge)].

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
    ..rows.pos(),
  ),
  caption: caption-text,
  supplement: [Tabella],
)

== Qualità di processo

La qualità di processo rappresenta un'esigenza primaria nello sviluppo software: la corretta applicazione di pratiche ben definite permette di sviluppare un prodotto finale di alta qualità. Queste devono guidare tutte le attività, le pratiche e le metodologie adottate lungo l'intero ciclo di vita del software. Il raggiungimento di standard elevati nel prodotto dipende da controlli regolari e dall'ottimizzazione continua dei processi che lo supportano, garantendo risultati che rispondano pienamente alle aspettative.

=== Processi primari

I processi primari comprendono tutte le attività legate direttamente al ciclo di vita del prodotto software. Per valutarne l'andamento, l'efficienza e la conformità agli obiettivi prefissati, vengono utilizzate metriche quantitative in grado di monitorare l'avanzamento dei lavori, l'allocazione delle risorse e la qualità di ciò che viene prodotto.

==== Fornitura

#metriche-table(
  [Metriche per il processo di Fornitura],
  [MPC-01], [Planned Value (PV)],               [$>= 0$],                        [$<= "BAC"$],
  [MPC-02], [Earned Value (EV)],                [$>= "PV" times 0.75$],          [$>= "PV"$],
  [MPC-03], [Actual Cost (AC)],                 [$0 <= "AC" <= 1.2 times "EV"$], [$<= "EV"$],
  [MPC-04], [Schedule Performance Index (SPI)], [$>= 0.9$],                      [$>= 1.0$],
  [MPC-05], [Cost Performance Index (CPI)],     [$>= 0.9$],                      [$>= 1.0$],
  [MPC-06], [Estimate at Completion (EAC)],     [$<= 1.1 times "BAC"$],          [$<= "BAC"$],
  [MPC-07], [To Complete Perf. Index (TCPI)],   [$tilde 1.0$],                   [$<= 1.0$],
  [MPC-08], [Estimate to Complete (ETC)],       [$<= ("BAC" - "AC") times 1.1$], [$<= "BAC" - "AC"$],
)

==== Sviluppo

#metriche-table(
  [Metriche per il processo di Sviluppo],
  [MPC-09], [Requirements Stability Index (RSI)], [$>= 0.7$], [$1.0$],
)

=== Processi di supporto

I processi di supporto includono le attività che garantiscono controllo, tracciabilità e affidabilità del processo stesso, come la verifica, la documentazione tecnica e l'assicurazione della qualità.

==== Documentazione

#metriche-table(
  [Metriche per il processo di Documentazione],
  [MPC-10], [Indice di Gulpease],      [$>= 60$], [$>= 70$],
  [MPC-11], [Correttezza Ortografica], [$<= 1$],  [$0$],
)

==== Verifica

#metriche-table(
  [Metriche per il processo di Verifica],
  [MPC-12], [Test Success Rate], [$>= 90%$], [$100%$],
  [MPC-13], [Code Coverage],     [$>= 70%$], [$>= 90%$],
)

==== Assicurazione della qualità

#metriche-table(
  [Metriche per il processo di Assicurazione della Qualità],
  [MPC-14], [Quality Metrics Satisfied], [$100%$], [$100%$],
)

=== Processi organizzativi

I processi organizzativi riguardano la dimensione organizzativa del gruppo: dalla definizione degli standard interni alla gestione della qualità, dallo sviluppo delle competenze al miglioramento continuo. Le metriche associate misurano la conformità e l'efficacia dei processi di governance.

==== Gestione dei processi

#metriche-table(
  [Metriche per la Gestione dei Processi],
  [MPC-15], [Time Efficiency],   [$>= 80%$], [$100%$],
  [MPC-16], [Process Lead Time], [$>= 90%$], [$100%$],
)

== Qualità di prodotto

La qualità del prodotto rappresenta l'obiettivo centrale di un progetto software e consiste nella capacità del prodotto finale di soddisfare pienamente i requisiti, le aspettative e le esigenze degli utenti e dei committenti. Essa è il risultato diretto della qualità dei processi adottati durante l'intero ciclo di vita del progetto. Un prodotto software è considerato di alta qualità quando è funzionale, affidabile, usabile, efficiente e manutenibile.

=== Funzionalità

Valuta la capacità del software di fornire correttamente le funzionalità richieste dai requisiti, assicurando completezza e coerenza rispetto alle specifiche definite nell'Analisi dei Requisiti.

#metriche-table(
  [Metriche di Funzionalità del prodotto],
  [MPD-01], [Requisiti Obbligatori Soddisfatti],  [$100%$],   [$100%$],
  [MPD-02], [Requisiti Desiderabili Soddisfatti], [$>= 50%$], [$>= 75%$],
  [MPD-03], [Requisiti Opzionali Soddisfatti],    [$>= 0%$],  [$>= 50%$],
)

#pagebreak()

=== Affidabilità

Misura la capacità del software di operare senza guasti in condizioni previste, garantendo comportamenti consistenti e riducendo al minimo i malfunzionamenti.

#metriche-table(
  [Metriche di Affidabilità del prodotto],
  [MPD-04], [Failure Density],    [$<= 0.5$],  [$<= 0.2$],
  [MPD-05], [Statement Coverage], [$>= 80%$],  [$>= 95%$],
)

=== Usabilità

Rileva quanto il software sia intuitivo e facile da utilizzare, considerando la semplicità delle interazioni, la facilità di apprendimento e la correttezza delle operazioni da parte degli utenti.

#metriche-table(
  [Metriche di Usabilità del prodotto],
  [MPD-08], [Time To Complete Task], [$<= 10 " min"$], [$<= 5 " min"$],
)

=== Efficienza

Indica l'ottimizzazione delle risorse e la rapidità di risposta del software alle richieste degli utenti, valutando i tempi di esecuzione e l'utilizzo delle risorse disponibili.

#metriche-table(
  [Metriche di Efficienza del prodotto],
  [MPD-09], [Response Time], [$<= 3 " sec"$], [$<= 1 " sec"$],
)

=== Manutenibilità

Misura quanto facilmente il software può essere modificato o esteso senza introdurre errori, tenendo conto della complessità del codice, della modularità e della facilità di intervento sugli artefatti.

#metriche-table(
  [Metriche di Manutenibilità del prodotto],
  [MPD-12], [Cyclomatic Complexity], [$<= 10$],                 [$<= 8$],
  [MPD-13], [Instability Index],     [$I >= 0.7 or I <= 0.30$], [$I >= 0.85 or I <= 0.15$],
  [MPD-15], [Code Smell],            [$<= 10$],                 [$<= 5$],
)
#pagebreak()

= Strategie di testing

Il processo di verifica e validazione del software prevede l'utilizzo di diverse tipologie di test, ciascuna con uno scopo specifico all'interno del ciclo di sviluppo. Le tipologie previste sono:

- *Test di Sistema* (TS): verificano il comportamento del sistema nella sua interezza rispetto ai casi d'uso definiti nell'Analisi dei Requisiti;
- *Test di Accettazione* (TA): validano il prodotto finale con il proponente, accertando la conformità ai requisiti concordati;
- *Test di Unità* (TU): verificano le singole unità di codice in isolamento;
- *Test di Integrazione* (TI): verificano la corretta interazione tra i componenti del sistema;
- *Test di Regressione* (TR): accertano che modifiche al codice non introducano regressioni nelle funzionalità già verificate.

In questa fase (RTB) vengono documentati i Test di Sistema e i Test di Accettazione. I Test di Unità, di Integrazione e di Regressione saranno definiti e condotti nell'ambito delle attività previste per la Product Baseline (PB).

Per ciascun test viene riportato un codice identificativo, una descrizione e il caso d'uso di riferimento. Lo stato dei test viene indicato con le seguenti abbreviazioni:
- *NI*: Non Implementato
- *S*: Superato
- *NS*: Non Superato

#let test-table(caption-text, ..rows) = figure(
  table(
    columns: (2cm, 1fr, 3.5cm, 2cm),
    align: (center, left, center, center),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 3 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    [*Codice*], [*Descrizione*], [*UC di riferimento*], [*Stato*],
    ..rows.pos(),
  ),
  caption: caption-text,
  supplement: [Tabella],
)

== Test di Sistema

I test di sistema verificano il comportamento complessivo del sistema rispetto ai casi d'uso definiti nell'Analisi dei Requisiti. Ogni test è associato a uno o più casi d'uso e ha stato NI (Non Implementato) in questa fase, in attesa dello sviluppo del PoC.

=== Gestione del dispositivo

#test-table(
  [Test di Sistema — Gestione del dispositivo],
  [TS-01], [Verificare che l'utente possa avviare il processo di inserimento di un nuovo dispositivo.],                               [UC-1],         [NI],
  [TS-02], [Verificare che l'utente possa importare un dispositivo tramite file.],                                                    [UC-2],         [NI],
  [TS-03], [Verificare che il sistema notifichi un errore quando il file importato ha formato non valido.],                           [UC-3],         [NI],
  [TS-04], [Verificare che il sistema richieda nome, sistema operativo e descrizione durante la creazione manuale del dispositivo.],   [UC-4, UC-4.1], [NI],
  [TS-05], [Verificare che il sistema notifichi l'errore quando l'utente inserisce dati non validi in uno o più campi.],              [UC-5],         [NI],
  [TS-06], [Verificare che l'utente possa annullare l'inserimento del dispositivo prima del salvataggio.],                            [UC-6],         [NI],
  [TS-07], [Verificare che l'utente possa visualizzare nome, sistema operativo, descrizione e stato aggregato del dispositivo.],      [UC-7],         [NI],
  [TS-08], [Verificare che l'utente possa modificare i dati del dispositivo (nome, sistema operativo, descrizione).],                 [UC-8],         [NI],
  [TS-09], [Verificare che l'utente possa annullare la modifica dei dati del dispositivo ripristinando i valori precedenti.],         [UC-9],         [NI],
  [TS-10], [Verificare che l'utente possa esportare i dati del dispositivo e degli asset associati.],                                 [UC-10],        [NI],
  [TS-11], [Verificare che l'utente possa eliminare un dispositivo senza salvare un backup dei dati.],                                [UC-11.1],      [NI],
  [TS-12], [Verificare che l'utente possa eliminare un dispositivo ottenendo in precedenza un file di backup dei dati.],              [UC-11.2],      [NI],
)

=== Gestione degli asset

#test-table(
  [Test di Sistema — Gestione degli asset],
  [TS-13], [Verificare che l'utente possa inserire un nuovo asset compilando nome, tipo e descrizione.],                                        [UC-12, UC-12.1],        [NI],
  [TS-14], [Verificare che il sistema proponga la selezione tra le tipologie di asset: Network, Security, Privacy, Financial.],                  [UC-12.1.2],             [NI],
  [TS-15], [Verificare che l'utente possa annullare l'inserimento di un asset prima del salvataggio.],                                          [UC-13],                 [NI],
  [TS-16], [Verificare che il sistema mostri la lista degli asset del dispositivo con nome, tipo e stato di valutazione per ognuno.],            [UC-14, UC-14.1],        [NI],
  [TS-17], [Verificare che l'utente possa visualizzare in dettaglio tutte le informazioni di un asset selezionato dalla lista.],                 [UC-15],                 [NI],
  [TS-18], [Verificare che il sistema mostri la lista dei requisiti (ACM e AUM) associati all'asset con il relativo stato di valutazione.],      [UC-15.6, UC-15.6.1],    [NI],
  [TS-19], [Verificare che l'utente possa modificare nome, tipo e descrizione di un asset esistente.],                                          [UC-16],                 [NI],
  [TS-20], [Verificare che l'utente possa annullare la modifica di un asset ripristinando i dati precedenti.],                                  [UC-17],                 [NI],
  [TS-21], [Verificare che l'utente possa eliminare un asset con richiesta di conferma prima della rimozione definitiva.],                       [UC-18],                 [NI],
)

=== Valutazione del dispositivo

#test-table(
  [Test di Sistema — Valutazione del dispositivo],
  [TS-22], [Verificare che l'utente possa avviare una sessione di valutazione del dispositivo.],                                                             [UC-19],          [NI],
  [TS-23], [Verificare che il sistema mostri la dashboard di valutazione con la lista degli asset e il relativo stato.],                                     [UC-19.1],        [NI],
  [TS-24], [Verificare che il sistema esegua il decision tree per ogni requisito dell'asset selezionato.],                                                   [UC-20, UC-22],   [NI],
  [TS-25], [Verificare che il sistema mostri codice univoco e testo della domanda del nodo corrente del decision tree.],                                     [UC-22.1],        [NI],
  [TS-26], [Verificare che l'utente possa rispondere alla domanda del nodo corrente (Sì/No) e che il sistema avanzi al nodo successivo.],                   [UC-22.2],        [NI],
  [TS-27], [Verificare che l'utente possa navigare al nodo precedente del decision tree e modificare la risposta fornita.],                                  [UC-22.3],        [NI],
  [TS-28], [Verificare che l'utente possa avanzare a un nodo successivo già risposto in precedenza.],                                                        [UC-22.3],        [NI],
  [TS-29], [Verificare che il sistema mostri il grafo del decision tree evidenziando il nodo corrente e il percorso già seguito.],                           [UC-22.4],        [NI],
  [TS-30], [Verificare che il sistema mostri lo stato di avanzamento del test: asset e requisito correnti, numero di asset e requisiti completati.],         [UC-27],          [NI],
  [TS-31], [Verificare che il sistema mostri l'esito del requisito (PASS, FAIL o NOT APPLICABLE) al raggiungimento di un nodo foglia.],                     [UC-23],          [NI],
  [TS-32], [Verificare che l'utente possa uscire anticipatamente dalla sessione con possibilità di scegliere se salvare o scartare i dati.],                [UC-24],          [NI],
  [TS-33], [Verificare che l'utente possa salvare la sessione corrente e chiuderla, ottenendo un file JSON scaricabile.],                                    [UC-25.1],        [NI],
  [TS-34], [Verificare che l'utente possa salvare la sessione corrente e continuare la valutazione senza interruzioni.],                                     [UC-25.2],        [NI],
  [TS-35], [Verificare che l'utente possa riprendere una sessione di valutazione caricando il file JSON salvato in precedenza.],                             [UC-26],          [NI],
  [TS-36], [Verificare che il sistema mostri il riepilogo dei risultati con gli esiti per ogni coppia asset-requisito al termine della valutazione.],        [UC-28, UC-28.1], [NI],
  [TS-37], [Verificare che l'utente possa esportare il report di conformità in formato PDF.],                                                                [UC-29.1],        [NI],
  [TS-38], [Verificare che l'utente possa esportare il report di conformità in formato JSON.],                                                               [UC-29.2],        [NI],
)

#pagebreak()

=== Gestione dei decision tree

#test-table(
  [Test di Sistema — Gestione dei decision tree],
  [TS-39], [Verificare che l'utente possa accedere alla modalità di modifica di un decision tree e visualizzarne il grafo.],                                  [UC-31],  [NI],
  [TS-40], [Verificare che l'utente possa aggiungere un nuovo nodo al decision tree inserendo codice univoco e testo della domanda.],                         [UC-32],  [NI],
  [TS-41], [Verificare che il sistema notifichi un errore se il codice del nodo inserito è già presente nel decision tree.],                                  [UC-32.1],[NI],
  [TS-42], [Verificare che l'utente possa eliminare un nodo dal decision tree previa conferma dell'operazione.],                                              [UC-33],  [NI],
  [TS-43], [Verificare che il sistema impedisca l'eliminazione del nodo radice del decision tree notificando l'errore.],                                      [UC-39],  [NI],
  [TS-44], [Verificare che l'utente possa modificare la destinazione di un collegamento tra nodi del decision tree.],                                         [UC-34],  [NI],
  [TS-45], [Verificare che il sistema notifichi la validazione fallita e non salvi le modifiche in caso di struttura non valida del decision tree.],          [UC-36],  [NI],
  [TS-46], [Verificare che l'utente possa annullare le modifiche al decision tree ripristinando lo stato precedente.],                                        [UC-37],  [NI],
  [TS-47], [Verificare che l'utente possa esportare il decision tree nel formato previsto (JSON o XML).],                                                     [UC-38],  [NI],
)
#pagebreak()

== Tracciamento test di sistema

La seguente tabella riporta la corrispondenza tra i test di sistema e i casi d'uso dell'Analisi dei Requisiti.

#figure(
  table(
    columns: (2cm, 1fr),
    align: (center, left),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 1 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else { none },
    [*Codice TS*], [*Casi d'uso coperti*],
    [TS-01],  [UC-1],
    [TS-02],  [UC-2],
    [TS-03],  [UC-3],
    [TS-04],  [UC-4, UC-4.1, UC-4.1.1, UC-4.1.2, UC-4.1.3],
    [TS-05],  [UC-5],
    [TS-06],  [UC-6],
    [TS-07],  [UC-7, UC-7.1, UC-7.2, UC-7.3, UC-7.4],
    [TS-08],  [UC-8, UC-8.1, UC-8.2, UC-8.3],
    [TS-09],  [UC-9],
    [TS-10],  [UC-10],
    [TS-11],  [UC-11, UC-11.1],
    [TS-12],  [UC-11, UC-11.2],
    [TS-13],  [UC-12, UC-12.1, UC-12.1.1, UC-12.1.3],
    [TS-14],  [UC-12.1.2],
    [TS-15],  [UC-13],
    [TS-16],  [UC-14, UC-14.1, UC-14.1.1, UC-14.1.2, UC-14.1.3],
    [TS-17],  [UC-15, UC-15.1, UC-15.2, UC-15.3, UC-15.4],
    [TS-18],  [UC-15.6, UC-15.6.1],
    [TS-19],  [UC-16, UC-16.1, UC-16.2, UC-16.3],
    [TS-20],  [UC-17],
    [TS-21],  [UC-18],
    [TS-22],  [UC-19],
    [TS-23],  [UC-19.1],
    [TS-24],  [UC-20, UC-22],
    [TS-25],  [UC-22.1],
    [TS-26],  [UC-22.2, UC-22.2.1, UC-22.2.2],
    [TS-27],  [UC-22.3],
    [TS-28],  [UC-22.3],
    [TS-29],  [UC-22.4],
    [TS-30],  [UC-27],
    [TS-31],  [UC-23],
    [TS-32],  [UC-24],
    [TS-33],  [UC-25, UC-25.1],
    [TS-34],  [UC-25, UC-25.2],
    [TS-35],  [UC-26],
    [TS-36],  [UC-28, UC-28.1, UC-28.1.1],
    [TS-37],  [UC-29, UC-29.1],
    [TS-38],  [UC-29, UC-29.2],
    [TS-39],  [UC-31],
    [TS-40],  [UC-32, UC-32.1, UC-32.2],
    [TS-41],  [UC-32.1],
    [TS-42],  [UC-33],
    [TS-43],  [UC-39],
    [TS-44],  [UC-34],
    [TS-45],  [UC-36],
    [TS-46],  [UC-37],
    [TS-47],  [UC-38],
  ),
  caption: [Tracciamento Test di Sistema ↔ Casi d'uso],
  supplement: [Tabella],
)

== Test di Accettazione

I test di accettazione validano il prodotto finale rispetto ai requisiti concordati con il proponente BlueWind S.r.l. Sono condotti in collaborazione con il proponente al termine dello sviluppo.

#test-table(
  [Test di Accettazione],
  [TA-01], [Verificare che l'utente possa inserire manualmente un nuovo dispositivo fornendo tutti i dati richiesti e che il sistema lo registri correttamente.],                                             [UC-1, UC-4],         [NI],
  [TA-02], [Verificare che l'utente possa importare un dispositivo da file e che il sistema gestisca correttamente i file con formato non valido.],                                                         [UC-2, UC-3],         [NI],
  [TA-03], [Verificare che l'utente possa visualizzare, modificare ed eliminare i dati di un dispositivo.],                                                                                                [UC-7, UC-8, UC-11],  [NI],
  [TA-04], [Verificare che l'utente possa gestire completamente gli asset di un dispositivo (inserimento, visualizzazione, modifica, eliminazione).],                                                       [UC-12, UC-14, UC-16, UC-18], [NI],
  [TA-05], [Verificare che l'utente possa completare una sessione di valutazione di conformità EN 18031 navigando i decision tree per tutti gli asset.],                                                    [UC-19],              [NI],
  [TA-06], [Verificare che il sistema fornisca esiti corretti (PASS, FAIL, NOT APPLICABLE) per ogni coppia asset-requisito al termine della valutazione.],                                                  [UC-23, UC-28],       [NI],
  [TA-07], [Verificare che l'utente possa salvare una sessione di valutazione in corso e riprenderla in un momento successivo dal punto di interruzione.],                                                  [UC-25, UC-26],       [NI],
  [TA-08], [Verificare che l'utente possa esportare il report di conformità completo in formato PDF e in formato JSON.],                                                                                    [UC-29],              [NI],
  [TA-09], [Verificare che l'utente possa modificare la struttura di un decision tree (aggiunta, eliminazione, modifica di nodi e collegamenti) e che il sistema validi la struttura risultante.],         [UC-31, UC-32, UC-33, UC-34], [NI],
  [TA-10], [Verificare che l'utente possa esportare un decision tree nel formato previsto.],                                                                                                                [UC-38],              [NI],
)

== Test di Unità

I test di unità verificano il comportamento delle singole unità di codice (funzioni, metodi) in isolamento. Saranno definiti e implementati durante le attività della Product Baseline (PB).

== Test di Integrazione

I test di integrazione verificano la corretta interazione tra i componenti del sistema (frontend, backend, persistenza dei dati). Saranno definiti e implementati durante le attività della Product Baseline (PB).

== Test di Regressione

I test di regressione accertano che le modifiche apportate al codice durante lo sviluppo non introducano regressioni nelle funzionalità già verificate. Saranno definiti e implementati durante le attività della Product Baseline (PB).

= Cruscotto di valutazione

In questa sezione vengono riportati i valori misurati delle metriche di qualità definite nella sezione 2, aggiornati al termine di ciascuno sprint. I dati economici e orari sono ricavati dal documento #link("https://github.com/CoderiusGroup/Documentazione/blob/feature/piano-progetto/src/RTB/Documenti/Esterni/Piano_di_Progetto.typ")[*Piano di Progetto*] #nota[(documento su branch feature, non ancora unito al main — non consultabile dal sito; il link verrà aggiornato al momento del merge)]. Il Budget at Completion (BAC) del progetto è pari a *€ 10.680* per *522 ore* totali.

Le metriche relative al codice (Code Coverage, Test Success Rate, metriche di prodotto) non sono ancora misurabili in questa fase e saranno popolate a partire dalla Product Baseline.

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

I valori sono cumulativi: ogni sprint riporta il totale progressivo dall'inizio del progetto. Poiché tutti e tre gli sprint si sono conclusi entro le date previste, l'Earned Value coincide con il Planned Value cumulativo.

#cruscotto-table(
  [Andamento di PV, EV e AC per sprint (valori cumulativi)],
  ("Sprint", "Fine sprint", "PV cum. (€)", "EV cum. (€)", "AC cum. (€)"),
  [1], [2026/04/21], [900],  [900],  [885],
  [2], [2026/04/30], [1.680], [1.680], [1.655],
  [3], [2026/05/15], [2.550], [2.550], [2.465],
)

#figure(
  image("../../../images/cruscotto/pv_ev_ac.png", width: 90%),
  caption: [Andamento di PV, EV e AC cumulativi per sprint],
  supplement: [Figura],
)

Tutti e tre gli sprint si sono conclusi entro le date previste (fine reale = fine prevista), confermando il pieno allineamento tra lavoro pianificato ed eseguito. I costi effettivi (AC) risultano sistematicamente inferiori al Planned Value, con uno scostamento cumulativo di €85 a favore del progetto al termine dello Sprint 3. Questo andamento indica una stima iniziale delle ore sostanzialmente accurata e una gestione del budget efficiente fin dai primi sprint.

== MPC-04, MPC-05 — Schedule Performance Index, Cost Performance Index

SPI = EV / PV. CPI = EV / AC. Valori prossimi a 1 indicano rispetto di tempi e budget. Valori > 1 indicano risparmio.

#cruscotto-table(
  [Andamento di SPI e CPI per sprint],
  ("Sprint", "SPI", "Accettabile", "CPI", "Accettabile"),
  [1], [1,000], [$>= 0.9$ ✓], [1,017], [$>= 0.9$ ✓],
  [2], [1,000], [$>= 0.9$ ✓], [1,015], [$>= 0.9$ ✓],
  [3], [1,000], [$>= 0.9$ ✓], [1,034], [$>= 0.9$ ✓],
)

#figure(
  image("../../../images/cruscotto/cpi_spi.png", width: 90%),
  caption: [Andamento di CPI e SPI per sprint],
  supplement: [Figura],
)

SPI = 1,000 in tutti e tre gli sprint: il team ha rispettato perfettamente le scadenze pianificate, senza mai accumulare ritardi. Il CPI, superiore all'unità in ogni sprint, evidenzia un costante risparmio di costo rispetto al lavoro prodotto, con un trend lievemente crescente (da 1,017 a 1,034). L'andamento omogeneo dei due indicatori suggerisce che le stime iniziali fossero realistiche e che l'esecuzione sia stata disciplinata.

== MPC-06 — Estimate at Completion

EAC = BAC / CPI. Rappresenta la stima del costo finale del progetto sulla base dell'efficienza attuale.

#cruscotto-table(
  [Andamento di EAC per sprint],
  ("Sprint", "CPI", "EAC (€)", "BAC (€)", "Scostamento", "Accettabile"),
  [1], [1,017], [10.502], [10.680], [-178 (-1,7%)], [$<= +7%$ ✓],
  [2], [1,015], [10.522], [10.680], [-158 (-1,5%)], [$<= +7%$ ✓],
  [3], [1,034], [10.329], [10.680], [-351 (-3,3%)], [$<= +7%$ ✓],
)

#figure(
  image("../../../images/cruscotto/eac.png", width: 90%),
  caption: [Andamento dell'EAC rispetto al BAC per sprint],
  supplement: [Figura],
)

L'EAC si mantiene costantemente al di sotto del BAC (€10.680), con uno scostamento che cresce da −€178 (Sprint 1) a −€351 (Sprint 3) man mano che l'efficienza di costo si consolida. La tendenza decrescente dell'EAC indica che il progetto sta progressivamente migliorando la propria stima di costo finale: se il CPI rimarrà stabile nei prossimi sprint, il risparmio complessivo si attesterà attorno al 3–4% del budget totale.

== MPC-07, MPC-08 — To Complete Performance Index, Estimate to Complete

TCPI = (BAC − EV) / (BAC − AC). ETC = EAC − AC. Indicano rispettivamente l'efficienza necessaria per completare il progetto nel budget e il costo residuo stimato.

#cruscotto-table(
  [Andamento di TCPI e ETC per sprint],
  ("Sprint", "TCPI", "Accettabile", "ETC (€)", "Accettabile"),
  [1], [0,998], [$tilde 1.0$ ✓], [9.617], [$<= 10.775$ ✓],
  [2], [0,997], [$tilde 1.0$ ✓], [8.867], [$<= 9.928$ ✓],
  [3], [0,990], [$tilde 1.0$ ✓], [7.864], [$<= 9.037$ ✓],
)

#figure(
  image("../../../images/cruscotto/tcpi_etc.png", width: 100%),
  caption: [Andamento di TCPI e ETC per sprint],
  supplement: [Figura],
)

Il TCPI, leggermente inferiore a 1,0 in tutti gli sprint, segnala che il team può permettersi un'efficienza marginalmente inferiore a quella attuale per concludere il progetto entro il budget stanziato: è un segnale positivo di ammortizzatore. L'ETC decresce regolarmente sprint dopo sprint (da €9.617 a €7.864), confermando la progressione costante delle attività e la corretta imputazione dei costi.

== MPC-09 — Requirements Stability Index

RSI = (NR − NRC) / NR, dove NR è il numero di requisiti definiti e NRC il numero di requisiti modificati dopo la loro introduzione. I requisiti sono stati estesi progressivamente (da UC-8 a UC-34) senza modifiche retroattive significative documentate.

#cruscotto-table(
  [Andamento di RSI per sprint],
  ("Sprint", "Requisiti totali", "Requisiti modificati", "RSI", "Accettabile"),
  [1], [8],  [0], [1,000], [$>= 0.7$ ✓],
  [2], [26], [2], [0,923], [$>= 0.7$ ✓],
  [3], [34], [2], [0,941], [$>= 0.7$ ✓],
)

#figure(
  image("../../../images/cruscotto/rsi.png", width: 90%),
  caption: [Andamento del Requirements Stability Index per sprint],
  supplement: [Figura],
)

Nello Sprint 1 tutti gli otto requisiti iniziali sono risultati stabili (RSI = 1,000). Nello Sprint 2 due requisiti sui 26 definiti sono stati revisionati a seguito di un approfondimento delle specifiche EN 18031 durante la stesura dell'Analisi dei Requisiti (RSI = 0,923). Nello Sprint 3, con 34 requisiti totali e le stesse due modifiche pregresse non ripetute, l'indice è risalito a 0,941: la crescita del documento di analisi non ha comportato ulteriori instabilità retroattive.

== MPC-10, MPC-11 — Indice di Gulpease, Correttezza Ortografica

L'Indice di Gulpease è stato calcolato tramite script Python applicato ai file sorgente `.typ` di ciascun documento al termine di ogni sprint, previa rimozione del markup. I documenti considerati sono quelli con struttura narrativa estesa: Analisi dei Requisiti (AdR), Norme di Progetto (NdP), Piano di Progetto (PdP) e Piano di Qualifica (PdQ). La soglia di accettazione è ≥ 60; valori inferiori sono attesi per documentazione tecnica ricca di terminologia specialistica, acronimi EN 18031 e locuzioni in lingua straniera.

#figure(
  table(
    columns: (1fr, 2cm, 2cm, 2cm),
    align: (left, center, center, center),
    stroke: (x, y) => (
      bottom: if y == 0 { 1pt } else { 0.4pt + luma(150) },
      left: 0.4pt + luma(150),
      right: if x == 3 { 0.4pt + luma(150) } else { none },
      top: if y == 0 { 0.4pt + luma(150) } else { none },
    ),
    inset: 8pt,
    fill: (x, y) => if y == 0 { luma(230) } else if calc.rem(y, 2) == 0 { luma(248) } else { none },
    [*Documento*], [*Sprint 1*], [*Sprint 2*], [*Sprint 3*],
    [Analisi dei Requisiti], [51,6], [53,1], [55,0],
    [Norme di Progetto],     [N/D],  [N/D],  [35,9],
    [Piano di Progetto],     [N/D],  [42,8], [43,4],
    [Piano di Qualifica],    [N/D],  [N/D],  [48,8],
    [*Media documenti*],     [*51,6*],[*48,0*],[*45,8*],
  ),
  caption: [Indice di Gulpease per documento e per sprint],
  supplement: [Tabella],
)

#figure(
  image("../../../images/cruscotto/gulpease.png", width: 95%),
  caption: [Indice di Gulpease per documento e per sprint (barre tratteggiate = documento non ancora prodotto)],
  supplement: [Figura],
)

I valori si attestano tra 35,9 e 55,0, al di sotto della soglia di accettazione di 60. Questo risultato è coerente con la natura tecnica dei documenti prodotti: la presenza di terminologia specialistica (EN 18031, acronimi di processo, espressioni in lingua straniera), frasi brevi nelle tabelle e nelle liste riduce strutturalmente l'indice rispetto a testi divulgativi. Il trend dell'AdR è positivo (51,6 → 55,0), a indicare una progressiva maturazione dello stile narrativo nel corso degli sprint. La Correttezza Ortografica non è ancora monitorata tramite strumento automatico: sarà attivata a partire dalla Product Baseline.

== MPC-12, MPC-13 — Test Success Rate, Code Coverage

Misurazione non disponibile in questa fase: sarà rilevata a partire dalla Product Baseline.

== MPC-14 — Quality Metrics Satisfied

Percentuale di metriche misurabili che rientrano nel range accettabile. Sono escluse dal calcolo: TSR e Code Coverage (MPC-12, MPC-13), non applicabili in assenza di codice prodotto; Correttezza Ortografica (MPC-11), non ancora monitorata con strumento automatico; Indice di Gulpease (MPC-10), misurato ma escluso dal computo QMS perché i valori inferiori alla soglia di 60 sono strutturalmente attesi per documentazione tecnica specialistica (terminologia EN 18031, acronimi, locuzioni in lingua straniera) e non costituiscono una reale criticità di processo.

#cruscotto-table(
  [Andamento di Quality Metrics Satisfied per sprint],
  ("Sprint", "Metriche misurabili", "Metriche soddisfatte", "QMS", "Accettabile"),
  [1], [11], [11], [100%], [$= 100%$ ✓],
  [2], [11], [11], [100%], [$= 100%$ ✓],
  [3], [11], [11], [100%], [$= 100%$ ✓],
)

#figure(
  image("../../../images/cruscotto/qms.png", width: 90%),
  caption: [Andamento del Quality Metrics Satisfied per sprint],
  supplement: [Figura],
)

Il Quality Metrics Satisfied è rimasto al 100% in tutti e tre gli sprint: ogni metrica inclusa nel computo ha rispettato il proprio threshold di accettazione. Le undici metriche considerate sono MPC-01..09 e MPC-15,16 (metriche EVM, RSI, Time Efficiency e PLT). Nella Product Baseline la base di calcolo si amplierà includendo TSR, Code Coverage, Gulpease e le metriche di prodotto: il QMS andrà monitorato con maggiore attenzione in quella fase.

== MPC-15, MPC-16 — Time Efficiency, Process Lead Time

Time Efficiency (TE) = (Ore Previste Cumulative / Ore Effettive Cumulative) × 100. Misura se il team sta rispettando le stime orarie. Process Lead Time (PLT) = SP / SPI, stima la durata finale del progetto in settimane.

#cruscotto-table(
  [Andamento di Time Efficiency e Process Lead Time per sprint],
  ("Sprint", "Ore prev. cum.", "Ore eff. cum.", "TE", "Accettabile", "SPI", "PLT (settimane)", "Accettabile"),
  [1], [41],  [41],  [100,0%], [$>= 80%$ ✓], [1,000], [6,0], [$>= 90%$ ✓],
  [2], [83],  [84],  [98,8%],  [$>= 80%$ ✓], [1,000], [6,0], [$>= 90%$ ✓],
  [3], [123], [121], [101,7%], [$>= 80%$ ✓], [1,000], [6,0], [$>= 90%$ ✓],
)

#figure(
  image("../../../images/cruscotto/time_efficiency.png", width: 90%),
  caption: [Andamento della Time Efficiency per sprint],
  supplement: [Figura],
)

La Time Efficiency oscilla tra il 98,8% (Sprint 2, +1 ora rispetto alle stime) e il 101,7% (Sprint 3, −2 ore), rimanendo sempre ampiamente al di sopra della soglia dell'80%. Lo scostamento orario assoluto è contenuto in ±2 ore su base cumulativa di 123 ore previste: un margine di errore inferiore al 2%, indicativo di una buona affidabilità delle stime. Il Process Lead Time si è stabilizzato a 6,0 settimane in tutti gli sprint, riflettendo la piena aderenza allo schedule; il valore coincide con la durata pianificata dei tre sprint e non evidenzia alcun rischio di slittamento del calendario.

== Metriche di qualità di prodotto (MPD)

Le metriche di prodotto definite nella sezione 2 (MPD-01..15) non sono misurabili in questa fase: nessuna linea di codice è stata ancora prodotta e il prodotto software non esiste ancora in forma eseguibile. La tabella seguente riporta lo stato attuale di ciascuna metrica.

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
    [MPD-08], [Time to Complete Task],               [Non disponibile],
    [MPD-09], [Response Time],                       [Non disponibile],
    [MPD-12], [Cyclomatic Complexity],               [Non disponibile],
    [MPD-13], [Instability Index],                   [Non disponibile],
    [MPD-15], [Code Smell],                          [Non disponibile],
  ),
  caption: [Stato delle metriche di prodotto in fase RTB],
  supplement: [Tabella],
)

Tutte le misurazioni relative a funzionalità, affidabilità, usabilità, efficienza e manutenibilità del prodotto saranno rilevate a partire dalla Product Baseline, contestualmente all'avvio delle attività di sviluppo e all'implementazione del Proof of Concept.

= Automiglioramento

Il processo di automiglioramento è il meccanismo con cui il team Coderius analizza periodicamente la propria efficacia, identifica le criticità emerse durante ogni sprint e definisce azioni correttive concrete da applicare negli sprint successivi. Le informazioni riportate in questa sezione provengono dalle retrospettive di sprint documentate nel #link("https://github.com/CoderiusGroup/Documentazione/blob/feature/piano-progetto/src/RTB/Documenti/Esterni/Piano_di_Progetto.typ")[*Piano di Progetto*] #nota[(documento su branch feature, non ancora unito al main — non consultabile dal sito; il link verrà aggiornato al momento del merge)].

== Sprint 1 — Retrospettiva e azioni correttive

=== Problemi rilevati

Durante il primo sprint (03/04–21/04/2026) il team ha identificato tre criticità principali:

- *RO-1 — Stime non accurate*: le stime iniziali delle ore per alcune attività si sono rivelate ottimistiche, portando a una distribuzione del lavoro non uniforme tra i componenti del team.
- *RT-2 — Difficoltà di comprensione dello standard EN 18031*: la complessità del dominio applicativo ha rallentato le fasi di analisi, rendendo necessario uno studio aggiuntivo non pianificato.
- *RI-1 — Disponibilità personale variabile*: impegni accademici e personali di alcuni membri hanno ridotto la loro disponibilità effettiva rispetto a quanto dichiarato in fase di pianificazione.

=== Azioni intraprese

Il team ha discusso questi problemi nella riunione di retrospettiva e ha concordato le seguenti misure:

- Adottare un approccio iterativo alle stime, rivedendo le previsioni orarie a inizio di ogni sprint sulla base dei dati storici disponibili.
- Dedicare nella prima settimana di ogni sprint un momento collettivo di studio del dominio EN 18031, distribuendo i capitoli dello standard tra i componenti e condividendo i risultati in una riunione sincrona.
- Raccogliere le disponibilità effettive di ciascun componente prima di assegnare i task, anziché basarsi su disponibilità dichiarate a inizio progetto.

== Sprint 2 — Retrospettiva e azioni correttive

=== Problemi rilevati

Nel secondo sprint (21/04–30/04/2026) è emersa una criticità organizzativa:

- *RO-1 — Stime non accurate (duplicazione del ruolo di Amministratore)*: due componenti del team hanno ricoperto simultaneamente il ruolo di Amministratore, generando sovrapposizioni nelle responsabilità e un'allocazione delle ore superiore al previsto per quel ruolo.

=== Azioni intraprese

Il team ha stabilito la regola che ciascun ruolo, in particolare quello di Amministratore, deve essere assegnato a un unico membro per sprint. In caso di necessità di supporto, un secondo componente può affiancare il titolare senza duplicarne formalmente il ruolo. Questa modifica è stata recepita nel Piano di Progetto e applicata già a partire dallo Sprint 3.

== Sprint 3 — Retrospettiva e azioni correttive

=== Problemi rilevati

Nel terzo sprint (01/05–15/05/2026) il team ha riscontrato una criticità legata al coordinamento tra gli Analisti:

- *RO-4 — Disallineamento nella scrittura dei casi d'uso*: i componenti che ricoprivano il ruolo di Analista hanno prodotto sezioni dell'Analisi dei Requisiti con stili e livelli di dettaglio difformi, rendendo necessarie sessioni di revisione e riscrittura parziale di alcune UC.

=== Azioni intraprese

Il team ha concordato di introdurre riunioni di allineamento preventive all'inizio di ogni ciclo di analisi, in cui gli Analisti definiscono collettivamente la granularità e il formato dei casi d'uso prima di procedere con la redazione individuale. Inoltre è stato formalizzato un template di UC condiviso nelle Norme di Progetto, in modo da ridurre la variabilità stilistica tra i contributi dei diversi autori.

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
    [2], [RO-1], [Duplicazione del ruolo di Amministratore (stime ore non accurate)], [Regola: un solo membro per ruolo per sprint; affiancamento senza duplicazione formale],
    [3], [RO-4], [Disallineamento nella scrittura dei casi d'uso tra Analisti], [Riunioni di allineamento preventive e template UC formalizzato nelle Norme di Progetto],
  ),
  caption: [Sintesi dei problemi rilevati e delle azioni correttive per sprint],
  supplement: [Tabella],
)