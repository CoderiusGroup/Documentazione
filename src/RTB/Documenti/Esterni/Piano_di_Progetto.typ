#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 3cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Piano di Progetto], align(right)[Coderius Group],
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
  #text(size: 26pt, weight: "bold")[Piano di Progetto]
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
    [0.6.0], [2026/06/01], [Filippo Zonta Rocha], [Giovanni Bronte], [Aggiunta delle sezioni Sprint 5: 4.5.1, 4.5.2, 4.5.3],
    [0.5.1], [2026/05/29], [Edis Hodja], [Giovanni Bronte], [Aggiunta delle sezioni: 4.4.5, 4.4.6, 4.4.7, 4.4.8],
    [0.5.0], [2026/05/20], [Edis Hodja], [Giovanni Bronte], [Aggiunta delle sezioni Sprint 4: 4.4.1, 4.4.2, 4.4.3, 4.4.4],
    [0.4.0], [2026/05/18], [Giovanni Bronte], [Filippo Zonta Rocha], [Conclusa sezione 4.3. Modificati degli errori minori nei calcoli delle risorse rimaste per lo Sprint 2.],
    [0.3.1], [2026/05/14], [Edis Hodja], [Filippo Zonta Rocha], [Revisione lessicale e aggiunta del versionamento nell’impaginazione],
    [0.3.0], [2026/05/04], [Giovanni Bronte], [Filippo Zonta Rocha], [Aggiunta sezione 4.2 e sezioni da 4.3.1 a 4.3.4. Aggiunti i rischi RO-4 e RI-2.],
    [0.2.0], [2026/04/21], [Alberto Canavese], [Filippo Zonta Rocha], [Correzione refusi],
    [0.1.0], [2026/04/21], [Ines Iadadi], [Alberto Canavese], [Prima stesura del documento e redazione Sprint 1],
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

La sua funzione primaria è quella di fornire un quadro d'insieme che permetta al team e agli stakeholder di monitorare l'evoluzione del prodotto, partendo dalla gestione proattiva dei rischi per neutralizzarli prima che possano impattare sui requisiti. \
A tal fine, il documento stabilisce una schedulazione puntuale dei task e identifica le milestone per il rispetto delle scadenze, integrando queste informazioni con una stima dei costi e una distribuzione equilibrata del lavoro tra i ruoli.

Il documento viene aggiornato a ogni sprint bisettimanale e rappresenta la memoria storica del progetto.

== Scopo del progetto
Il Capitolato *Automated EN18031 Compliance Verification*, proposto da Bluewind S.r.l., consiste nello sviluppo di un'applicazione web-based che aiuta le
aziende a verificare se un dispositivo radio soddisfa i requisiti di cybersecurity
imposti dallo standard europeo EN 18031, obbligatorio dall'agosto 2025 per
ogni dispositivo Wi-Fi, Bluetooth, LTE o IoT immesso nel mercato UE.

Il cuore dello standard è una serie di Decision Tree:
sequenze di domande Sì/No che conducono a un esito finale di _Pass_, _Fail_ o
_Not Applicable_ per ogni requisito. Il progetto si concentra sui gruppi
*ACM* (Access Control Mechanism) e *AUM* (Authentication Mechanism) dello standard
EN 18031.

L'applicazione web permetterà di:
- caricare la descrizione del dispositivo;
- importare gli alberi decisionali;
- guidare l'utente passo dopo passo attraverso le domande dell'albero;
- produrre un report esportabile con l'esito di ogni requisito verificato;
- mostrare una dashboard con la sintesi dei risultati.

== Glossario
Per garantire che ogni termine tecnico sia compreso correttamente e per evitare qualsiasi confusione, la documentazione è supportata da un glossario che raccoglie le definizioni dei vocaboli più specifici. Le parole incluse in questo elenco sono segnalate nel testo dalla lettera G posta a pedice (parola#sub[G]). Cliccando su questo simbolo, l'utente viene indirizzato alla sezione della pagina web del glossario dove può consultare la definizione approfondita del termine individuato.

== Riferimenti

=== Riferimenti normativi

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1.pdf")[#text(
    fill: blue,
  )[Capitolato C1 - _Automated EN18031 Compliance Verification_, Bluewind S.r.l.]]

=== Riferimenti informativi

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/PD1.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2025/2026 - _Regolamento del progetto didattico_ ]]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T04.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2025/2026 - _Gestione di progetto_ ]]

