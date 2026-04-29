#set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Dichiarazione degli Impegni],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )

#set text(font: "Libertinus Serif",size: 12pt,lang: "it")

#set heading(numbering: "1.")

#align(center)[
  #v(8em)
  #image("../images/logoCoderius.jpg", width: 60%)
  #line(length: 70%, stroke: 1pt)
  #v(1em)
  #text(size: 26pt, weight: "bold")[Dichiarazione degli impegni]
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
    [0.1.2], [2026/03/22],[Edis Hodja],[Filippo Zonta Rocha],[Integrazione della sezione scadenze e rischi del progetto],
    [0.1.1],[2026/03/21],[Edis Hodja],[Filippo Zonta Rocha],[Analisi impegni orari e distribuzione dei ruoli],
    [0.1.0], [2026/03/20], [Ines Iadadi], [Filippo Zonta Rocha],[Stesura iniziale del documento],
  )
]
#pagebreak()
#show outline.entry.where(level: 1): set block(above: 1.5em)
#text(size: 18pt, weight: "bold")[Indice]
#outline(title: none, depth: 2)

#pagebreak()

#set page(numbering: "1 / 1")
#counter(page).update(1)
= Introduzione
Il presente documento costituisce la _Dichiarazione degli Impegni_ del gruppo 22 di Ingegneria del Software, Coderius Group, candidato per lo sviluppo del capitolato  #link("https://www.math.unipd.it/~tullio/IS-1/2025/Progetto/C1p.pdf")[
  #underline[#text(fill: blue)[*C1 – Automated EN18031 Compliance Verification*]]], proposto dall'azienda *Bluewind S.r.l.*. \ \
L'obiettivo di questa stesura è definire l'impegno orario, la suddivisione dei ruoli, la descrizione di tali e il preventivo dei costi previsti fino alla consegna del prodotto finale.

= Impegno orario e preventivo dei costi
Per quanto riguarda la gestione e l'organizzazione delle tempistiche, il gruppo *Coderius* dichiara di dedicare un totale di *87 ore* di lavoro effettive per membro, per un totale di *522 ore* calcolate in base alla disponibilità dei membri e ad un'attenta analisi del documento di progetto. \
#align(center)[
  #box(width: 70%)[
    #figure(
      table(
        columns: (auto, auto),
        align: (left, center),
        stroke: 0.5pt + luma(100),
        table.header(
          [*Membro*], 
          [*Impegno orario (h)*]
        ),
        [Bronte Giovanni Angelo Marco],[87],
        [Canavese Alberto],[87],
        [Hodja Edis],[87],
        [Iadadi Ines],[87],
        [Lorenzin Leonardo],[87],
        [Zonta Rocha Filippo],[87],
        table.cell(fill: luma(220))[*Totale*],[522]
      ),
      caption: [Divisione oraria tra i membri.]
    )<tabella-orario>
  ]
]
Tali ore verranno ripartite nei ruoli indicati nella _#underline[@tabella-preventivo]_ \
Dall'analisi effettuata sono risultati significativi i *ruoli* di _Analista_, _Verificatore_ e _Progettista_, ai quali è stato assegnato un quantitativo di ore maggiore. Questo perchè il capitolato C1 richiede particolare attenzione all’Analisi dei Requisiti, alla fase di progettazione e all'attività di verifica dei risultati continua.
#align(center)[
  #figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      align: (left, center, center, center, right),
      stroke: 0.5pt + luma(100),
      table.header(
        [*Ruolo*], 
        [*Costo Orario (€/h)*], 
        [*Ore per Membro*], 
        [*Ore Totali*],
        [*Costo Totale (€)*]
      ),
      [Responsabile],   [30], [10], [60], [1800],
      [Amministratore], [20], [9], [54], [1080],
      [Analista],       [25], [12], [72], [1800],
      [Progettista],    [25], [16], [96], [2400],
      [Programmatore],  [15], [18], [108], [1620],
      [Verificatore],   [15], [22], [132], [1980],
      table.cell(colspan: 2, align: center, fill: luma(220))[*Totale Complessivo*], [*87*], [*522*], [*10 680*]
    ),
    caption: [Preventivo dei costi stimati ripartito per ruoli.]
  )<tabella-preventivo>
]

#figure(
  align(center)[
  #image("../images/graficoRuoli.png", width: 70%)
  ],
  caption: [Grafo della distribuzione oraria.]
)

= Partizione dei ruoli
Di seguito vengono descritte le responsabilità associate a ciascun ruolo, i quali verranno ricoperti a rotazione dai membri del team.
== Descrizione dei ruoli
- *Responsabile* \ Ha il compito di pianificare le scadenze, monitorare l'uso efficiente delle risorse e gestire eventuali rischi. Supervisiona l'andamento generale e autorizza il rilascio dei prodotti, sia parziali che finali. Il suo impegno è richiesto in modo continuativo per tutto l'arco di sviluppo del progetto. Tale ruolo deve essere sempre ricoperto da un solo membro del team.

