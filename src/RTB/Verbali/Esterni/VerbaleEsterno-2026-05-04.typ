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
    #text(size: 20pt)[*Versione 0.1.0*]
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
      [0.1.0], [2026/04/05], [Edis Hodja], [], [Prima stesura del verbale]
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
  data: "2026/05/04",
  ora_inizio: "15:00",
  ora_fine: "15:20",
  luogo: "Chiamata Zoom",
  scriba: "Alberto Canavese",
  azienda: "Bluewind S.r.l.",
  partecipanti_esterni: "Tobia Fiorese"
)

#heading(outlined: false, numbering: none)[Partecipanti Interni]
- Alberto Canavese
- Edis Hodja
- Filippo Zonta Rocha
- Giovanni Angelo Marco Bronte
- Ines Iadadi
- Leonardo Lorenzin

= Ordine del Giorno
+ Domande e chiarimenti su requisiti funzionali, gestione del sistema e aspetti progettuali emersi dalla documentazione.

= Svolgimento della Riunione
La riunione si è svolta in seguito all'avvio vero e proprio delle attività di stesura relative alla documentazione specifica RTB, a cui ciascun membro, in base al ruolo assegnato, ha contribuito in maniera efficiente ed esaustiva.
L’incontro con l’azienda ha avuto lo scopo di chiarire i dubbi emersi, validare la comprensione dei requisiti e approfondire gli aspetti rilevanti per lo sviluppo del progetto.

== Domande e Risposte
Di seguito vengono riportate le domande poste dal team e le risposte fornite dal referente aziendale.

#heading(level: 3, numbering: none, outlined: false)[1. Navigazione tra i nodi]
*Domanda:* Durante l’esecuzione di un decision tree, l’utente può navigare
liberamente tra i nodi già visitati oppure la navigazione deve essere
strettamente sequenziale? Nel primo caso, la modifica si limita al nodo
immediatamente precedente o qualsiasi nodo già attraversato? \
*Risposta:* Sebbene la navigazione libera verso qualsiasi nodo sia una
funzionalità ideale, essa comporta criticità logiche legate alla coerenza dei
dati. Qualora si permettesse il ritorno a un nodo arbitrario, il sistema
dovrebbe invalidare automaticamente tutti i nodi successivi dipendenti dalla
modifica eﬀettuata. Una soluzione funzionale potrebbe essere
l’implementazione di un meccanismo di "undo" per risalire la cronologia dei
nodi. La scelta tecnica specifica è lasciata alla discrezione del team di
sviluppo, privilegiando la semplicità implementativa.

#pagebreak()

#heading(level: 3, numbering: none, outlined: false)[2. Gestione delle sessioni]
*Domanda:* È prevista la possibilità per l’utente di salvare sessioni parziali e
permettergli di riprendere in un secondo momento dallo stesso punto? \
*Risposta:* Sì, il sistema deve supportare il salvataggio dello stato corrente
della valutazione. L'utente deve poter interrompere l'attività e riprenderla in
un secondo momento esattamente dal punto in cui era stata sospesa. Le
modalità tecniche di persistenza dei dati sono a libera scelta degli
sviluppatori.

#heading(level: 3, numbering: none, outlined: false)[3. Validazione del file di configurazione]
*Domanda:* Se il file di configurazione caricato dall’utente non contiene asset
validi il sistema deve bloccare il caricamento con un messaggio di errore
oppure permettere all’utente di procedere, ad esempio inserendo
manualmente le informazioni mancanti? \
*Risposta:* In caso di asset non validi, è suﬃciente che il sistema restituisca
un messaggio di errore bloccante. L'inserimento manuale delle informazioni
mancanti è considerato una funzionalità separata non prioritaria al momento.
Poiché i file di configurazione sono in formato leggibile ("human-readable"),
l'utente può correggere eventuali errori direttamente nel file prima di tentare
un nuovo caricamento.

#heading(level: 3, numbering: none, outlined: false)[4. Operazioni sulla struttura del decision tree]
*Domanda:* Quali operazioni deve poter compiere l'utente sulla struttura di un
decision tree? Si intende una modifica limitata ai valori delle foglie (esiti
Pass/Fail/Not Applicable), oppure è prevista la possibilità di intervenire sulla
struttura dell'albero, aggiungendo o rimuovendo nodi e rami? \
*Risposta:* La possibilità di intervenire sulla struttura dell'albero (aggiunta/
rimozione di nodi e rami) o di modificare le domande poste nelle foglie è
considerata un requisito opzionale ("nice-to-have"). È prevista la possibilità che, nel tempo, vengano aggiunti nuovi alberi decisionali o modificati
integralmente quelli esistenti.