- #link("https://www.math.unipd.it/~tullio/IS-1/2025/Dispense/T02.pdf")[#text(
    fill: blue,
  )[Slide IS A.A. 2025/2026 - _Processi di ciclo di vita del software_ ]]

- #link("https://coderiusgroup.github.io/Documentazione/docs/RTB/Documenti/Interni/Glossario.pdf")[#text(
    fill: blue,
  )[Glossario]]


= Informazioni sul progetto

== Modello di sviluppo
Il team adotta il framework *Scrum*. Il lavoro è suddiviso in sprint bisettimanali e al termine dello sprint viene garantita la rotazione dei ruoli per massimizzare l'apprendimento e la flessibilità del team, favorendo una conoscenza trasversale del prodotto e riducendo le dipendenze critiche sulle singole persone.

== Metodologia di lavoro
Ogni sprint si apre con una riunione in cui si fissano obiettivi e compiti e a metà periodo si tiene un breve controllo dell'avanzamento. Alla fine dello sprint si svolge una retrospettiva per capire cosa ha funzionato e cosa migliorare nel ciclo successivo. \
La scelta di sprint bisettimanali permette cicli abbastanza brevi da consentire
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
      table.header([*Ruolo*], [*Costo (€/h)*], [*Ore Totali*], [*Costo Totale (€)*]),
      [Responsabile], [30], [60], [1800],
      [Amministratore], [20], [54], [1080],
      [Analista], [25], [72], [1800],
      [Progettista], [25], [96], [2400],
      [Programmatore], [15], [108], [1620],
      [Verificatore], [15], [132], [1980],
      table.cell(colspan: 2, align: center, fill: luma(220))[*Totale Complessivo*], [*522*], [*10 680*],
    ),
    caption: [Preventivo dei costi ripartito per ruoli.],
  )<tabella-preventivo>
]
#pagebreak()

== Milestone

#align(center)[
  #table(
    columns: (1fr, auto),
    stroke: 0.5pt + luma(100),
    inset: 7pt,
    [*Revisione*], [*Data prevista*],
    [Requirements and Technology Baseline (RTB)], [2026/--/--],
    [Product Baseline (PB)], [2026/--/--],
  )
]

#pagebreak()

= Analisi dei rischi

In questa sezione vengono elencate le situazioni che potrebbero compromettere il raggiungimento degli obiettivi, valutandone la probabilità di occorrenza e l'impatto atteso, e definendo in anticipo le azioni da intraprendere per prevenirle o limitarne le conseguenze.
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
    soluzioni alternative più semplici o si chiede supporto a Bluewind.],
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
  ],
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
    cause in retrospettiva e si adatta il metodo di stima. ],
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
    problema organizzativo da correggere.],
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
    da sottoporre a validazione al primo incontro utile.],
)

#scheda-rischio(
  [RO-4],
  [Difficoltà nel coordinamento nel team Coderius],
  [Di progetto],
  [Bassa],
  [Alto],
  [Il team si incontra almeno una volta a settimana per discutere su come spartirsi il lavoro al meglio. Inoltre abbiamo canali di comunicazione molto rapidi per poter coordinarci anche fuori dai meeting prefissati.],
  [Viene fissato un incontro di emergenza il più velocemente possibile in caso di grave scoordinamento del team, nel quale si discute del problema e si riallineano i compiti in modo che non si sovrappongano e svolgano il lavoro nel modo più efficiente possibile. In caso di problema minore si usano i canali di comunicazione rapidi (Whatsapp e Discord) per avvisare il team e gestire il lavoro.],
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
    subentro di un altro membro sia rapido e senza perdite di lavoro già svolto.],
)

#scheda-rischio(
  [RI-2],
  [Disponibilità ridotta per imprevisti o impegno improvviso],
  [Di progetto],
  [Media],
  [Alto],
  [È impossibile prevedere se o quanti imprevisti o impegni improvvisi ci saranno, l'unica cosa che si può fare è avere un piano di risposta solido, repentino ed efficace per ridurre il rallentamento del lavoro al minimo.],
  [La persona coinvolta avvisa il resto del gruppo il più tempestivamente possibile, in modo che gli altri membri possano dividersi il lavoro rimasto o alternativamente rimandarlo se non è urgente che venga completato.],
)

