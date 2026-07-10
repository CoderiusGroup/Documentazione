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
  #text(size: 20pt)[*Versione 1.2.0*]
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
    [1.2.0], [2026/07/10], [Leonardo Lorenzin], [], [Aggiunta delle sezioni Sprint 7: 4.7.5, 4.7.6, 4.7.7, 4.7.8 e correzione refusi],
    [1.1.0], [2026/06/30], [Leonardo Lorenzin], [], [Aggiunta delle sezioni Sprint 7: 4.7.1, 4.7.2, 4.7.3, 4.7.4],
    [1.0.0], [2026/06/29], [Leonardo Lorenzin], [], [Approvazione del documento Piano di Progetto],
    [0.6.4], [2026/06/29], [Leonardo Lorenzin], [Filippo Zonta Rocha], [Aggiornamento sezione 2.1 e correzioni minori],
    [0.6.3], [2026/06/25], [Alberto Canavese], [Leonardo Lorenzin], [Aggiunta delle sezioni Sprint 6: 4.6.1, 4.6.2, 4.6.3, 4.6.4, 4.6.5, 4.6.6, 4.6.7, 4.6.8],
    [0.6.2], [2026/06/12], [Filippo Zonta Rocha], [Ines Iadadi], [Aggiunta delle sezioni:4.5.5, 4.5.6,4.5.7, 4.5.8],
    [0.6.1], [2026/06/05], [Ines Iadadi], [Alberto Canavese], [Revisione lessicale delle sezioni Sprint 2 e Sprint 3],
    [0.6.0], [2026/06/01], [Filippo Zonta Rocha], [Ines Iadadi], [Aggiunta delle sezioni Sprint 5: 4.5.1, 4.5.2, 4.5.3,4.5.4],
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
Il team adotta un approccio Agile, nello specifico il framework Scrum. Le motivazioni che hanno portato alla scelta di questo modello sono le seguenti:

- Rotazione dei ruoli: il framework Scrum divide il lavoro in sprint bisettimanali; al termine di ciascuno di essi, viene garantita la rotazione dei ruoli per massimizzare l’apprendimento e la flessibilità del team, favorendo una conoscenza trasversale del prodotto e riducendo le dipendenze critiche sulle singole persone.
- Reattività: suddividere le attività in sprint consente al team di reagire rapidamente a eventuali imprevisti che possano presentarsi durante lo svolgimento del progetto.
- Retrospettive: nella filosofia Agile, a differenza di altri modelli, viene dedicato un momento per riflettere su come è stato svolto il lavoro assegnato. Questa retrospettiva consente di analizzare eventuali errori commessi durante lo sprint e di aggiornare di conseguenza il Way of Working, riducendo così il rischio di commetterli nuovamente.

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

#pagebreak()
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
*RO-1:* Le ore preventivate per alcuni membri del team sono risultate diverse da quelle effettive. La causa principale è la
difficoltà di stimare attività di studio e impostazione documentale senza
dati di riferimento pregressi. Questo scostamento sarà usato come base per
calibrare le stime future.

*RT-2:* La complessità dello standard ha richiesto più tempo del previsto per l'analisi individuale, e sono emersi dubbi interpretativi che hanno reso necessario un confronto interno prima di procedere con la stesura dell'Analisi dei Requisiti.

*RI-1:* Alcuni componenti non hanno potuto dedicare tutto il tempo necessario allo sprint. La situazione è stata
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
  [*Fine prevista:*], [2026/05/01],
  [*Fine reale:*],    [2026/05/01],
)
#v(0.3em)

=== Attività pianificate

Nel secondo sprint il team si concentrerà sulla continuazione della stesura dell'Analisi dei Requisiti e sul proseguimento dei seguenti documenti: Norme di Progetto, Piano di Progetto. Le attività principali saranno:\
- Continuazione della stesura dell'Analisi dei Requisiti: definizione e consolidamento dei casi d'uso principali.
- Prima stesura delle Norme di Progetto: redazione dell'introduzione, dei processi primari e dei processi di supporto.
- Aggiornamento del Glossario: aggiunta dei termini introdotti nei documenti redatti durante lo sprint.
- Incontro con Bluewind: riunione con l'azienda per chiarire i dubbi emersi durante l'analisi dei requisiti e allineare le interpretazioni dello standard EN 18031.
- Automazione della ricerca dei termini del Glossario: implementazione di uno script nella repository GitHub per rilevare automaticamente i termini presenti nel Glossario all'interno dei documenti e aggiungere la G a pedice identificativa.

