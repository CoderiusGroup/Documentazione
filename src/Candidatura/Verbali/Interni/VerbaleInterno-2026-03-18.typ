#let verbale(
  titolo: "",
  data: "",
  ora_inizio: "",
  ora_fine: "",
  luogo: "",
  body
) = {
  set document(title: titolo, author: "Coderius")
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(100))
      #grid(
        columns: (1fr, 1fr),
        align(left)[Verbale Interno],
        align(right)[Coderius Group]
      )
      #v(-0.5em)
      #line(length: 100%, stroke: 0.4pt + luma(150))
    ]
  }
  )
  set text(font: "Libertinus Serif", size: 11pt, lang: "it")
  set heading(numbering: "1.1.")

  align(center)[
    #v(4em)
    #image("/logoCoderius.jpg", width: 50%)
    #link("mailto:coderius01@gmail.com")[
      #text(size: 1.2em)[coderius01\@gmail.com]
    ]
    #v(3em)
    #line(length: 80%, stroke: 1.5pt)
    #v(1em)
    #text(size: 2.2em, weight: "bold")[#titolo]
    #v(1em)
    #line(length: 80%, stroke: 1.5pt)
    #v(4em)
    
    #grid(
      columns: (1fr, 1fr),
      align: left,
      gutter: 2em,
      [ *Data:* #data \
        *Ora inizio:* #ora_inizio \
        *Ora fine:* #ora_fine \
        *Luogo:* #luogo ]
    )
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
      // aggiungi nuova riga quando aggiorni
      [1.0.0], [], [], [], [Approvazione verbale],
      [0.2.0], [2026/03/18], [Leonardo Lorenzin], [], [Correzione refusi e rifinitura del verbale],
      [0.1.0], [2026/03/18], [Giovanni Bronte], [Leonardo Lorenzin], [Prima stesura del verbale],
      
      
    )
  ]

  pagebreak()

  show outline.entry.where(level: 1): set block(above: 1.5em)
  outline(
    title: text(weight: "bold")[Indice],
    indent: 2em,
    depth: 3
  )

  pagebreak()
  set page(numbering: "1 / 1")
  counter(page).update(1)
  body
}

#show: verbale.with(
  titolo: "Verbale Riunione Interna",
  data: "2026/03/18",
  ora_inizio: "9:00",
  ora_fine: "10:30",
  luogo: "Canale Vocale Discord"
)


#heading(outlined: false, numbering: none)[Partecipanti]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin
#v(0.5cm)

= Ordine del Giorno
- Scelta del capitolato;
- Definizione del Way Of Working iniziale;
- Assegnazione della stesura della Dichiarazione degli impegni e della Lettera di presentazione.
#v(0.5cm)

= Svolgimento della Riunione

== Scelta del capitolato
In seguito ai colloqui svolti con le aziende *EGGON* e *Bluewind S.r.l* nei quali sono stati chiariti i dubbi riguardanti i rispettivi progetti e a un'attenta analisi dei capitolati proposti riportata nel documento specifico, il gruppo ha concordato in modo unanime di proseguire con il capitolato *C1* : "*Automated EN18031 Compliance Verification*" proposto da Bluewind S.r.l. \
La motivazione della scelta di questo capitolato è descritta nel documento "Analisi dei Capitolati".

#v(0.3cm)

== Scelta del Way of Working

=== Gestione della repository\
È stata ufficializzata la repository contenente la documentazione relativa al progetto, consultabile al seguente indirizzo: #link("https://github.com/CoderiusGroup/Documentazione")[#text(fill: blue)[github.com/CoderiusGroup/Documentazione]].
#v(0.1cm)
Per la stesura dei documenti è stato deciso di utilizzare il linguaggio *Typst*, in quanto permette di creare documenti professionali con template ben precisi.\
È stata anche decisa la nomenclatura dei vari file presenti nella repository, in modo da essere più facilmente reperibili: _TipoDocumento-Anno-Mese-Giorno_ (esempio: VerbaleInterno-2026-03-18).\