#heading(level: 3, numbering: none, outlined: false)[5. Vincoli di validazione e gestione errori]
*Domanda:* A seguito di una modifica al decision tree la validazione su cosa
deve concentrarsi? Quali tipi di errori devono essere automaticamente
individuati e quali saranno le conseguenze? (esempio: le modifiche vengono
annullate o si torna allo stato di modifica, permettendo all’utente di
correggere i propri errori) \
*Risposta:* La validazione deve garantire l'integrità strutturale e logica
dell'albero. Nello specifico, ogni albero deve essere binario e deve prevedere
almeno un esito "Pass" e almeno un esito "Fail". Qualora una modifica violi
questi vincoli, il sistema non deve permettere il salvataggio, mantenendo
l'utente nella schermata di editing per consentire le correzioni necessarie.


#heading(level: 3, numbering: none, outlined: false)[6. Gestione profili utente e autenticazione]
*Domanda:* Nella riunione precedente è emerso che l’applicazione è
destinata ad uso interno e si può presupporre che l’utente abbia familiarità
con la norma. Volevamo chiarire se è previsto un unico profilo utente con
accesso a tutte le funzionalità, oppure se esistono ruoli distinti con permessi
diﬀerenziati, come un utente che esegue le valutazioni e un amministratore
che gestisce i decision tree. \
*Risposta:* Un unico profilo utente può essere considerato suﬃciente per le
necessità attuali. Tuttavia, l'implementazione di ruoli distinti (es. Valutatore e
Amministratore) è valutata positivamente come valore aggiunto. Nel caso in
cui si opti per la gestione multi-utente, sarà necessario implementare un
sistema di autenticazione per distinguere le autorizzazioni associate a
ciascun ruolo.


#heading(level: 3, numbering: none, outlined: false)[7. Report finale e formati export]
*Domanda:* Quali informazioni deve contenere il report finale oltre all’esito per
ogni requisito? Devono essere supportati altri formati oltre al PDF per
l’export? \
*Risposta:* Il report deve includere l'esito finale di ogni albero decisionale e la
"traccia" del percorso logico seguito (ovvero la sequenza di risposte fornite)
per giungere a tale risultato. Oltre al PDF, è opportuno supportare
l'esportazione in formati che ne consentano il salvataggio come file di dati.


#heading(level: 3, numbering: none, outlined: false)[8. Prossimi passi e allineamento analisi requisiti]
*Domanda:*  Sarebbe possibile nella prossima chiamata consultare l’analisi dei requisiti assieme? Dato che vorremmo avere la vostra opinione su come stiamo implementando i casi d’uso o i requisiti in
modo da allinearci meglio con le vostre aspettative. \
*Risposta:* La proposta è accolta favorevolmente. Il team può condividere
una bozza del documento di analisi prima della riunione per consentire una
revisione asincrona (via mail o tramite canali di comunicazione). La prossima riunione è confermata per il giorno 2026-05-18 alle ore 15:00.

= Conclusione e Decisioni Prese
In conclusione, il proponente oltre a mostrarsi disponibile per qualsiasi altro dubbio o quesito ha fissato nell'istante l'incontro per il prossimo incontro fissandolo nel calendario.

Al termine della riunione, il team si è riunito internamente tramite il canale di comunicazione, Discord, per discutere le risposte ricevute consolidandole al meglio.

  #table(
    columns: (auto, 1fr),
    align: (center, left),
    [*Codice*], [*Descrizione*],
    [VE-4.1], [Proseguire con la stesura del documento Analisi dei requisiti],
    [VE-4.2], [Proseguire con la stesura del Piano di progetto],
    [VE-4.3], [Proseguire con la stesura delle Norme di progetto],
    [VE-4.4], [Proseguire con l’aggiornamento del Glossario],
    [VE-4.5], [Avviare la stesura del Diario di bordo per la data 2026-05-08],
    [VE-4.6], [Aggiornare il documento Way of Working]
  )

#pagebreak()

= TODO
Elenco dei compiti assegnati ai membri del team in vista della prossima riunione.
#align(center)[
  #table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, center, center),
    [*Codice*], [*Descrizione*], [*Assegnatari*], [*Decisione di riferimento*],
    [TD-5.1], [Continuazione del documento Analisi dei requisiti], [Ines Iadadi, Alberto Canavese], [VE-4.1],
    [TD-5.2], [Continuazione del documento Piano di progetto], [Giovanni Angelo Marco Bronte], [VE-4.2],
    [TD-5.3], [Continuazione del documento Norme di progetto], [Edis Hodja], [VE-4.3],
    [TD-5.4], [Continuazione del documento Glossario], [Ines Iadadi, Alberto Canavese], [VE-4.4],
    [TD-5.5], [Stesura Diario di bordo], [Team], [VE-4.5],
    [TD-5.6], [Aggiornamento del Way of Working], [Team], [VE-4.6],
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