#scheda-rischio(
  [RI-3],
  [Errore nella scrittura di un documento],
  [Di progetto],
  [Media],
  [Alto],
  [Il team si incontra per discutere sulla qualità dei documenti e sulle normative scritte, le quali dettano le regole da seguire per la redazione di tutti i documenti scritti durante il progetto.],
  [Una volta trovato l'errore si crea un branch apposito di fix, copiando il branch contenendo il documento errato. Il verificatore effettua le opportune correzioni e si apre una PR per fare la merge con il branch originale.],
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
  [*Inizio:*], [2026/04/03],
  [*Fine prevista:*], [2026/04/21],
  [*Fine reale:*], [2026/04/21],
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
    ([Alberto Canavese], [6], [-], [-], [-], [-], [-], [6]),
    ([Edis Hodja], [-], [-], [8], [-], [-], [-], [8]),
    ([Filippo Zonta Rocha], [-], [-], [-], [-], [-], [6], [6]),
    ([Giovanni Angelo Marco Bronte], [-], [-], [8], [-], [-], [-], [8]),
    ([Ines Iadadi], [-], [7], [-], [-], [-], [-], [7]),
    ([Leonardo Lorenzin], [-], [-], [-], [-], [-], [6], [6]),
    (table.cell(align: center, fill: luma(220))[*Totale*], [*6*], [*7*], [*16*], [*0*], [*0*], [*12*], [*41*]),
  )),
  caption: [Preventivo ore per membro - Sprint 1],
)

