#set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Piano di Progetto],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )

#set text(font: "Libertinus Serif",size: 12pt,lang: "it")

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
      [*Codice*],            [#id],
      [*Denominazione*],     [#nome],
      [*Categoria*],         [#tipo],
      [*Probabilità*],       [#prob],
      [*Impatto*],           [#impatto],
      [*Prevenzione*],       [#prevenzione],
      [*Piano di risposta*], [#risposta],
    )
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
      ..rows.flatten()
    ),
    caption: caption-text,
  )
}

#align(center)[
  #v(8em)
  #image("../../../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Piano di Progetto]
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
    // aggiungi nuova riga quando aggiorni ^
    [0.1.0], [2026/04/21], [Ines Iadadi], [Alberto Canavese],[Prima stesura del documento e redazione Sprint 1],
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

= Introduzione

== Scopo del documento
Il presente Piano di Progetto si configura come lo strumento cardine per la direzione operativa del gruppo Coderius, delineando i criteri fondamentali per garantire l'efficienza dei processi lungo l'intero ciclo di vita del software. 

La sua funzione primaria è quella di fornire un quadro d'insieme che permetta al team e agli stakeholder di monitorare l'evoluzione del prodotto, partendo dalla gestione proattiva dei rischi per neutralizzarli prima che possano impattare sui requisiti. A tal fine, il documento stabilisce una schedulazione puntuale dei task e identifica le milestone per il rispetto delle scadenze, integrando queste informazioni con una stima dei costi e una distribuzione equilibrata del lavoro tra i ruoli. 

Il documento viene aggiornato a ogni sprint e rappresenta la memoria storica del progetto.

== Scopo del progetto
Il Capitolato *Automated EN18031 Compliance Verification*, proposto da Bluewind S.r.l., consiste nello sviluppo di un'applicazione web che aiuta le
aziende a verificare se un dispositivo radio soddisfa i requisiti di cybersecurity
imposti dallo standard europeo EN 18031, obbligatorio dall'agosto 2025 per
ogni dispositivo Wi-Fi, Bluetooth, LTE o IoT immesso nel mercato UE.

Il cuore dello standard è una serie di Decision Tree:
sequenze di domande Sì/No che conducono a un esito finale di _Pass_, _Fail_ o
_Not Applicable_ per ogni requisito. Il progetto si concentra sui gruppi
*ACM* (Access Control Mechanism) e *AUM* (Authentication Mechanism) di
EN 18031.

L'applicazione web permetterà di:
- caricare la descrizione del dispositivo;
- importare gli alberi decisionali;
- guidare l'utente passo dopo passo attraverso le domande dell'albero;
- produrre un report esportabile con l'esito di ogni requisito verificato;
- mostrare una dashboard con la sintesi dei risultati.

== Glossario
Per garantire che ogni termine tecnico sia compreso correttamente e per evitare qualsiasi confusione, la documentazione è supportata da un glossario che raccoglie le definizioni dei vocaboli più specifici. Le parole incluse in questo elenco sono segnalate nel testo dalla lettera G posta a pedice (parola#sub[G]). Cliccando su questo simbolo, l'utente viene indirizzato alla sezione della pagina web del glossario dove può consultare la definizione del termine cercato.

== Riferimenti

=== Riferimenti normativi

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[#text(fill: blue)[Capitolato C1 - _Automated EN18031 Compliance Verification_, Bluewind S.r.l.]]

=== Riferimenti informativi

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[#text(fill: blue)[Slide IS A.A. 2025/2026 - _Regolamento del progetto didattico_ ]]

- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Glossario.pdf")[#text(fill: blue)[Glossario]]


= Informazioni sul progetto

== Modello di sviluppo
Il team adotta il framework *Scrum*. Il lavoro è suddiviso in sprint bisettimanali e al termine dello sprint viene garantita la rotazione dei ruoli per massimizzare l'apprendimento e la flessibilità del team.

== Metodologia di lavoro
Ogni sprint si apre con una riunione in cui si fissano obiettivi e compiti e a metà periodo si tiene un breve controllo dell'avanzamento. Alla fine dello sprint si svolge una retrospettiva per capire cosa ha funzionato e cosa migliorare nel ciclo successivo.
La scelta di sprint da due settimane permette cicli abbastanza brevi da consentire
correzioni rapide, ma abbastanza lunghi da completare attività significative.
I referenti di Bluewind vengono coinvolti periodicamente per raccogliere feedback e verificare
che il lavoro sia allineato con le aspettative.

== Preventivo economico e orario
Di seguito è riportato il preventivo economico, dove i costi del progetto sono prefissati in seguito alla Dichiarazione degli Impegni, condivisa con gli stakeholder in vista dell'aggiudicazione.

#align(center)[
  #figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: (left, center, center, center, right),
      stroke: 0.5pt + luma(100),
      table.header(
        [*Ruolo*], 
        [*Costo (€/h)*], 
        [*Ore Totali*],
        [*Costo Totale (€)*]
      ),
      [Responsabile],   [30], [60], [1800],
      [Amministratore], [20], [54], [1080],
      [Analista],       [25], [84], [1800],
      [Progettista],    [25], [120], [2400],
      [Programmatore],  [15], [108], [1620],
      [Verificatore],   [15], [132], [1980],
      table.cell(colspan: 2, align: center, fill: luma(220))[*Totale Complessivo*], [*558*], [*10 680*]
    ),
    caption: [Preventivo dei costi ripartito per ruoli.]
  )<tabella-preventivo>
]

== Milestone

#align(center)[
  #table(
    columns: (1fr, auto),
    stroke: 0.5pt + luma(100),
    inset: 7pt,
    [*Revisione*],[*Data prevista*],
    [Requirements and Technology Baseline (RTB)],[2026/--/--],
    [Product Baseline (PB)],[2026/--/--],
  )
]

#pagebreak()

= Analisi dei rischi

In questa sezione vengono elencate le situazioni che potrebbero compromettere il raggiungimento degli obiettivi, valutandone la probabilità di occorrenza e l'impatto atteso, e defininendo in anticipo le azioni da intraprendere per prevenirle o limitarne le conseguenze.
Nel contesto di questo progetto, l'analisi dei rischi è strutturata in quattro fasi ricorrenti che si ripetono per ogni sprint:

- *Identificazione:* si elencano le fonti di rischio potenziali, tenendo conto delle caratteristiche specifiche del progetto, come la novità del dominio applicativo, le tecnologie adottate, la composizione e l'esperienza del team, e i vincoli temporali imposti dal calendario accademico.

- *Valutazione:* per ciascun rischio si stima la probabilità di manifestazione (Bassa / Media / Alta) e l'impatto sul progetto in caso di occorrenza (Basso / Medio / Alto). La combinazione di questi due fattori determina la priorità con cui il rischio va gestito.

- *Pianificazione della risposta:* per ogni rischio si definiscono due tipi di azione, le misure di prevenzione (volte a ridurre la probabilità che il rischio si verifichi) e il piano di risposta (ovvero le azioni correttive da attivare qualora il rischio si manifesti nonostante le precauzioni adottate).

- *Monitoraggio:* a chiusura di ogni sprint, il team verifica quali rischi si sono effettivamente concretizzati, ne valuta la gestione nella retrospettiva e aggiorna il registro, aggiungendo eventuali nuovi rischi emersi nel corso del periodo.

I rischi sono classificati in tre categorie, identificate dal prefisso del codice\ *R[categoria][numero]*:
- *RT (Tecnologici):* legati alle tecnologie utilizzate o al dominio applicativo;

- *RO (Organizzativi):* legati alla pianificazione, al coordinamento interno e alla comunicazione con l'azienda proponente;

- *RI (Individuali):* legati alla disponibilità e agli impegni personali dei singoli componenti del team.

== Rischi tecnologici

#scheda-rischio(
  [RT-1],
  [Inesperienza con le tecnologie adottate],
  [Di progetto e di prodotto],
  [Alta],
  [Alto],
  [Prima di iniziare a sviluppare, il team dedica tempo allo studio delle
   tecnologie scelte. I membri con più esperienza in un'area affiancano gli altri.],
  [Se durante uno sprint emerge un blocco tecnico prolungato, si valutano
   soluzioni alternative più semplici o si chiede supporto a Bluewind.]
)

#scheda-rischio(
  [RT-2],
  [Fraintendimento dei requisiti dello standard EN 18031],
  [Di prodotto],
  [Media],
  [Alto],
  [Lo studio della norma avviene collettivamente, il team condivide le proprie interpretazioni e si confronta per allinearle.
   I dubbi interpretativi vengono portati a Bluewind negli incontri periodici.],
  [
    Se emergono errori di interpretazione dopo la stesura dell'Analisi dei Requisiti, si correggono tempestivamente i documenti e si adattano le attività di sviluppo per riallinearsi ai requisiti corretti, minimizzando l'impatto sui tempi.
  ]
)