=== Rischi attesi
- *RO-1*: La stima delle ore rimane incerta in questo sprint, in quanto il team affronta per la prima volta attività quali la stesura delle Norme di Progetto e la gestione parallela di più documenti, e non dispone ancora di dati storici sufficienti per calibrare le stime in modo affidabile.
- *RT-2*: La complessità dello standard EN18031 potrebbe causare
  interpretazioni errate durante la stesura dell'Analisi dei Requisiti.

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
    ([Giovanni Angelo Marco Bronte], [-], [3#text(fill: red)[(+1)]], [-], [-], [-], [-], [3]),
    ([Ines Iadadi], [-], [-], [8], [-], [-], [-], [8]),
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
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*34*], [*770€*], [*447*], [*9025€*], 
  )
]


=== Rischi incontrati
*RO-1*: Le ore utilizzate per il ruolo di Amministratore hanno superato il preventivo a causa dell'assegnazione del ruolo a due membri contemporaneamente. Negli sprint successivi il ruolo di Amministratore sarà assegnato a un solo membro per volta, con il preventivo aggiornato di conseguenza.

=== Retrospettiva
Il team ha proseguito la redazione dei documenti essenziali per il Requirements and Technology Baseline (RTB): Piano di Progetto, Analisi dei Requisiti e Glossario. In questo sprint è stata avviata anche la prima stesura delle Norme di Progetto, con la redazione delle sezioni introduttive, dei processi primari e dei processi di supporto.

Sul fronte tecnico, è stata implementata un'automazione nella repository GitHub per il rilevamento dei termini del Glossario all'interno dei documenti, con aggiunta automatica della G a pedice identificativa. Questa funzionalità riduce il rischio di omissioni nelle future revisioni documentali.

L'incontro con Bluewind ha contribuito a chiarire i dubbi interpretativi emersi durante l'analisi dei requisiti, riducendo il rischio *RT-2* e consentendo agli analisti di proseguire la stesura degli use case con maggiore sicurezza.

==== *Criticità emerse*
La principale criticità di questo sprint è stata l'assegnazione del ruolo di Amministratore a due membri in contemporanea, che ha comportato un consumo di ore per quel ruolo significativamente superiore al preventivo. L'errore è attribuibile a una pianificazione iniziale non sufficientemente strutturata nella distribuzione dei ruoli.

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
Nel terzo sprint il team si concentrerà sulla continuazione della stesura dei documenti essenziali per l'RTB: Norme di Progetto, Piano di Progetto, Analisi dei Requisiti.
Le attività principali saranno:
- Continuazione della stesura dell'Analisi dei Requisiti: l'obiettivo è portare il documento a una versione avanzata da sottoporre all'azienda proponente per raccogliere un feedback sulla correttezza e completezza dei contenuti.
- Incontro con Bluewind: riunione pianificata per il 2026/05/04 per sottoporre i dubbi emersi durante l'analisi dei requisiti.
- Stesura del primo e del secondo Diario di Bordo: redazione del documento di rendicontazione delle attività svolte, da presentare durante l'omonimo incontro di allineamento.
- Aggiornamento del sito web: aggiunta della sezione dedicata al Diario di Bordo.
- Stesura dei verbali interni ed esterni relativi alle riunioni del periodo.