- *Amministratore* \ Assicura l'efficienza di procedure, strumenti e tecnologie a supporto del Way of Working del team. La sua presenza è costante per l'intero progetto.

- *Analista* \ Svolge l'attività di analisi dei requisiti, traducendo le esigenze espresse dal proponente in requisiti software concreti. Il suo contributo è di fondamentale importanza nelle fasi iniziali del progetto.

- *Progettista* \ Attraverso attività di design e modellazione, stabilisce la struttura del software, definendo l'architettura dell'applicazione e la suddivisione tra i componenti Frontend e Backend. È la figura centrale durante la fase di progettazione.

- *Programmatore* \ Si occupa della stesura del codice sorgente, implementando le decisioni stabilite dal _Progettista_. Il suo ruolo è centrale nella fase di implementazione e codifica.

- *Verificatore* \ Progetta ed esegue attività di testing e validazione per assicurarsi che il software sviluppato non presenti difetti, rispetti le metriche di qualità e soddisfi i requisiti iniziali. La sua figura è essenziale durante la fase di implementazione e diventa predominante nelle fasi di rilascio e collaudo.

== Distribuzione dei ruoli
La distribuzione delle ore è stata definita tenendo conto della natura del progetto e delle necessità di garantire un adeguato equilibrio tra attività tecniche e organizzative. \
Al fine di favorire crescita e garantire una maggiore flessibilità operativa è stato adottato un principio di rotazione dei ruoli coerente con la metodologia _Agile_. Ciascun membro partecipa alle diverse attività progettuali ricoprendo i ruoli precedentemente definiti con la seguente logica: 
- Ogni membro del team dovrà ricoprire ciascun ruolo almeno una volta nel ciclo di vita del progetto;
- La rotazione dei ruoli è pensata con cadenza bisettimanale ma può subire variazioni in caso di necessità;
- Ogni membro del team deve avere uno ed un solo ruolo assegnato;
- All'inizio di ciascuno sprint vengono individuate le attività da svolgere e stimate le ore necessarie per completarle. Il _Responsabile_ si occupa di riequilibrare eventuali carichi di lavoro irregolari.
- Ciascun membro deve svolgere le ore previste per ogni ruolo senza eccedere il monte ore previsto (_#underline[@tabella-orario]_).
Questo approccio consente a tutti i componenti di acquisire una visione completa del progetto e di contribuire alle varie fasi, pur mantenendo una distribuzione del carico di lavoro coerente con i ruoli assegnati.

#pagebreak()

= Termine del Progetto
Il gruppo *Coderius* prevede un impegno complessivo di *522 ore* di lavoro, corrispondenti ad un costo totale stimato di *10 680€*. \ La conclusione e la consegna del progetto del capitolato *C1 – Automated EN18031 Compliance Verification*, proposto dall'azienda *Bluewind S.r.l.*, sono previste entro e non oltre il *18 settembre 2026*.

== Rischi attesi e loro mitigazione
=== Ritardi nello sviluppo \
*Conseguenze:* Possibile slittamento delle scadenze, accumulo di attività e riduzione della qualità del prodotto finale. \
*Mitigazione:* _Pianificazione flessibile_ delle attività, suddivisione chiara dei _task_ e monitoraggio periodico dello stato di avanzamento.

=== Difficoltà con tecnologie \
*Conseguenze:* Rallentamenti nello sviluppo e aumento del tempo necessario per l'implementazione di alcune funzionalità. \
*Mitigazione:* Approfondimento preliminare delle tecnologie, _condivisione_ delle conoscenze tra i membri del gruppo tramite i canali di comunicazione e approccio collaborativo nella risoluzione dei problemi. Sostegno fornito dall'azienda, come espresso nel #link("https://coderiusgroup.github.io/Documentazione/docs/Candidatura/Verbali/Esterni/VerbaleEsterno-2026-03-17.pdf")[#underline[#text(fill: blue)[verbale esterno]]].

=== Comprensione della norma EN18031 \
*Conseguenze:* Incoerenze nella documentazione, difficoltà nella validazione dei requisiti posti dal proponente e possibile non conformità agli obiettivi del progetto, in particolare nell'interpretazione e applicazione dei meccanismi di _Access Control (ACM)_ e _Authentication (AUM)_ previsti dalla norma. \
*Mitigazione:* Verifica continua della documentazione, attenzione alle specifiche richieste e ruolo attivo del _Verificatore_ nel controllo della qualità e delle conformità del lavoro svolto.
