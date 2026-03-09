document.addEventListener('DOMContentLoaded', () => {
    // Seleziona tutti i bottoni dei tab e i contenuti dei tab
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');

    // Aggiunge un event listener a ciascun bottone
    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            // 1. Rimuove la classe 'active' da tutti i bottoni e contenuti
            tabButtons.forEach(btn => btn.classList.remove('active'));
            tabContents.forEach(content => content.classList.remove('active'));

            // 2. Aggiunge la classe 'active' al bottone cliccato
            button.classList.add('active');

            // 3. Trova l'id del contenuto target e lo rende visibile
            const targetId = button.getAttribute('data-target');
            document.getElementById(targetId).classList.add('active');
        });
    });
});