=== Consuntivo
#figure(
  tabella-ore((
    ([Alberto Canavese], [5#text(fill: green)[(-1)]], [-], [-], [-], [-], [-], [5]),
    ([Edis Hodja], [-], [-], [7#text(fill: green)[(-1)]], [-], [-], [-], [7]),
    ([Filippo Zonta Rocha], [-], [-], [-], [-], [-], [6], [6]),
    ([Giovanni Angelo Marco Bronte], [-], [-], [9#text(fill: red)[(+1)]], [-], [-], [-], [9]),
    ([Ines Iadadi], [-], [7], [-], [-], [-], [-], [7]),
    ([Leonardo Lorenzin], [-], [-], [-], [-], [-], [7#text(fill: red)[(+1)]], [7]),
    (table.cell(align: center, fill: luma(220))[*Totale*], [*5*], [*7*], [*16*], [*0*], [*0*], [*13*], [*41*]),
  )),
  caption: [Consuntivo ore per membro - Sprint 1],
)

=== Risorse rimanenti
#align(center)[
  #table(
    columns: (1.5fr, auto, auto, auto, auto, auto),
    align: (left, center, center, right, center, right),
    stroke: 0.5pt + luma(100),
    inset: (x: 8pt, y: 6pt),
    [*Ruolo*], [*€/h*], [*Ore sprint*], [*Costo sprint*],
    [*Ore residue*], [*Budget residuo*],
    [Responsabile], [30], [5], [ 150€], [55], [1650€],
    [Amministratore], [20], [7], [ 140€], [47], [940€],
    [Analista], [25], [16], [ 400€], [56], [1400€],
    [Progettista], [25], [0], [   0€], [96], [2400€],
    [Programmatore], [15], [0], [   0€], [108], [1620€],
    [Verificatore], [15], [13], [ 195€], [119], [1785€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*41*], [*885€*], [*481*], [*9795€*],
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

La complessità dello standard EN 18031 ha richiesto più tempo del previsto nella fase di analisi individuale, rendendo necessario un confronto interno supplementare per allineare le interpretazioni prima di procedere con la stesura dell'Analisi dei Requisiti. Il team cercherà di mitigare questo rischio condividendo in modo più strutturato i risultati dello studio individuale, pianificando momenti di confronto più frequenti durante lo sprint.

Negli sprint successivi sarà inoltre importante migliorare la comunicazione interna per operare in modo più efficace, soprattutto per le attività che richiedono collaborazione stretta tra i membri.

== Sprint 2

=== Periodo 
#table(
  columns: (0.3fr, 1fr),
  stroke: none,
  inset: (left: 0pt, right: 0pt, top: 4pt, bottom: 4pt),
  [*Inizio:*],        [2026/04/21],
  [*Fine prevista:*], [2026/04/30],
  [*Fine reale:*],    [2026/04/30],
)
#v(0.3em)

=== Attività pianificate

Nel secondo sprint il team si concentrerà sulla stesura dei vari Use case per l'analisi dei requisiti e il continuo della stesura dei seguenti documenti: Norme di Progetto, Piano di progetto. Le attività principali saranno:\
- Continuo della stesura dell'analisi dei requisiti: in particolar modo sono stati definiti gli use case da UC-1 a UC-19 e modificati alcuni scritti precedentemente.
- Prima stesura delle Norme di Progetto: redazione dell'introduzione, dei processi primari e dei processi di supporto.
- Aggiornamento del glossario: aggiunta di vari termini usati nei vari documenti stesi in questo sprint.
- Incontro Bluewind: riunione con l'azienda con un particolare focus sulle domande proposte dagli analisti per comprendere in maniera ottimale i requisiti richiesti dall'azienda, dopo che la normativa EN18031 è stata approfondita.
- Aggiunta ricerca automatica glossario: è stata implementata una funzione nella repository  github per ricercare i termini presenti nel glossario nei vari documenti caricati e aggiungere un appendice G per poterli identificare.

=== Rischi attesi
- *RO-1*: La difficoltà di stimare le ore in modo non accurato potrebbe essere un problema per questo sprint e per i successivi, fino a quando il team non prende più confidenza su come lavorare al meglio per la riuscita del progetto.
- *RT-2*: La normativa EN18031 è molto complessa e richiede normalmente svariati mesi per essere studiata completamente, per questo motivo potrebbe causare fraintendimenti ed errori nell'analisi dei requisiti.

=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[-],[-],[-],[-],[8],[8]),
    ([Edis Hodja],         [-],[-],[8],[-],[-],[-],[8]),
    ([Filippo Zonta Rocha],[6],[-],[-],[-],[-],[-],[6]),
    ([Giovanni Angelo Marco Bronte],    [-],[2],[-],[-],[-],[-],[2]),
    ([Ines Iadadi],        [-],[-],[8],[-],[-],[-],[8]),
    ([Leonardo Lorenzin],  [-],[2],[-],[-],[-],[-],[2]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*6*],[*4*],[*16*],[*0*],[*0*],[*8*],[*34*]),
  )),
    caption: [Preventivo ore per membro - Sprint 2]
)

=== Consuntivo
#figure(
  tabella-ore((
    ([Alberto Canavese], [-], [-], [-], [-], [-], [7#text(fill: green)[(-1)]], [7]),
    ([Edis Hodja], [-], [-], [7#text(fill: green)[(-1)]], [-], [-], [-], [7]),
    ([Filippo Zonta Rocha], [5#text(fill: green)[(-1)]], [-], [-], [-], [-], [-], [5]),
    ([Giovanni Angelo Marco Bronte], [-], [3#text(fill: red)[(+1)]], [], [-], [-], [-], [3]),
    ([Ines Iadadi], [-], [-], [8#text(fill: red)[(+1)]], [-], [-], [-], [8]),
    ([Leonardo Lorenzin], [-], [4#text(fill: red)[(+2)]], [-], [-], [-], [-], [4]),
    (table.cell(align: center, fill: luma(220))[*Totale*], [*5*], [*7*], [*15*], [*0*], [*0*], [*7*], [*34*]),
  )),
  caption: [Consuntivo ore per membro - Sprint 2],
)
=== Risorse rimanenti
#align(center)[
  #table(
    columns: (1.5fr, auto, auto, auto, auto, auto),
    align: (left, center, center, right, center, right),
    stroke: 0.5pt + luma(100),
    inset: (x: 8pt, y: 6pt),
    [*Ruolo*], [*€/h*], [*Ore sprint*], [*Costo sprint*],
    [*Ore residue*], [*Budget residuo*],
    [Responsabile], [30], [5], [ 150€], [50], [1500€],
    [Amministratore], [20], [7], [140€], [40], [800€],
    [Analista], [25], [15], [375€], [41], [1025€],
    [Progettista], [25], [0], [   0€], [96], [2400€],
    [Programmatore], [15], [0], [   0€], [108], [1620€],
    [Verificatore], [15], [7], [ 105€], [112], [1680€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*43*], [*770€*], [*447*], [*9025€*], 
  )
]


=== Rischi incontrati
*RO-1*: Per questo sprint abbiamo assegnato a due persone il ruolo di amministratore, a causa di questo le ore rimaste a budget per il ruolo di amministratore sono risultate minori del previsto. Per il futuro il ruolo di amministratore sarà assegnato ad una sola persona per sprint e le ore preventivate saranno aggiustate di conseguenza.

=== Retrospettiva
Il team ha continuato la stesura di vari documenti essenziali per il Requirement and Product Baseline (RTB) quali: *Piano di Progetto*, *Analisi dei requisiti*, *Glossario*. Inoltre ha iniziato la stesura di un altro documento fondamentale per il progetto: le *Norme di Progetto*.\
L'incontro con Bluewind è stato inoltre fondamentale per l'Analisi dei requisiti, in quanto ha chiarito molte delle domande poste dagli analisti, questo ha evitato il rischio *RT-2* che avrebbe potuto causare un rallentamento nel progetto. 

==== *Criticità emerse*
Per questo sprint sono state assegnate due persone al ruolo di amministratore, questo ha causato una riduzione delle ore disponibili per il ruolo di amministratore superiore a quanto previsto. D'ora in avanti il team assegnerà una sola persona al ruolo di amministratore per sprint, in modo da evitare di andare oltre il numero di ore e budget stimato previsto dal documento: *DichiarazioneImpegni-2026-03-20.typ*.

#pagebreak()

== Sprint 3

=== Periodo 
#table(
  columns: (0.3fr, 1fr),
  stroke: none,
  inset: (left: 0pt, right: 0pt, top: 4pt, bottom: 4pt),
  [*Inizio:*],        [2026/05/02],
  [*Fine prevista:*], [2026/05/15],
  [*Fine reale:*],    [2026/05/15],
)
#v(0.3em)

=== Attività pianificate
Per il terzo sprint il nostro team si concentrerà sulla continuazione della stesura di vari documenti essenziali per l'RTB, quali: Norme di Progetto, Piano di Progetto, Analisi dei requisiti.
Le attività principali saranno:
- Continua stesura dell'analisi dei requisiti, il team si prefissa di arrivare ad una fase terminale del documento cosi facendo avendo una versione quasi definitiva, inviarlo all'azienda proponente per avere un feedback sullo stato di accuratezza del documento.
- Aggiornamento con Bluewind: è stato fissato un incontro per il 2026/05/04 per fare varie domande all'azienda in modo da chiarire alcuni dei dubbi sorti durante l'analisi dei requisiti.
- Stesura del secondo Diario di Bordo, stesura di un altro documento fatta da tutto il team che ha lo scopo di riassumere quanto fatto fino al giorno della redazione del documento per poterlo esporre durante l'attività omonima.
- Aggiornamento del sito, aggiungendo una sezione per il Diario di Bordo.
- Stesura dei vari verbali esterni e interni.

=== Rischi attesi
- *RO-2*: Per questo sprint sono presenti delle attività che il gruppo Coderius si è fissato di completare o di raggiungere un certo livello di completamento per poter procedere con il resto del progetto senza avere problemi di tempo in futuro. Per questo motivo c'è un rischio che possano rimanere incompiute.
- *RO-1*: Dopo il problema riscontrato nello scorso sprint il team starà molto più attento al quantitativo di ore rimaste per completare il progetto entro il quantitativo di ore prefissato, tuttavia potrebbe questo rischio potrebbe essere nuovamente presente in questo sprint data la poca esperienza del gruppo in questo ambito. 
=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[-],[8],[-],[-],[],[8]),
    ([Edis Hodja],         [-],[4],[-],[-],[-],[-],[4]),
    ([Filippo Zonta Rocha],[-],[-],[-],[-],[-],[7],[7]),
    ([Giovanni Angelo Marco Bronte],    [6],[-],[-],[-],[-],[-],[6]),
    ([Ines Iadadi],        [-],[-],[8],[-],[-],[-],[8]),
    ([Leonardo Lorenzin],  [-],[-],[-],[-],[-],[7],[7]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*6*],[*4*],[*16*],[*0*],[*0*],[*14*],[*40*]),
  )),
    caption: [Preventivo ore per membro - Sprint 3]
)

=== Consuntivo
#figure(
  tabella-ore((
    ([Alberto Canavese], [-], [-], [8], [-], [-], [-], [8]),
    ([Edis Hodja], [-], [4], [-], [-], [-], [-], [4]),
    ([Filippo Zonta Rocha], [-], [-], [-], [-], [-], [6#text(fill: green)[(-1)]], [6]),
    ([Giovanni Angelo Marco Bronte], [5#text(fill: green)[(-1)]], [-], [], [-], [-], [-], [5]),
    ([Ines Iadadi], [-], [-], [8], [-], [-], [-], [8]),
    ([Leonardo Lorenzin], [-], [-], [-], [-], [-], [6#text(fill: green)[(-1)]], [6]),
    (table.cell(align: center, fill: luma(220))[*Totale*], [*5*], [*4*], [*16*], [*0*], [*0*], [*12*], [*37*]),
  )),
  caption: [Consuntivo ore per membro - Sprint 3],
)

=== Risorse rimanenti
#align(center)[
  #table(
    columns: (1.5fr, auto, auto, auto, auto, auto),
    align: (left, center, center, right, center, right),
    stroke: 0.5pt + luma(100),
    inset: (x: 8pt, y: 6pt),
    [*Ruolo*], [*€/h*], [*Ore sprint*], [*Costo sprint*],
    [*Ore residue*], [*Budget residuo*],
    [Responsabile], [30], [5], [ 150€], [45], [1350€],
    [Amministratore], [20], [4], [80€], [36], [720€],
    [Analista], [25], [16 ], [400€], [25], [625€],
    [Progettista], [25], [0], [   0€], [96], [2400€],
    [Programmatore], [15], [0], [   0€], [108], [1620€],
    [Verificatore], [15], [12], [ 180€], [100], [1500€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*37*], [*810€*], [*410*], [*8215€*], 
  )
]

=== Rischi incontrati 
- *RO-4*: A causa di una mancata comunicazione nel team durante la scrittura dell'Analisi dei Requisiti, sono stati notati degli UC errati. A causa di questo è stato usato del tempo per modificare gli UC errati invece che per proseguire con la redazione dell'AdR. In futuro, il team terrà delle riunioni per discutere degli UC da scrivere e evitare che si ripeta questo problema.

=== Retrospettiva
Il team ha continuato la redazione dei vari documenti richiesti per l'RTB: *Norme di Progetto*, *Analisi dei Requisiti*, *Piano di Progetto*; e ha iniziato la stesura di un altro documento fondamentale per l'RTB: il *Piano di Qualifica*.
Per questo sprint il team si è particolarmente concentrato sui documenti: *Norme di Progetto* e *Analisi dei Requisiti*, i quali sono adesso ad un punto abbastanza avanzato.\
Questo sprint sono iniziati i Diari di Bordo, attività dove il team discute con il proponente del lavoro svolto, i piani futuri e i rischi incontrati. Sono stati creati dei documenti appositi per questi incontri che andranno in futuro implementati nel sito web del gruppo.\
Sono stati implementati dei cambiamenti minori per migliorare l'Issue Tracking System presente nella repository github.

==== *Criticità emerse*
Come scritto nei rischi incontrati, la criticità principale riscontrata in questo sprint è stata una mancanza di comunicazione nel team per quanto riguarda la scrittura degli UC. Questo ha causato un significativo ritardo nella scrittura dell'Analisi dei Requisiti perchè gli analisti hanno dovuto riscrivere gli UC errati.
Per evitare che questo problema accada nuovamente in futuro, gli analisti dovranno discutere assieme al resto del team dei vari UC da scrivere. 


#pagebreak()

== Sprint 4

=== Periodo 
#table(
  columns: (0.3fr, 1fr),
  stroke: none,
  inset: (left: 0pt, right: 0pt, top: 4pt, bottom: 4pt),
  [*Inizio:*],        [2026/05/16],
  [*Fine prevista:*], [2026/05/29],
  [*Fine reale:*],    [2026/05/29],
)
#v(0.3em)

=== Attività pianificate
Nel quarto sprint il gruppo presterà ancora attenzione sulla documentazione richiesta per l'RTB, focalizzandosi specialmente sulla stesura definitiva dell'Analisi dei Requisiti, documento essenziale per una maggiore comprensione strutturale dell'operato desiderabile. Oltre a ciò, compito dell'Amministratore, sarà quello di iniziare a strutturare al meglio il Piano di Qualifica integrando metriche di qualità, criteri di verifica e procedure di validazione necessarie a garantire la conformità del prodotto agli obiettivi progettuali e agli standard definiti dal capitolato.
Naturalmente i restanti documenti saranno ancora in via di sviluppo, prossimi a una conclusione. Le attività principali saranno:

- Aggiunta e ristrutturazione dell'ordine degli UC presenti nell'Analisi dei Requisiti con integrazione dei diagrammi UML finali.
- Aggiornamento del glossario: aggiunta di vari termini usati nei vari documenti stesi in questo sprint.
- Incontro con la proponente: domande relative ai casi d'uso e criticità riscontrate nell'evoluzione dell'operato.
- Stesura del terzo Diario di Bordo: obiettivi raggiunti, criticità riscontrate, passi operativi futuri.
- Realizzazione del mock-up, versione abbozzata dell'interfaccia grafica, in vista di una revisione da parte della proponente.
- Stesura dei vari verbali esterni e interni.

=== Rischi attesi
- *RO-1*: Il team potrebbe anche per questo sprint incorrere in errori di stime relativi alle ore non accurate. Si tratta comunque di un rischio sempre con una probabilità inferiore rispetto agli scorsi sprint, ma pur sempre altamente concreto.
- *RO-2*: Per questo sprint è altamente probabile incorrere in difficoltà nel coordinamento con tutto il team, specialmente a causa dell’elevato carico di lavoro richiesto dalla finalizzazione della documentazione e della necessità di mantenere allineate le attività tra i diversi ruoli operativi del gruppo.
- *RI-1*: Considerato l’avvicinarsi di un periodo accademico particolarmente intenso, è probabile riscontrare difficoltà nella disponibilità organizzativa dei membri del gruppo, con conseguenti rallentamenti temporanei nello svolgimento di alcune attività operative.

 
=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[4],[-],[-],[-],[],[4]),
    ([Edis Hodja],         [6],[-],[-],[-],[-],[-],[6]),
    ([Filippo Zonta Rocha],[-],[-],[7],[-],[-],[-],[7]),
    ([Giovanni Angelo Marco Bronte],    [-],[-],[-],[-],[-],[7],[7]),
    ([Ines Iadadi],        [-],[-],[-],[4],[-],[-],[4]),
    ([Leonardo Lorenzin],  [-],[-],[7],[-],[-],[-],[7]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*6*],[*4*],[*14*],[*4*],[*0*],[*7*],[*35*]),
  )),
    caption: [Preventivo ore per membro - Sprint 4]
)

=== Consuntivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[4],[-],[-],[-],[],[4]),
    ([Edis Hodja],         [5 #text(fill: green)[(-1)]],[-],[-],[-],[-],[-],[5]),
    ([Filippo Zonta Rocha],[-],[-],[5 #text(fill: green)[(-2)]],[-],[-],[-],[5]),
    ([Giovanni Angelo Marco Bronte],    [-],[-],[-],[-],[-],[7],[7]),
    ([Ines Iadadi],        [-],[-],[-],[5 #text(fill: red)[(+1)]],[-],[-],[5]),
    ([Leonardo Lorenzin],  [-],[-],[7],[-],[-],[-],[7]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*5*],[*4*],[*12*],[*5*],[*0*],[*7*],[*33*]),
  )),
    caption: [Consuntivo ore per membro - Sprint 4]
)

=== Risorse rimanenti
#align(center)[
  #table(
    columns: (1.5fr, auto, auto, auto, auto, auto),
    align: (left, center, center, right, center, right),
    stroke: 0.5pt + luma(100),
    inset: (x: 8pt, y: 6pt),
    [*Ruolo*], [*€/h*], [*Ore sprint*], [*Costo sprint*],
    [*Ore residue*], [*Budget residuo*],
    [Responsabile], [30], [5], [ 150€], [40], [1200€],
    [Amministratore], [20], [4], [80€], [32], [640€],
    [Analista], [25], [12], [300€], [13], [325€],
    [Progettista], [25], [5], [   125€], [91], [2275€],
    [Programmatore], [15], [0], [   0€], [108], [1620€],
    [Verificatore], [15], [7], [ 105€], [93], [1395€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*33*], [*760€*], [*377*], [*7455€*], 
  )
]

