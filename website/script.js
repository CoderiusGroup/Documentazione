document.addEventListener('DOMContentLoaded', () => {
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');

    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            tabButtons.forEach(btn => btn.classList.remove('active'));
            tabContents.forEach(content => content.classList.remove('active'));
            button.classList.add('active');
            const targetId = button.getAttribute('data-target');
            const targetEl = document.getElementById(targetId);
            if (targetEl) targetEl.classList.add('active');
        });
    });
    const tabButtonsContainer = document.querySelector('.tab-buttons');
    let indicator = null;
    if (tabButtonsContainer) {
        indicator = document.createElement('div');
        indicator.className = 'tab-indicator';
        tabButtonsContainer.appendChild(indicator);
        const initialActive = tabButtonsContainer.querySelector('.tab-btn.active');
        if (initialActive) moveIndicator(initialActive);
    }

    function moveIndicator(btn) {
        if (!indicator) return;
        indicator.style.left = btn.offsetLeft + 'px';
        indicator.style.width = btn.offsetWidth + 'px';
    }

    const heroSubtitle = document.querySelector('.hero p');
    if (heroSubtitle) {
        const text = heroSubtitle.textContent.trim();
        heroSubtitle.textContent = '';
        setTimeout(() => {
            heroSubtitle.style.opacity = '1';
            let i = 0;
            const type = () => {
                if (i < text.length) {
                    heroSubtitle.textContent += text[i++];
                    setTimeout(type, 45);
                }
            };
            type();
        }, 700);
    }

    // Delay Membri Team
    document.querySelectorAll('.member-card').forEach((card, i) => {
        card.style.transitionDelay = `${i * 0.07}s`;
    });
    
    const searchInput = document.getElementById('glossary-search');
    if (searchInput) {
        const totalCountEl = document.getElementById('total-count');
        const foundCountEl = document.getElementById('found-count');
        const noResultsMsg = document.getElementById('no-results');
        const terms = document.querySelectorAll('.glossary-term');
        const letters = document.querySelectorAll('.glossary-letter');

        let total = terms.length;
        totalCountEl.textContent = total;
        foundCountEl.textContent = total;

        searchInput.addEventListener('input', () => {
            const query = searchInput.value.toLowerCase().trim();
            let visibleCount = 0;

            terms.forEach(term => {
                const termTitle = term.querySelector('h3').textContent.toLowerCase();
                if (termTitle.includes(query)) {
                    term.style.display = 'block';
                    visibleCount++;
                } else {
                    term.style.display = 'none';
                }
            });

            letters.forEach(letter => {
                let next = letter.nextElementSibling;
                let hasVisibleTerms = false;
                
                while (next && next.classList.contains('glossary-term')) {
                    if (next.style.display !== 'none') {
                        hasVisibleTerms = true;
                        break;
                    }
                    next = next.nextElementSibling;
                }
                letter.style.display = hasVisibleTerms ? 'block' : 'none';
            });

            foundCountEl.textContent = visibleCount;
            if (noResultsMsg) {
                noResultsMsg.style.display = visibleCount === 0 ? 'block' : 'none';
            }
        });
    }

    const revealEls = document.querySelectorAll(
        '.section-eyebrow, .section-title, .doc-grid, .repo-featured, .member-card, .tab-buttons, .glossary-term, .glossary-letter'
    );
    
    revealEls.forEach(el => el.classList.add('reveal'));

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    revealEls.forEach(el => observer.observe(el));
    
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.site-nav a[href^="#"]');

    if (sections.length > 0 && navLinks.length > 0) {
        const navObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const id = entry.target.getAttribute('id');
                    navLinks.forEach(link => {
                        link.classList.toggle('nav-active', link.getAttribute('href') === `#${id}`);
                    });
                }
            });
        }, { threshold: 0.4 });
        sections.forEach(s => navObserver.observe(s));
    }
});