== Rischi organizzativi

#scheda-rischio(
  [RO-1],
  [Stime delle ore non accurate],
  [Di progetto],
  [Alta],
  [Medio],
  [Le attività vengono scomposte in task piccoli e verificabili. Nei primi
   sprint si accetta un margine di errore più alto, e si usano le retrospettive
   per calibrare le stime successive man mano che si accumulano dati storici.],
  [Se uno sprint si chiude con uno scostamento rilevante, si analizzano le
   cause in retrospettiva e si adatta il metodo di stima. ]
)

#scheda-rischio(
  [RO-2],
  [Attività rimaste incompiute],
  [Di progetto],
  [Media],
  [Alto],
  [I task vengono assegnati tenendo conto della disponibilità reale di ogni
   membro. Lo stato di avanzamento viene monitorato tramite GitHub Projects e
   discusso nel punto di metà sprint.],
  [Se un task non viene completato entro lo sprint, entra nel backlog del
   successivo con priorità alta. La causa viene discussa in retrospettiva per
   capire se si tratta di una stima sbagliata, di un imprevisto o di un
   problema organizzativo da correggere.]
)

#scheda-rischio(
  [RO-3],
  [Difficoltà nel coordinamento con Bluewind],
  [Di progetto],
  [Bassa],
  [Medio],
  [Le comunicazioni con Bluewind vengono pianificate con anticipo. I dubbi
   vengono raccolti e presentati in modo raggruppato durante gli incontri.],
  [Se un'attività è bloccata in attesa di una risposta, il team si sposta
   su task non dipendenti e documenta le decisioni prese autonomamente,
   da sottoporre a validazione al primo incontro utile.]
)

