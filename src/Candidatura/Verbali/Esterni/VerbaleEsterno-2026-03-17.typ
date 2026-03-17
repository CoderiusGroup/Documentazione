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
    #image("logoCoderius.jpg", width: 50%)
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

  // --- REGISTRO DELLE MODIFICHE ---
  heading(numbering: none, outlined: false)[Tabella di versionamento]
  v(2em)
  
  align(center)[
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
      [0.1.0], [17/03/2026], [Edis Hodja], [Ines Iadadi], [Prima stesura del verbale],
    )
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
// a meno di modifiche alla tabella di versionamento, tutto il resto va fatto da qui
// =========================================================================

#show: verbale_esterno.with(
  titolo: "Verbale Riunione Esterna",
  data: "17/03/2026",
  ora_inizio: "16:00",
  ora_fine: "16:18",
  luogo: "Zoom",
  scriba: "Ines Iadadi",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Alessandro Zappia, Tobia Fiorese"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin

= Ordine del Giorno
+ Presentazione del team
+ Domande sui requisiti del progetto

= Svolgimento della Riunione
L'incontro si è aperto con una breve presentazione del team Coderius ai referenti aziendali. Successivamente, la riunione si è focalizzata sull'analisi e il chiarimento di alcuni punti tecnici e organizzativi relativi al progetto.

== Domande e Risposte
Di seguito vengono riportate le domande poste dal team e le relative risposte fornite dai referenti aziendali.

#heading(level: 3, numbering: none, outlined: false)[1. Uso dell'Intelligenza Artificiale]
*Domanda:* È previsto l’uso di Intelligenza Artificiale durante il progetto? Se sì, in quale maniera? \
*Risposta:*  L'uso dell'Intelligenza Artificiale non era originariamente previsto nel capitolato e non è ritenuto strettamente necessario ai fini del prodotto. L'azienda si dichiara aperta a eventuali proposte, qualora il team individuasse un'utilità specifica per questa tecnologia durante lo sviluppo, se ne potrà valutare l'integrazione in fasi successive.

#heading(level: 3, numbering: none, outlined: false)[2. Perimetro dei requisiti normativi]
*Domanda:* Il capitolato anticipa già che ci concentreremo su un "gruppo ristretto di requisiti", principalmente ACM (Access Control Mechanism) e AUM (Authentication Mechanism) , dovremmo coprire altri requisiti oltre a questi? \
*Risposta:* I gruppi ACM e AUM contengono già al loro interno numerose specifiche e rappresentano il perimetro ideale per lo sviluppo di un primo Proof of Concept (PoC) funzionante. L'obiettivo è concentrarsi su questi, ma l'architettura software dovrà essere pensata per essere estensibile in futuro al resto dei requisiti contenuti nello standard.

#heading(level: 3, numbering: none, outlined: false)[3. Materiale di consultazione dello standard]
*Domanda:* Per il caso studio verranno forniti i documenti che descrivono le componenti di rete. Ci verrà fornito anche del materiale specifico per poter consultare i parametri imposti dallo standard tecnico EN 18031? \
*Risposta:* Trattandosi di documentazione normalmente a pagamento, Bluewind si occuperà di fornire al team il testo delle sezioni di interesse dello standard che saranno necessarie allo sviluppo.

#heading(level: 3, numbering: none, outlined: false)[4. Target di utenza]
*Domanda:* Quale sarà il target di utenza finale di questo progetto? \
*Risposta:* L'applicazione è destinata ad un uso interno aziendale, rivolta a un gruppo d'utenza stimato di circa 20 persone.

#heading(level: 3, numbering: none, outlined: false)[5. Tipologia di applicazione software]
*Domanda:* Nel documento è scritto che l'applicazione può essere web-based o desktop: quale tra le due opzioni consigliate oppure considerate migliore per il vostro utilizzo aziendale? \
*Risposta:* L'azienda non ha vincoli stringenti e lascia la scelta al team in base alle proprie competenze. Internamente all’azienda viene utilizzato Linux come sistema operativo, pertanto un'eventuale applicazione desktop andrebbe sviluppata per quel target. Tuttavia si ritiene che un'architettura web-based risulterebbe più flessibile sia per l'utilizzo aziendale, sia per il team stesso, che lavorando su piattaforme eterogenee ne trarrebbe un vantaggio organizzativo.

#heading(level: 3, numbering: none, outlined: false)[6. Tecnologie Frontend]
*Domanda:* Nel caso di suddivisione tra Backend e Frontend , per quanto riguarda lo sviluppo di quest’ultimo, ci sono delle tecnologie specifiche che preferite (così come prediligete Python 3.x per il Backend ) oppure siamo liberi di scegliere? \
*Risposta:* Il team ha totale libertà di scelta sulle tecnologie da adottare. Bluewind, operando principalmente su sistemi embedded/hardware, ha minori vincoli sul Frontend. Il referente aziendale possiede esperienza pregressa con framework basati su JavaScript e può offrire maggiore supporto in tal senso, ma il team resta libero di utilizzare lo stack tecnologico che ritiene più idoneo.