=== Rischi incontrati 
- *RI-3*: Sono stati trovati degli errori in alcuni verbali del team. Tale circostanza ha richiesto l’intervento tempestivo di parte del team, con il conseguente impiego di risorse aggiuntive e il potenziale rallentamento delle attività pianificate. Per mitigare il rischio, sono state corrette alcune imprecisioni e riviste le procedure descrittive attraverso momenti di confronto e collaborazione tra i membri del gruppo, al fine di ridurre la probabilità che situazioni analoghe si ripresentino in futuro.
- *RI-1*: Nel corso di questo periodo bisettimanale, la concomitanza di impegni accademici e personali ha comportato una riduzione della disponibilità di alcuni membri del team. In particolare, l’avvicinarsi della sessione estiva degli esami ha richiesto una maggiore attenzione nella gestione del tempo, con possibili ripercussioni sulla partecipazione alle attività progettuali. Per garantire il rispetto delle scadenze e la continuità del lavoro, il gruppo ha fatto ricorso a un’organizzazione più flessibile delle attività e a un costante coordinamento tra i componenti del team.

=== Retrospettiva
A seguito dei progressi ottenuti nello sprint precedente, il team ha proseguito il lavoro sulla documentazione richiesta per l’RTB, portando avanti in particolare il completamento dell’*Analisi dei Requisiti* e l’evoluzione del *Piano di Qualifica*. L’attenzione si è concentrata sulla riorganizzazione e sul perfezionamento dei casi d’uso, con l’integrazione dei diagrammi UML definitivi al fine di rendere più chiara e completa la descrizione delle funzionalità del sistema.