=== Rischi attesi
- *RO-2*: Alcune attività pianificate per questo sprint sono propedeutiche alla prosecuzione del progetto e devono raggiungere un livello di completamento sufficiente entro la fine del periodo. Il rischio che rimangano incompiute è concreto, data la densità del carico di lavoro distribuito tra più documenti in parallelo.
- *RO-1*: Nonostante le correzioni apportate nello sprint precedente, il rischio di stime imprecise rimane presente. Il team dispone ancora di dati storici limitati su cui basare le previsioni, il che rende incerta la calibrazione delle ore per alcune attività.
=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[-],[8],[-],[-],[-],[8]),
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
    ([Giovanni Angelo Marco Bronte], [5#text(fill: green)[(-1)]], [-], [-], [-], [-], [-], [5]),
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
- *RO-4*: Una mancata comunicazione tra i membri del team durante la scrittura dell'Analisi dei Requisiti ha portato alla redazione di alcuni casi d'uso non conformi alle convenzioni stabilite. Il team ha dovuto impiegare il proprio tempo nella correzione degli UC errati, sottraendo tempo al proseguimento della redazione del documento. Per prevenire il ripetersi del problema, il team pianificherà riunioni di allineamento sugli UC prima di procedere alla loro stesura.

=== Retrospettiva
Il team ha continuato la redazione dei vari documenti richiesti per l'RTB: Norme di Progetto, Analisi dei Requisiti, Piano di Progetto. È stata iniziata inoltre la stesura del Piano di Qualifica.
Per questo sprint il team si è particolarmente concentrato sui documenti: Norme di Progetto e Analisi dei Requisiti, i quali hanno raggiunto un livello di avanzamento significativo.\
Questo sprint sono iniziati i Diari di Bordo. Sono state create le relative
presentazioni, che saranno pubblicate sul sito web del gruppo.
Sono stati implementati dei cambiamenti minori per migliorare l'Issue Tracking System presente nella repository GitHub.

==== *Criticità emerse*
Come scritto nei rischi incontrati, la criticità principale riscontrata in questo sprint è stata una mancanza di comunicazione nel team per quanto riguarda la scrittura degli UC. Questo ha causato un significativo ritardo nella scrittura dell'Analisi dei Requisiti perché gli analisti hanno dovuto riscrivere i casi d'uso errati.
Per evitare che questo problema accada nuovamente in futuro, gli analisti dovranno discutere assieme al resto del team dei vari UC da definire. 


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
- *RI-3*: Sono stati trovati degli errori in alcuni verbali del team. Tale circostanza ha richiesto l’intervento tempestivo da parte del team, con il conseguente impiego di risorse aggiuntive e il potenziale rallentamento delle attività pianificate. Per mitigare il rischio, sono state corrette alcune imprecisioni e riviste le procedure descrittive attraverso momenti di confronto e collaborazione tra i membri del gruppo, al fine di ridurre la probabilità che situazioni analoghe si ripresentino in futuro.
- *RI-1*: Nel corso di questo periodo bisettimanale, la concomitanza di impegni accademici e personali ha comportato una riduzione della disponibilità di alcuni membri del team. In particolare, l’avvicinarsi della sessione estiva degli esami ha richiesto una maggiore attenzione nella gestione del tempo, con possibili ripercussioni sulla partecipazione alle attività progettuali. Per garantire il rispetto delle scadenze e la continuità del lavoro, il gruppo ha fatto ricorso a un’organizzazione più flessibile delle attività e a un costante coordinamento tra i componenti del team.

=== Retrospettiva
A seguito dei progressi ottenuti nello sprint precedente, il team ha proseguito il lavoro sulla documentazione richiesta per l’RTB, portando avanti in particolare il completamento dell’Analisi dei Requisiti e l’evoluzione del Piano di Qualifica. L’attenzione si è concentrata sulla riorganizzazione e sul perfezionamento dei casi d’uso, con l’integrazione dei diagrammi UML definitivi al fine di rendere più chiara e completa la descrizione delle funzionalità del sistema.

In parallelo, è continuata l’attività di aggiornamento del glossario, arricchito con nuovi termini emersi durante la stesura e la revisione dei documenti.
Durante questo sprint è stata avviata anche la progettazione preliminare dell’interfaccia grafica attraverso la realizzazione di un primo mock-up, utile a visualizzare l’organizzazione delle principali funzionalità e a raccogliere eventuali osservazioni in vista delle fasi successive. Parallelamente, sono proseguite le attività di documentazione ordinaria con la redazione del terzo Diario di Bordo e dei verbali.


==== Criticità emerse
La principale criticità riscontrata durante questo sprint ha riguardato il completamento degli ultimi casi d’uso dell’Analisi dei Requisiti. In particolare, il team ha incontrato alcune difficoltà nel definire con precisione determinati scenari e nel rappresentarli correttamente attraverso i diagrammi UML, rendendo necessarie ulteriori attività di revisione e confronto.
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

Nel quinto sprint il gruppo continuerà a lavorare sulla documentazione
richiesta per l'RTB, focalizzandosi sulla finalizzazione dell'Analisi dei
Requisiti e sulla preparazione del PoC richiesto per la presentazione.
È stata inoltre introdotta nella rotazione dei ruoli la figura del Programmatore, necessaria per lo sviluppo del PoC. Le attività principali saranno:

- Finalizzazione dell'Analisi dei Requisiti: ultimi controlli sulla qualità e completezza del documento.
- Presentazione del mockup a Bluewind per raccogliere un feedback sull'interfaccia proposta.
- Sviluppo del PoC da presentare in sede di revisione RTB.
- Stesura della presentazione per il quarto Diario di Bordo.
- Stesura dei verbali interni ed esterni relativi alle riunioni del periodo.
- Aggiornamento del Glossario: aggiunta dei termini introdotti nei documenti redatti durante lo sprint.

=== Rischi attesi

- *RI-1*: L'avvicinarsi di un periodo accademico intenso potrebbe ridurre la disponibilità di alcuni membri del gruppo, con conseguenti rallentamenti nello svolgimento delle attività operative.
- *RO-2*: L'elevato carico di lavoro distribuito su più attività in parallelo, in vista della presentazione RTB, aumenta il rischio che alcune attività rimangano incompiute entro la fine dello sprint.
 
=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[-],[-],[5],[-],[-],[5]),
    ([Edis Hodja],         [-],[-],[-],[-],[10],[-],[10]),
    ([Filippo Zonta Rocha],[6],[-],[-],[-],[-],[-],[6]),
    ([Giovanni Angelo Marco Bronte],    [-],[-],[5],[-],[-],[-],[5]),
    ([Ines Iadadi],        [-],[-],[-],[-],[-],[7],[7]),
    ([Leonardo Lorenzin],  [-],[4],[-],[-],[-],[-],[4]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*6*],[*4*],[*5*],[*5*],[*10*],[*7*],[*37*]),
  )),
    caption: [Preventivo ore per membro - Sprint 5]
)