#heading(level: 3, numbering: none, outlined: false)[7. Integrazione nei servizi aziendali]
*Domanda:* Vi è possibilità che parte del codice o documentazione venga implementata nei vostri servizi? \
*Risposta:* Per quanto concerne i test funzionali, l'azienda fornirà documentazione reale (es. il caso studio della macchina del caffè) per permettere al team di validare l'applicativo. Per quanto riguarda l'integrazione e la documentazione di progetto vera e propria, il gruppo procederà in autonomia seguendo i requisiti didattici.

#heading(level: 3, numbering: none, outlined: false)[8. Output e risultati dei Decision Tree]
*Domanda:* Il risultato dei decision tree deve limitarsi ai tre stati (Pass/Fail/Not Applicable), oppure dobbiamo generare anche altre informazioni aggiuntive  (come ad esempio la sezione relativa alla giustificazione menzionata nei requisiti opzionali )? \
*Risposta:* È prevista l'implementazione di un campo testuale per le giustificazioni (necessario, ad esempio, per motivare lo stato "Not Applicable"). Tuttavia, essendo il progetto un PoC iniziale, questa funzionalità può essere considerata a priorità minore e integrata nelle fasi future dello sviluppo.

#heading(level: 3, numbering: none, outlined: false)[9. Formato di importazione e salvataggio dati]
*Domanda:* Per l’importazione e salvataggio dei decision tree utilizziamo un unico formato tra JSON o XML oppure preferite entrambi? Il formato sarà definito da voi o dovrà essere progettato da noi? \
*Risposta:* La scelta è a discrezione del team, viene espressa tuttavia una preferenza per il formato JSON in quanto considerato più semplice da gestire e maggiormente leggibile.

#heading(level: 3, numbering: none, outlined: false)[10. Struttura della documentazione da consegnare]
*Domanda:* Per quanto riguarda la documentazione tecnica, il manuale utente e la documentazione di progetto che dovremo consegnare, come dovrà essere strutturata (es. formati, tool, template specifici)? \
*Risposta:* L'azienda non impone template, tool o formati specifici. Il team è invitato a seguire le direttive e gli standard accademici richiesti dal corso per la stesura dei documenti. Bluewind rimane a disposizione per definire congiuntamente le strutture qualora il team ne avesse necessità.

#heading(level: 3, numbering: none, outlined: false)[11. Metodologia AGILE e organizzazione del team]
*Domanda:* Avete preferenze su come strutturare il processo AGILE? Ad esempio la durata degli sprint e le modalità di revisione? Pensavamo di ruotare i ruoli interni al team a ogni fine sprint, pensate possa allinearsi bene con il vostro metodo di supervisione? \
*Risposta:* Internamente, Bluewind adotta sprint di due settimane. Per il progetto didattico, si consiglia un approccio flessibile: la durata degli sprint andrà calibrata in base al carico di lavoro e al tempo che il team riuscirà a dedicare, al fine di garantire avanzamenti sostanziali tra una revisione e l'altra, nella fase iniziale verranno tenuti incontri settimanali o bisettimanali. In merito alla rotazione dei ruoli, l'azienda approva pienamente la proposta del team, considerandola un'ottima iniziativa formativa e interessante da valutare nella pratica.

#heading(level: 3, numbering: none, outlined: false)[12. Frequenza degli incontri di allineamento]
*Domanda:* Con quale frequenza sono previsti gli incontri di allineamento (da remoto o in presenza) indicati nel capitolato? \
*Risposta:* Nelle fasi iniziali di assestamento e pianificazione, gli incontri avverranno "al bisogno". Quando il progetto entrerà nel vivo, si potrà concordare una cadenza più regolare. Inoltre, l'azienda ha fornito un contatto e-mail e si è resa disponibile a creare un canale Telegram per comunicazioni rapide e supporto tempestivo. \ \

#pagebreak()

= Conclusione
Il team Coderius ringrazia i referenti di Bluewind S.r.l. per la disponibilità e per i chiarimenti forniti, i quali permetteranno al gruppo di finalizzare la valutazione del capitolato. La riunione si dichiara conclusa alle ore 16:18.

#v(6em)
#align(right)[
  #text(weight: "bold")[Per presa visione e approvazione] \
  #v(3em)
  *Nome:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]\ #h(1.5em)
  #v(2em)
  *Firma:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]
]