In parallelo, è continuata l’attività di aggiornamento del glossario, arricchito con nuovi termini emersi durante la stesura e la revisione dei documenti.
Durante questo sprint è stata avviata anche la progettazione preliminare dell’interfaccia grafica attraverso la realizzazione di un primo mock-up, utile a visualizzare l’organizzazione delle principali funzionalità e a raccogliere eventuali osservazioni in vista delle fasi successive. Parallelamente, sono proseguite le attività di documentazione ordinaria con la redazione del terzo Diario di Bordo e dei verbali.


==== *Criticità emerse*
La principale criticità riscontrata durante questo sprint ha riguardato il completamento degli ultimi casi d’uso dell’*Analisi dei Requisiti*. In particolare, il team ha incontrato alcune difficoltà nel definire con precisione determinati scenari e nel rappresentarli correttamente attraverso i diagrammi UML, rendendo necessarie ulteriori attività di revisione e confronto.
Per affrontare tali problematiche, il gruppo ha svolto un colloquio di confronto con il professor Cardin, ottenendo chiarimenti utili sulla modellazione dei casi d’uso e dei relativi diagrammi. 

#pagebreak()

== Sprint 5

=== Periodo 
#table(
  columns: (0.3fr, 1fr),
  stroke: none,
  inset: (left: 0pt, right: 0pt, top: 4pt, bottom: 4pt),
  [*Inizio:*],        [2026/05/30],
  [*Fine prevista:*], [2026/06/12],
  [*Fine reale:*],    [2026/06/12],
)
#v(0.3em)

