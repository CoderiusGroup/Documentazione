#let verbale_esterno(
  titolo: "",
  data: "",
  ora_inizio: "",
  ora_fine: "",
  luogo: "",
  azienda: "",
  scriba: "",
  partecipanti_esterni: "",
  body
) = {
  set document(title: titolo, author: "Coderius")
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[Verbale Esterno],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )
  set text(font: "Libertinus Serif", size: 11pt, lang: "it")
  set heading(numbering: "1.1.")

  // --- COPERTINA ---
  align(center)[
    #v(4em)
    #image("../../../images/logoCoderius.jpg", width: 50%)
    #link("mailto:coderius01@gmail.com")[
      #text(size: 1.2em)[coderius01\@gmail.com]
    ]
    #v(3em)
    #line(length: 80%, stroke: 1.5pt)
    #v(1em)
    #text(size: 2.2em, weight: "bold")[#titolo]
    #v(1em)
    #line(length: 80%, stroke: 1.5pt)
    #v(2em)
    #text(size: 1.6em, weight: "bold")[Incontro con #azienda]
    #v(4em)
  ]
  pagebreak()

  // --- INDICE ---
  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text(weight: "bold")[Indice],
    indent: 2em,
    depth: 3
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)

  // --- INFORMAZIONI GENERALI ---
  heading[Informazioni Generali]
  v(1em)
  grid(
    columns: (130pt, 1fr),
    align: left,
    gutter: 1.2em,
    [*Data:*], [#data],
    [*Ora inizio:*], [#ora_inizio],
    [*Ora fine:*], [#ora_fine],
    [*Luogo:*], [#luogo],
    [*Scriba:*], [#scriba],
    [*Azienda:*], [#azienda],
    [*Partecipanti Esterni:*], [#partecipanti_esterni]
  )
  v(2em)
  body
}
// =========================================================================
// tutto il resto va fatto da qui
// =========================================================================

#show: verbale_esterno.with(
  titolo: "Verbale Riunione Esterna",
  data: "2026/08/21",
  ora_inizio: "15:00",
  ora_fine: "15:20",
  luogo: "Chiamata Zoom",
  scriba: "Edis Hodja",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese, Alessandro Zappia"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Leonardo Lorenzin

= Ordine del Giorno
+ Aggiornamento sulle modifiche apportate alle strutture dati JSON condivise con la proponente.
+ Presentazione dello stato di avanzamento dello sviluppo dell'MVP.
+ Discussione delle criticità riscontrate in fase di implementazione.
+ Raccolta del feedback della proponente sulle strutture dati.
+ Pianificazione delle tempistiche di consegna e dei prossimi incontri.

= Svolgimento della Riunione
La riunione ha avuto come obiettivo principale l'aggiornamento della proponente sullo stato di avanzamento dello sviluppo dell'MVP e la raccolta del suo riscontro sulle strutture dati JSON condivise nelle settimane precedenti, con una successiva pianificazione delle tempistiche di consegna.

== Aggiornamento sulle Strutture Dati JSON
Il team ha comunicato di aver apportato una modifica di lieve entità alle strutture dati JSON condivise con la proponente nelle settimane precedenti. In particolare, sono stati rimossi dalla specifica due campi ritenuti superflui ai fini del funzionamento dell'applicativo: quello relativo all'esportazione del file e il nome del software che lo ha generato. Il resto della specifica è rimasto invariato rispetto alla versione precedentemente condivisa.

== Stato di Avanzamento dello Sviluppo dell'MVP
Il team ha illustrato lo stato corrente dello sviluppo, descrivendolo come una fase ancora parzialmente esplorativa ma a uno stadio di avanzamento medio-alto, finalizzata a verificare sul campo quali soluzioni implementative risultino efficaci. Lo scheletro dell'applicativo è già stato definito e viene considerato solido.

A livello di funzionalità, i requisiti obbligatori risultano implementati in misura sufficiente per lo stato attuale del lavoro. Restano invece da completare:
- i test di integrazione;
- la gestione dell'esito e il recupero di sessione, individuati come le parti più rilevanti ancora mancanti;
- alcuni dettagli relativi all'interfaccia grafica;
- il completamento del back-end, non ancora del tutto pronto per l'integrazione con l'applicazione.

Il team ha inoltre precisato che, oltre ai requisiti obbligatori e desiderabili, è intenzione integrare anche alcuni requisiti opzionali già analizzati in fase di stesura dell'Analisi dei Requisiti.

== Criticità Riscontrate
Su richiesta della proponente, il team ha chiarito di non aver riscontrato requisiti poco chiari o inconsistenti tra loro. Le difficoltà incontrate riguardano due aspetti distinti:
+ *Vincoli implementativi:* la gestione della sessione associata alla lista degli asset coinvolge un numero elevato di requisiti, i cui vincoli risultano particolarmente restrittivi e richiedono quindi maggiore attenzione in fase di implementazione. Il team non ha potuto fornire un esempio puntuale in quanto l'attività è tuttora in corso.
+ *Organizzazione del lavoro:* il lavoro in parallelo su branch differenti ha generato alcune sovrapposizioni tra le attività dei membri del team. La criticità è di natura organizzativa e relativa alla gestione del versionamento, e il team si sta già riorganizzando per risolverla nei giorni successivi alla riunione.

== Feedback della Proponente sulle Strutture Dati
La proponente ha confermato di aver esaminato le strutture dati JSON aggiornate e le ha giudicate complete: tutte le informazioni necessarie risultano presenti. È stato precisato che l'esito finale dipenderà dalle scelte implementative del team, al quale restano in carico il parsing dei file e la gestione della logica applicativa che li elabora.

== Pianificazione delle Tempistiche e dei Prossimi Incontri
Il team ha proposto di fissare il prossimo incontro esterno al termine dell'attuale fase di sviluppo, con carattere riassuntivo, così da chiudere questa parte del progetto.

Alla richiesta della proponente in merito alle date di presentazione dell'MVP, il team ha indicato l'obiettivo di completarlo entro il 12 settembre 2026, anche in considerazione degli impegni di tirocinio ed esami dei componenti del gruppo; tale data resta comunque subordinata al riscontro dei docenti.

È stata quindi individuata la prima settimana di settembre, a partire dal 31 agosto, come periodo ideale per il prossimo incontro: questo consentirebbe di disporre di una versione almeno minimamente funzionale, con il margine necessario per discutere ed eventualmente correggere quanto realizzato. La proponente ha accolto positivamente la proposta, concordando di definire la data precisa tramite Telegram non appena il team avrà materiale da mostrare.

#pagebreak()

= Conclusione e Decisioni Prese
L'incontro si è concluso con esito positivo: la proponente ha confermato la completezza delle strutture dati condivise e ha preso atto dello stato di avanzamento dell'MVP, concordando con il team le modalità e le tempistiche del prossimo allineamento.

#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-8.1], [Confermata la rimozione dai file JSON dei due campi ritenuti superflui],
    [VE-8.2], [Le strutture dati JSON sono ritenute complete dalla proponente; parsing e gestione della logica applicativa restano a carico del team],
    [VE-8.3], [Il completamento dell'MVP è fissato come obiettivo entro il 12 settembre 2026],
    [VE-8.4], [Il prossimo incontro esterno avrà carattere riassuntivo e si terrà nella prima settimana di settembre, a partire dal 31 agosto],
    [VE-8.5], [La data precisa del prossimo incontro verrà concordata tramite Telegram],
  )
]

= TODO
Elenco dei compiti assegnati ai membri del team in vista del prossimo incontro.
#align(center)[
  #table(
    columns: (auto, 1fr, 110pt, 80pt),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-8.1], [Completare la gestione dell'esito e il recupero di sessione], [Filippo Zonta Rocha, Giovanni Angelo Marco Bronte], [VE-8.3],
    [TD-8.2], [Completare i test di integrazione e la rifinitura dell'interfaccia grafica], [Team], [VE-8.3],
    [TD-8.3], [Completare il back-end e la sua integrazione con l'applicazione], [Team], [VE-8.3],
    [TD-8.4], [Riorganizzare la gestione dei branch per evitare sovrapposizioni tra le attività], [Leonardo Lorenzin], [VE-8.3],
    [TD-8.5], [Contattare la proponente su Telegram per fissare la data del prossimo incontro], [Alberto Canavese], [VE-8.4, VE-8.5],
  )
]

#v(6em)
#align(right)[
  #text(weight: "bold")[Approvazione del Referente Aziendale] \
  #v(3em)
  *Nome:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]\ #h(1.5em)
  #v(2em)
  *Firma:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]
]
