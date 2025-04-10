// BU SASE Website JavaScript

document.addEventListener('DOMContentLoaded', function () {
    // Mobile Menu Toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const navLinks = document.querySelector('.nav-links');

    if (menuToggle) {
        menuToggle.addEventListener('click', function () {
            menuToggle.classList.toggle('active');
            navLinks.classList.toggle('active');
        });
    }

    // Hide menu when clicking outside
    document.addEventListener('click', function (event) {
        if (!event.target.closest('.main-nav') && navLinks.classList.contains('active')) {
            menuToggle.classList.remove('active');
            navLinks.classList.remove('active');
        }
    });

    // Shrink header on scroll
    const header = document.querySelector('.site-header');

    function checkScroll() {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    }

    window.addEventListener('scroll', checkScroll);
    checkScroll(); // Check on load

    // Duplicate company logos for infinite scroll effect
    const companyTrack = document.querySelector('.company-track');

    if (companyTrack) {
        // Clone the initial set of logos
        const companyLogos = document.querySelectorAll('.company-logo');

        // Create multiple sets for smoother infinite scroll
        for (let i = 0; i < 4; i++) {
            companyLogos.forEach(logo => {
                const clone = logo.cloneNode(true);
                companyTrack.appendChild(clone);
            });
        }

        // Calculate animation length based on number of logos
        const totalLogos = document.querySelectorAll('.company-logo').length;
        const trackWidth = (totalLogos / 5) * 100; // Each set is 100% width

        companyTrack.style.width = `${trackWidth}%`;

        // Adjust the animation keyframes based on the content
        document.styleSheets[0].insertRule(
            `@keyframes scroll {
          0% { transform: translateX(0); }
          100% { transform: translateX(-${20}%); }
        }`,
            document.styleSheets[0].cssRules.length
        );
    }

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');

            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);

            if (targetElement) {
                const headerHeight = document.querySelector('.site-header').offsetHeight;
                const targetPosition = targetElement.getBoundingClientRect().top + window.pageYOffset - headerHeight;

                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });

                // Close mobile menu if open
                if (navLinks.classList.contains('active')) {
                    menuToggle.classList.remove('active');
                    navLinks.classList.remove('active');
                }
            }
        });
    });

    // Animate elements when they come into view
    const animateOnScroll = function () {
        const elements = document.querySelectorAll('.pillar-card, .section-title, .section-subtitle');

        elements.forEach(element => {
            const elementPosition = element.getBoundingClientRect().top;
            const screenPosition = window.innerHeight / 1.2;

            if (elementPosition < screenPosition) {
                element.classList.add('animate');
            }
        });
    };

    window.addEventListener('scroll', animateOnScroll);
    animateOnScroll(); // Check on load
});