=== Consuntivo
#figure(
  tabella-ore((
    ([Alberto Canavese], [-], [-], [-], [6#text(fill: red)[(+1)]], [-], [-], [6]),
    ([Edis Hodja], [-], [-], [-], [-], [10], [-], [10]),
    ([Filippo Zonta Rocha], [5#text(fill: green)[(-1)]], [-], [-], [-], [-], [-], [5]),
    ([Giovanni Angelo Marco Bronte], [-], [-],  [4#text(fill: green)[(-1)]], [-], [-], [-], [4]),
    ([Ines Iadadi], [-], [-], [-], [-], [-], [7], [7]),
    ([Leonardo Lorenzin], [-], [4], [-], [-], [-], [-], [4]),
    (table.cell(align: center, fill: luma(220))[*Totale*], [*5*], [*4*], [*4*], [*6*], [*10*], [*7*], [*36*]),
  )),
  caption: [Consuntivo ore per membro - Sprint 5],
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
    [Responsabile], [30], [5], [ 150€], [35], [1050€],
    [Amministratore], [20], [4], [80€], [28], [560€],
    [Analista], [25], [4 ], [100€], [9], [225€],
    [Progettista], [25], [6], [150€], [85], [2125€],
    [Programmatore], [15], [10], [150€], [98], [1470€],
    [Verificatore], [15], [7], [ 105€], [86], [1290€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*36*], [*735€*], [*341*], [*6720€*], 
  )
]

=== Rischi incontrati 
- *RI-3*: A seguito di un’ulteriore verifica, sono stati riscontrati errori che hanno compromesso la tracciabilità di alcuni verbali esterni. Si è deciso di intervenire tempestivamente per allineare la coerenza redazionale, adottando le analoghe procedure di revisione utilizzate per i verbali interni nel precedente sprint. 


=== Retrospettiva
Il team ha proseguito il lavoro sulla documentazione, finalizzando l’Analisi dei Requisiti, la quale necessita ora degli ultimi controlli per garantirne la totale qualità e completezza. Parallelamente, è stato sviluppato il PoC da presentare in sede di revisione RTB, in seguito alla realizzazione e presentazione di un mock-up dell’interfaccia grafica che ha ottenuto un riscontro positivo da parte della proponente.
Sono stati inoltre aggiornati il Piano di Progetto e il Piano di Qualifica, rispettando le tempistiche previste. È proseguita infine la stesura della documentazione ordinaria, inclusi i verbali e i Diari di Bordo.

Si segnala inoltre che i rischi attesi *RI-1* e *RO-2*, individuati in fase di pianificazione, non si sono concretizzati: il team ha mantenuto una disponibilità adeguata e l'intero carico di lavoro pianificato è stato completato nei tempi previsti.

==== Criticità emerse
Come anticipato nella sezione dei rischi incontrati, sono stati riscontrati errori in alcuni verbali esterni ma sono stati risolti prontamente durante lo sprint dal team durante una riunione di allineamento.

#pagebreak()

== Sprint 6

=== Periodo
#table(
  columns: (0.3fr, 1fr),
  stroke: none,
  inset: (left: 0pt, right: 0pt, top: 4pt, bottom: 4pt),
  [*Inizio:*],        [2026/06/13],
  [*Fine prevista:*], [2026/06/26],
  [*Fine reale:*],    [2026/06/26],
)
#v(0.3em)

=== Attività pianificate

Inizialmente il team aveva pianificato per questo periodo uno sprint di una sola settimana; la durata è stata però riportata a quella bisettimanale dopo aver constatato che i tempi ridotti non erano compatibili con il completamento delle attività necessarie alla consegna dell'RTB.

In questo sprint il gruppo si concentra sulla finalizzazione dei documenti richiesti per la Requirements and Technology Baseline (RTB), in vista della consegna e del colloquio di presentazione, dedicando particolare attenzione agli ultimi controlli di qualità, coerenza e completezza. Parallelamente prosegue lo sviluppo del Proof of Concept (PoC).
Le attività principali saranno:

- Finalizzazione dei documenti richiesti per l'RTB: ultimi controlli sulla qualità, sulla coerenza e sulla completezza dei documenti prima della consegna.
- Progressione nello sviluppo del Proof of Concept (PoC) da presentare in sede di revisione RTB.
- Aggiornamento del Glossario: aggiunta dei termini introdotti nei documenti redatti durante lo sprint.
- Stesura della presentazione per il quinto Diario di Bordo.
- Stesura dei verbali interni ed esterni relativi alle riunioni del periodo.

=== Rischi attesi

- *RI-1*: Lo sprint si colloca in un periodo accademico particolarmente intenso, segnato dalla sessione estiva degli esami. È probabile che la disponibilità di alcuni membri del gruppo risulti ridotta, con conseguenti rallentamenti nello svolgimento delle attività operative.
- *RO-4*: La concomitanza degli impegni accademici e personali rende più difficile coordinare i tempi del team e organizzare momenti di lavoro condiviso, con il rischio di un disallineamento sulle attività in vista della consegna.

=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [5],[-],[-],[-],[-],[-],[5]),
    ([Edis Hodja],         [-],[-],[-],[-],[-],[7],[7]),
    ([Filippo Zonta Rocha],[-],[-],[-],[-],[8],[-],[8]),
    ([Giovanni Angelo Marco Bronte],    [-],[4],[-],[-],[-],[-],[4]),
    ([Ines Iadadi],        [-],[-],[-],[-],[8],[-],[8]),
    ([Leonardo Lorenzin],  [-],[-],[-],[-],[-],[7],[7]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*5*],[*4*],[*0*],[*0*],[*16*],[*14*],[*39*]),
  )),
    caption: [Preventivo ore per membro - Sprint 6]
)

=== Consuntivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [5],[-],[-],[-],[-],[-],[5]),
    ([Edis Hodja],         [-],[-],[-],[-],[-],[6 #text(fill: green)[(-1)]],[6]),
    ([Filippo Zonta Rocha],[-],[-],[-],[-],[7 #text(fill: green)[(-1)]],[-],[7]),
    ([Giovanni Angelo Marco Bronte],    [-],[4],[-],[-],[-],[-],[4]),
    ([Ines Iadadi],        [-],[-],[-],[-],[8],[-],[8]),
    ([Leonardo Lorenzin],  [-],[-],[-],[-],[-],[7],[7]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*5*],[*4*],[*0*],[*0*],[*15*],[*13*],[*37*]),
  )),
    caption: [Consuntivo ore per membro - Sprint 6]
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
    [Responsabile], [30], [5], [ 150€], [30], [900€],
    [Amministratore], [20], [4], [80€], [24], [480€],
    [Analista], [25], [0], [0€], [9], [225€],
    [Progettista], [25], [0], [   0€], [85], [2125€],
    [Programmatore], [15], [15], [225€], [83], [1245€],
    [Verificatore], [15], [13], [ 195€], [73], [1095€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*37*], [*650€*], [*304*], [*6070€*],
  )
]

=== Rischi incontrati
- *RI-1*: La concomitanza con la sessione estiva degli esami ha effettivamente ridotto il tempo che alcuni membri hanno potuto dedicare al progetto, come previsto in fase di pianificazione. Per limitare l'impatto sulle scadenze, il team ha distribuito le attività con maggiore flessibilità sulle date di completamento interne e ha prorogato lo sprint da una a due settimane, così da poter completare tutte le attività necessarie alla consegna dell'RTB senza comprometterne la qualità.
- *RO-4*: La difficoltà a far coincidere gli impegni personali dei membri ha reso complicato organizzare momenti di lavoro condiviso. Il team ha fatto ricorso ai canali di comunicazione rapidi (WhatsApp e Discord) per coordinarsi anche al di fuori dei meeting prefissati e mantenere allineate le attività in vista della consegna.

