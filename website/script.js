document.addEventListener('DOMContentLoaded', () => {
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');

    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            tabButtons.forEach(btn => btn.classList.remove('active'));
            tabContents.forEach(content => content.classList.remove('active'));
            button.classList.add('active');
            const targetId = button.getAttribute('data-target');
            document.getElementById(targetId).classList.add('active');
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

    document.querySelectorAll('.member-card').forEach((card, i) => {
        card.style.transitionDelay = `${i * 0.07}s`;
    });

    const revealEls = document.querySelectorAll('.section-eyebrow, .section-title, .doc-grid, .repo-featured, .member-card, .tab-buttons');
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
});