=== Attività pianificate
Nel quinto sprint il gruppo continuerà a lavorare sulla documentazione richiesta per l'RTB, focalizzandosi sulla finalizzazione dell'Analisi dei Requisiti con gli ultimi controlli sulla qualità del documento e la presentazione del mockup all'azienda Bluewind. 
In questo sprint il gruppo ha anche introdotto nella ruotazione dei ruoli il programmatore, data la necessità di creare un PoC richiesto dall' RTB.

 Le attività principali saranno:

- Presentazione del mockup a Bluewind per avere un feedback preliminare.
- Preparare PoC per la presentazione finale, con particolare attenzione alla stesura del documento di presentazione.
- Stesura dei vari verbali esterni e interni.
- Stesura del quarto e quinto Diario di Bordo: obbiettivi raggiunti, criticità riscontrare, passi operativi futuri.
- Aggiornamento del glossario: aggiunta di vari termini usati nei vari documenti stesi in questo sprint.

=== Rischi attesi
- *RO-2*: Come per il precedente  sprint è  probabile incorrere in difficoltà nel coordinamento con tutto il team, specialmente a causa dell’elevato carico di lavoro richiesto in vista dell'avvicinarsi della presentazione RTB.
- *RI-1*: Considerato l’avvicinarsi di un periodo accademico particolarmente intenso e di giornate festive, è probabile riscontrare difficoltà nella disponibilità organizzativa dei membri del gruppo, con conseguenti rallentamenti temporanei nello svolgimento di alcune attività operative.
 
=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[-],[-],[5],[-],[-],[5]),
    ([Edis Hodja],         [-],[-],[-],[-],[8],[-],[8]),
    ([Filippo Zonta Rocha],[6],[-],[-],[-],[-],[-],[6]),
    ([Giovanni Angelo Marco Bronte],    [-],[-],[5],[-],[-],[-],[5]),
    ([Ines Iadadi],        [-],[-],[-],[-],[-],[7],[7]),
    ([Leonardo Lorenzin],  [-],[4],[-],[-],[-],[-],[4]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*6*],[*4*],[*5*],[*5*],[*8*],[*7*],[*35*]),
  )),
    caption: [Preventivo ore per membro - Sprint 5]
)