== Rischi individuali

#scheda-rischio(
  [RI-1],
  [Disponibilità ridotta per impegni accademici o personali],
  [Di progetto],
  [Alta],
  [Alto],
  [All'inizio di ogni sprint ciascun membro comunica la propria disponibilità
   prevista. La pianificazione viene adattata di conseguenza, evitando di
   concentrare lavoro critico nei periodi di sessione d'esame.],
  [Se un membro risulta temporaneamente indisponibile, le sue attività vengono
   ridistribuite. La documentazione è mantenuta aggiornata in modo che il
   subentro di un altro membro sia rapido e senza perdite di lavoro già svolto.]
)

#pagebreak()


= Pianificazione nel breve termine
Ogni sprint viene documentato con la stessa struttura, che permette di confrontare
in modo diretto quanto pianificato con quanto effettivamente realizzato:

+ *Periodo*: date previste ed effettive.
+ *Attività pianificate*: lista dei task pianificati a inizio sprint.
+ *Rischi attesi*: rischi ritenuti probabili per questo sprint.
+ *Preventivo*: ore stimate per ciascun componente e ruolo.
+ *Consuntivo*: ore effettive, con le variazioni rispetto al preventivo.
+ *Risorse rimanenti*: budget e ore residui dopo lo sprint.
+ *Rischi incontrati*: resoconto di quanto si è effettivamente verificato.
+ *Retrospettiva*: analisi critica al termine dello sprint.

== Sprint 1
=== Periodo
#table(
  columns: (0.3fr, 1fr),
  stroke: none,
  inset: (left: 0pt, right: 0pt, top: 4pt, bottom: 4pt),
  [*Inizio:*],        [2026/04/03],
  [*Fine prevista:*], [2026/04/21],
  [*Fine reale:*],    [2026/04/21],
)
#v(0.3em)

=== Attività pianificate
Nel primo sprint il team si è focalizzato sull'apprendimento della norma EN 18031 e sull'avvio della stesura dei documenti di pianificazione. Le attività principali sono state:

- Prima stesura del Piano di Progetto: redazione delle sezioni introduttive, definizione del modello di sviluppo e della metodologia di lavoro, stima dei costi, pianificazione delle milestone e del primo sprint.

- Prima stesura del Glossario: raccolta e definizione dei termini tecnici più rilevanti per il progetto.

- Incontro Bluewind: allineamento sui requisiti con l'azienda proponente.

- Analisi EN 18031: studio individuale dei requisiti ACM e AUM per la compliance.
- Aggiornamento del sito web: revisione del sito per allinearlo alla nuova fase del progetto.

- Stesura prime sezioni dell'Analisi dei Requisiti: redazione delle sezioni iniziali del documento di Analisi dei Requisiti.


=== Rischi attesi
In questo sprint ci si aspetta principalmente tre tipologie di problema:
- *RO-1*: la difficoltà di stima in quanto si tratta del primo sprint, potrebbe portare a scostamenti significativi tra ore preventivate ed effettive, soprattutto nelle attività di studio e redazione dei documenti.
- *RT-2*: la complessità dello standard EN 18031, che richiede un'interpretazione accurata per essere tradotto in requisiti tecnici, potrebbe causare fraintendimenti che si riflettono in futuri errori di progettazione o sviluppo.
- *RI-1*: la disponibilità dei membri del team potrebbe essere influenzata da impegni personali, soprattutto considerando che non si è ancora consolidata una routine di lavoro condivisa.
- *RO-3*: la comunicazione con Bluewind, se non gestita in modo efficace, potrebbe portare a ritardi nella risoluzione di dubbi interpretativi sui requisiti, con conseguenti blocchi nelle attività dipendenti dai chiarimenti.