Il workflow adottato dal team è *Gitflow*, con il quale i membri del team hanno già esperienza. \

#pagebreak()

*Branching model* \ 
La repository del nostro team risulta suddivisa in queste branches:
- *main*: branch che contiene solo le versioni finali dei documenti, dopo che sono state validate da chi svolge il ruolo di verificatore al momento.
- *develop*: branch di sviluppo che serve come punto di integrazione delle funzionalità sviluppate, in cui confluiscono i vari branch di feature.
- *feature*: branch di feature contenenti i documenti specifici in fase di sviluppo.
Le pull request dovranno essere approvate dalla persona che svolge il ruolo di _Verificatore_ o da un membro del gruppo che non ha redatto il documento, affinché possa essere chiusa ed essere effettuata l'integrazione  nel ramo principale. \ \

*CI/CD* \
Quando possibile all'interno delle repository dell'organizzazione i processi di *build* e *testing* devono essere automatizzati in modo da ridurre il carico di lavoro per ogni membro del gruppo. \
Al momento della scrittura di questo verbale sono stati automatizzati i processi di compilazione dei file _*.typ*_ presenti nella cartella _*src*_ e l'aggiornamento del sito quando il documento è stato validato.

=== Struttura dei documenti
In base alla tipologia del documento è stata stabilita una *struttura base* che andrà rispettata dai membri del team. Ciascun documento redatto dal gruppo deve contenere:
- Logo di Coderius Group
- Titolo del documento
- Tabella di versionamento
- Indice
Inoltre i *verbali interni* devono presentare le seguenti sezioni:
- Informazioni generali come: data, orario, luogo, partecipanti
- Ordine del giorno
- Svolgimento della riunione
- Conclusioni e decisioni prese
I *verbali esterni* mantengono la stessa struttura dei verbali interni, con le seguenti variazioni:
- Informazioni generali: integrazione di campi specifici quali scriba, azienda, partecipanti esterni.
- Conclusione: che è dedicata all'approvazione esterna da parte del proponente esterno.\

Per i documenti specifici attualmente _non_ è stato definito un template in quanto ritenuti molto variabili.
=== Metodologia di lavoro
Il gruppo ha concordato di adottare la metodologia AGILE, strutturando il lavoro in *sprint* della durata di _2 settimane_, alla fine dei quali avverrà la rotazione dei ruoli all’interno del team. La durata di questi sprint è variabile in base alle necessità del progetto.\
I meeting ufficiali del team avverranno con frequenza settimanale, preferibilmente il _lunedì mattina_, con la possibilità di svolgerne di aggiuntivi in caso di necessità. \
Al termine di ogni incontro, verrà redatto un verbale che rispetta il template descritto precedentemente.

#pagebreak()

= Conclusione e Decisioni Prese
Al termine della riunione sono stati pianificati e assegnati i compiti relativi alla stesura e alla validazione dei documenti necessari per il proseguimento del progetto, assicurando una corretta organizzazione del lavoro e coerenza con le tempistiche stabilite. In particolare:
- *Dichiarazione degli impegni*;
- *Lettera di presentazione*.
#align(center)[
  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VI-2.1], [Scelta definitiva del capitolato C1.],
    [VI-2.2], [Definizione del Way of Working iniziale.],
    [VI-2.3], [Approvazione dei template per i verbali.],
    [VI-2.4], [Assegnazione stesura della Dichiarazione degli Impegni.],
    [VI-2.5], [Assegnazione stesura della Lettera di Presentazione.]
  )
]
== Ordine del Giorno prossimo incontro
I seguenti punti saranno affrontati nel corso della prossima riunione programmata:
- Approvazione finale della _Lettera di Presentazione_;
- Approvazione finale della _Dichiarazione degli Impegni_.