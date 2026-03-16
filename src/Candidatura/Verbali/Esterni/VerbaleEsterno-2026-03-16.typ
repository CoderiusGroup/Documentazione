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
      [0.1.0], [16/03/2026], [Ines Iadadi], [Filippo Zonta Rocha], [Prima stesura del verbale],
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
  data: "16/03/2026",
  ora_inizio: "11:00",
  ora_fine: "11:20",
  luogo: "Google Meet",
  scriba: "Alberto Canavese",
  azienda: "Eggon",
  partecipanti_esterni: "Gianpaolo Ferrarin, Luca Iuzzolino"
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
L'incontro si è aperto con una breve presentazione del team Coderius ai referenti aziendali. Successivamente, la riunione si è focalizzata sull'analisi e il chiarimento di alcuni punti tecnici e organizzativi relativi al progetto Nexum.

== Domande e Risposte
Di seguito vengono riportati le domande poste dal team e le relative risposte fornite dai referenti aziendali.

#heading(level: 3, numbering: none, outlined: false)[1. Modalità di allineamento periodico]
*Domanda:* Qual è la modalità preferita per i futuri incontri di allineamento (online o in presenza)? \
*Risposta:* Di norma i meeting si terranno in modalità telematica. Tuttavia, l'azienda ha confermato la piena disponibilità a organizzare incontri in presenza presso la propria sede, qualora il team ne ritenesse la necessità.

#heading(level: 3, numbering: none, outlined: false)[2. Risorse tecnologiche e formazione]
*Domanda:* Esistono vincoli tecnologici, linee guida interne da seguire o risorse fornite dall'azienda per l'apprendimento degli strumenti richiesti? \
*Risposta:* Verranno fornite le risorse necessarie per la componente di AI basata su ambiente AWS. Per quanto riguarda la formazione, il team dovrà fare riferimento alla documentazione ufficiale AWS. Trattandosi di una tecnologia esplorativa anche per l'azienda stessa, non sono previste linee guida interne rigide.

#heading(level: 3, numbering: none, outlined: false)[3. Formato e layout dei documenti da analizzare]
*Domanda:* I documenti caricati dai consulenti del lavoro (es. per l'analisi OCR) presenteranno layout standardizzati o variabili? Conterranno esclusivamente testo o anche immagini? \
*Risposta:* I file da elaborare saranno forniti esclusivamente in formato PDF (incluse eventuali scansioni, che verranno comunque convertite in PDF). Non è prevista l'elaborazione di immagini pure. Il layout varierà in base alla tipologia di documento trattato, ma manterrà una coerenza strutturale all'interno della categoria.

#heading(level: 3, numbering: none, outlined: false)[4. Criteri di accettazione e approccio AI]
*Domanda:* Come vanno interpretati i criteri di accettazione \"confidenza media OCR ≥ 90%, mapping CF ≥ 99%\" indicati nel capitolato? \
*Risposta:* I parametri indicati rappresentano stime di massima e non vincoli assoluti. Per l'analisi documentale tramite AI, il team è invitato a valutare e confrontare due possibili approcci:
+ Utilizzo di un LLM pre-addestrato per l'estrazione dei dati (metodo più rapido, basato sul Prompt Engineering).
+ Utilizzo di Amazon Comprehend per l'addestramento di un modello customizzato sulle specifiche esigenze aziendali. Questo approccio richiede uno sforzo maggiore, ma riduce il rischio di \"allucinazioni\" dell'AI e garantisce un confidence score più elevato.

*Domanda in seguito alla risposta del referente:* Quale dei due approcci è preferito dall'azienda o è stato adottato dal gruppo del I lotto? \
*Risposta:* L'azienda non impone una scelta rigida. Il team è incoraggiato a sperimentare entrambe le soluzioni per valutarne le performance. Questa fase di ricerca e analisi comparativa è considerata parte integrante del valore del progetto.

#heading(level: 3, numbering: none, outlined: false)[5. Architettura di sistema]
*Domanda:* Lo schema architetturale illustrato nel documento di presentazione deve essere implementato fedelmente? \
*Risposta:* Lo schema illustra l'infrastruttura attuale dell'applicazione Nexum. L'obiettivo del team non è replicare l'intera architettura aziendale, bensì sviluppare un PoC (Proof of Concept) stand-alone che sia predisposto per integrarsi in quella struttura.

#heading(level: 3, numbering: none, outlined: false)[6. Tempistiche e pianificazione]
*Domanda:* Quali sono le scadenze previste dall'azienda per la conclusione del progetto? \
*Risposta:* L'azienda non impone scadenze stringenti. Le tempistiche di consegna andranno concordate in autonomia dal team in base alle scadenze accademiche stabilite dal docente.

*Raccomandazione del referente Gianpaolo Ferrarin:* Si consiglia caldamente di strutturare un calendario chiaro fin da subito. Il team dovrebbe suddividere il lavoro in fasi misurabili, partendo dalla progettazione (design UI/UX e architettura funzionale) per poi stimare i tempi di sviluppo effettivo.

= Conclusione
Il team Coderius ringrazia i referenti di Eggon per la disponibilità e per i chiarimenti forniti, i quali permetteranno al gruppo di finalizzare la valutazione del capitolato. La riunione si dichiara conclusa alle ore 11:20.

#v(6em)
#align(right)[
  #text(weight: "bold")[Per presa visione e approvazione] \
  #v(3em)
  *Nome:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]\ #h(1.5em)
  #v(2em)
  *Firma:* #box(baseline: 0.2em)[#line(length: 4.5cm, stroke: 0.8pt)]
]