=== Retrospettiva
In vista della consegna e del colloquio di presentazione dell'RTB, il team si è concentrato sulla finalizzazione dei documenti richiesti, eseguendo gli ultimi controlli di qualità, coerenza e completezza prima della scadenza. Parallelamente è proseguito lo sviluppo del Proof of Concept da presentare in sede di revisione RTB.
Sono inoltre stati aggiornati il Glossario e la documentazione ordinaria, con la stesura delle presentazioni per il quinto Diario di Bordo e dei verbali interni ed esterni relativi alle riunioni del periodo.

==== Criticità emerse
La principale criticità di questo sprint è derivata dalla sovrapposizione con la sessione estiva degli esami, che ha sottratto tempo al progetto e reso difficoltoso trovarsi e lavorare in modo continuativo. Proprio come conseguenza di questa riduzione di disponibilità, il team ha deciso di prorogare lo sprint da una a due settimane: i tempi inizialmente previsti non erano sufficienti a portare a termine tutte le attività necessarie alla consegna dell'RTB con la qualità richiesta. Grazie a questa proroga, un coordinamento più frequente tramite i canali di comunicazione rapidi e a una distribuzione flessibile delle attività, il team è riuscito a completare il lavoro pianificato e a rispettare la data di consegna prevista per l'RTB.

== Sprint 7

=== Periodo
#table(
  columns: (0.3fr, 1fr),
  stroke: none,
  inset: (left: 0pt, right: 0pt, top: 4pt, bottom: 4pt),
  [*Inizio:*],        [2026/06/27],
  [*Fine prevista:*], [2026/06/10],
  [*Fine reale:*],    [2026/06/10],
)
#v(0.3em)

=== Attività pianificate

In questo sprint il gruppo si concentra sulla conclusione della milestone Requirements and Technology Baseline (RTB), in vista del rilascio finale e della partecipazione al colloquio di presentazione. L'obiettivo principale del periodo è il completamento e l'approvazione di tutti i documenti e la conclusione del Proof of Concept (PoC).

Le attività principali saranno:
- Conclusione del Proof of Concept (PoC): ultimazione dello sviluppo, rifinitura delle funzionalità e consolidamento del codice dell'applicazione da presentare in sede di revisione RTB.
- Stesura della Lettera di Presentazione
- Approvazione dei documenti per RTB: esecuzione delle verifiche di secondo livello da parte del ruolo di Responsabile per formalizzare lo stato di approvazione di tutto il materiale prima del congelamento definitivo.
- Aggiornamento del Glossario: aggiunta dei termini introdotti durante la stesura finale dei documenti del periodo.
- Stesura della presentazione per il sesto Diario di Bordo.
- Stesura dei verbali interni: redazione e formattazione dei resoconti ufficiali relativi alle riunioni tenutesi nel corso del periodo.

=== Rischi attesi

- *RI-1*: Lo sprint si colloca nel pieno della sessione estiva degli esami. La ridotta disponibilità oraria di alcuni membri in questo periodo critico rappresenta un rischio elevato per il completamento puntuale delle ultime attività di verifica e sviluppo prima della consegna.
- *RI-3*: L'elevata mole di documentazione da sottoporre a revisione finale prima del rilascio comporta il rischio che emergano errori formali o incongruenze ortografiche dell'ultimo minuto, richiedendo la correzione di tali errori.
- *RO-4*: Il perdurare degli impegni accademici e personali continua a rendere difficile coordinare i tempi del team e organizzare momenti di lavoro condiviso, con il rischio di un disallineamento sulle attività finali in vista della consegna.

=== Preventivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[-],[-],[-],[-],[8],[8]),
    ([Edis Hodja],         [-],[4],[-],[-],[-],[-],[4]),
    ([Filippo Zonta Rocha],[-],[-],[-],[-],[],[8],[8]),
    ([Giovanni Angelo Marco Bronte],    [-],[-],[-],[-],[6],[-],[6]),
    ([Ines Iadadi],        [-],[-],[-],[-],[6],[-],[6]),
    ([Leonardo Lorenzin],  [5],[-],[-],[-],[-],[-],[5]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*5*],[*4*],[*0*],[*0*],[*12*],[*16*],[*37*]),
  )),
    caption: [Preventivo ore per membro - Sprint 7]
)

=== Consuntivo
#figure(
  tabella-ore((
    ([Alberto Canavese],   [-],[-],[-],[-],[-],[7#text(fill: green)[(-1)]],[7]),
    ([Edis Hodja],         [-],[4],[-],[-],[-],[-],[4]),
    ([Filippo Zonta Rocha],[-],[-],[-],[-],[],[7#text(fill: green)[(-1)]],[7]),
    ([Giovanni Angelo Marco Bronte],    [-],[-],[-],[-],[6],[-],[6]),
    ([Ines Iadadi],        [-],[-],[-],[-],[6],[-],[6]),
    ([Leonardo Lorenzin],  [5],[-],[-],[-],[-],[-],[5]),
    (table.cell(align: center, fill: luma(220))[*Totale*],[*5*],[*4*],[*0*],[*0*],[*12*],[*14*],[*35*]),
  )),
    caption: [Consuntivo ore per membro - Sprint 7]
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
    [Responsabile], [30], [5], [ 150€], [25], [750€],
    [Amministratore], [20], [4], [80€], [20], [400€],
    [Analista], [25], [0], [0€], [9], [225€],
    [Progettista], [25], [0], [   0€], [85], [2125€],
    [Programmatore], [15], [12], [180€], [71], [1065€],
    [Verificatore], [15], [14], [ 210€], [59], [885€],
    table.cell(colspan: 2, align: center, fill: luma(220))[*Totale*], [*35*], [*620€*], [*269*], [*5450€*],
  )
]

=== Rischi incontrati
- *RI-3*: Durante le verifiche finali sulla documentazione complessiva prima del rilascio, sono emersi alcuni errori formali e incongruenze ortografiche minori. Il rischio è stato gestito tempestivamente attraverso un'attenta attività di revisione da parte dei verificatori, che hanno provveduto a correggere le anomalie riscontrate prima dell'approvazione.
- *RO-4*: Il perdurare degli impegni della sessione estiva ha effettivamente ostacolato l'organizzazione di sessioni di lavoro condiviso. Il team ha mitigato il problema intensificando le comunicazioni tramite i canali rapidi (WhatsApp e Discord), permettendo a ciascun membro di avanzare in autonomia sulle proprie attività e garantendo il perfetto allineamento in vista della consegna.

=== Retrospettiva
In questo sprint il gruppo ha completato con successo gli obiettivi prefissati per la chiusura della milestone Requirements and Technology Baseline (RTB). Tutti i documenti previsti sono stati verificati e approvati ed è stata redatta la Lettera di Presentazione per il colloquio di revisione RTB. In parallelo, lo sviluppo del Proof of Concept (PoC) è stato concluso, consolidando le funzionalità necessarie alla dimostrazione tecnologica. Infine sono stati aggiornati il Glossario e la documentazione ordinaria, con la stesura delle presentazioni per il sesto Diario di Bordo e dei verbali interni relativi alle riunioni del periodo.

==== Criticità emerse
La principale criticità del periodo è stata legata alla gestione della mole di lavoro documentale da verificare e approvare per il completamento della milestone Requirements and Technology Baseline (RTB). L'individuazione di piccoli refusi ha richiesto uno sforzo supplementare da parte dei verificatori per assicurare la consegna di documenti privi di anomalie. Tuttavia, grazie alla flessibilità del team e all'uso efficiente dei canali di comunicazione rapidi, questa criticità è stata assorbita senza generare ritardi, consentendo al gruppo di rispettare pienamente la data di consegna prevista per l'RTB.