=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [6],[-],[-],[-],[-],[-],[6]),
    ([Edis Hodja],         [-],[-],[8],[-],[-],[-],[8]),
    ([Filippo Zonta Rocha],[-],[-],[-],[-],[-],[6],[6]),
    ([Giovanni Angelo Marco Bronte],    [-],[-],[8],[-],[-],[-],[8]),
    ([Ines Iadadi],        [-],[7],[-],[-],[-],[-],[7]),
    ([Leonardo Lorenzin],  [-],[-],[-],[-],[-],[6],[6]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*6*],[*7*],[*16*],[*0*],[*0*],[*12*],[*41*]),
  )),
    caption: [Preventivo ore per membro - Sprint 1]
)

=== Consuntivo
#figure(
 tabella-ore((
    ([Alberto Canavese],   [5#text(fill: green)[(-1)]],[-],[-],[-],[-],[-],[5]),
    ([Edis Hodja],         [-],[-],[7#text(fill: green)[(-1)]],[-],[-],[-],[7]),
    ([Filippo Zonta Rocha],[-],[-],[-],[-],[-],[6],[6]),
    ([Giovanni Angelo Marco Bronte],      [-],[-],[9#text(fill: red)[(+1)]],[-],[-],[-],[9]),
    ([Ines Iadadi],          [-],[7],[-],[-],[-],[-],[7]),
    ([Leonardo Lorenzin],    [-],[-],[-],[-],[-],[7#text(fill: red)[(+1)]],[7]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*5*],[*7*],[*16*],[*0*],[*0*],[*13*],[*41*]),

  )), caption: [Consuntivo ore per membro - Sprint 1]
)

=== Risorse rimanenti
#align(center)[
  #table(
    columns: (1.5fr, auto, auto, auto, auto, auto),
    align: (left, center, center, right, center, right),
    stroke: 0.5pt + luma(100),
    inset: (x: 8pt, y: 6pt),
    [*Ruolo*],[*€/h*],[*Ore sprint*],[*Costo sprint*],
    [*Ore residue*],[*Budget residuo*],
    [Responsabile],   [30],[5], [ 150€],[55],[1650€],
    [Amministratore], [20],[7], [ 140€],[47],[940€],
    [Analista],       [25],[16],[ 400€],[68],[1400€],
    [Progettista],    [25],[0], [   0€],[120],[2400€],
    [Programmatore],  [15],[0], [   0€],[108],[1620€],
    [Verificatore],   [15],[13], [ 195€],[119],[1785€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*],[*41*],[*595€*],[*517*],[*9795€*],
  )
]

=== Rischi incontrati
*Stime non accurate (RO-1)* Le ore preventivate per alcuni membri del team sono risultate diverse da quelle effettive. La causa principale è la
difficoltà di stimare attività di studio e impostazione documentale senza
dati di riferimento pregressi. Questo scostamento sarà usato come base per
calibrare le stime future.

*Difficoltà nella comprensione dei requisiti EN 18031 (RT-2)* La complessità dello standard ha richiesto più tempo del previsto per l'analisi individuale, e sono emersi dubbi interpretativi che hanno reso necessario un confronto interno prima di procedere con la stesura dell'Analisi dei Requisiti.

*Disponibilità personale (RI-1)* Alcuni componenti non hanno potuto dedicare tutto il tempo necessario allo sprint. La situazione è stata
gestita redistribuendo i task con maggiore flessibilità sulle date di
completamento interne, senza impatti sulla data di chiusura dello sprint.


=== Retrospettiva
L'incontro con Bluewind ha contribuito in modo significativo alla comprensione dei requisiti: i chiarimenti ricevuti sull'applicazione dello standard EN 18031 ai requisiti hanno orientato lo studio individuale e ridotto il rischio di interpretazioni errate. La stesura delle sezioni introduttive del Piano di Progetto e del Glossario ha inoltre fornito al team una base solida su cui continuare il lavoro dei prossimi sprint.

==== *Criticità emerse*

La complessità dello standard EN 18031 ha richiesto più tempo del previsto nella fase di analisi individuale, rendendo necessario un confronto interno supplementare per allineare le interpretazioni prima di procedere con la stesura dell'Analisi dei Requisiti, il team cerchera di mitigare questo rischio condividendo in modo più strutturato i risultati dello studio individuale, pianificando momenti di confronto più frequenti durante lo sprint.

Negli sprint successivi sarà inoltre importante migliorare la comunicazione interna per operare in modo più efficace, soprattutto per le attività che richiedono collaborazione stretta tra i membri.