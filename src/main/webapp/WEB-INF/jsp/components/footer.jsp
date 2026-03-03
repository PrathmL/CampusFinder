<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer mt-auto">
    <div class="footer-main">
        <div class="container">
            <div class="row g-4">
                <!-- Brand Column -->
                <div class="col-lg-4">
                    <div class="footer-brand">
                        <div class="brand-icon mb-3">
                            <i class="bi bi-mortarboard-fill"></i>
                        </div>
                        <h5 class="fw-bold mb-2">CampusFinder.edu</h5>
                        <p class="text-secondary mb-3">Secure, smart, and community-driven lost & found platform exclusively for educational institutions.</p>
                        <div class="verified-badge">
                            <i class="bi bi-patch-check-fill text-primary me-1"></i>
                            <span>Official Campus Service</span>
                        </div>
                    </div>
                </div>

                <!-- Quick Links -->
                <div class="col-lg-2 col-md-4">
                    <h6 class="footer-title">Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/"><i class="bi bi-chevron-right"></i>Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/items"><i class="bi bi-chevron-right"></i>Directory</a></li>
                        <li><a href="${pageContext.request.contextPath}/how-it-works"><i class="bi bi-chevron-right"></i>How it Works</a></li>
                        <li><a href="${pageContext.request.contextPath}/faq"><i class="bi bi-chevron-right"></i>FAQ</a></li>
                        <li><a href="${pageContext.request.contextPath}/about-us"><i class="bi bi-chevron-right"></i>About Us</a></li>
                    </ul>
                </div>

                <!-- Support -->
                <div class="col-lg-2 col-md-4">
                    <h6 class="footer-title">Support</h6>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/help-center"><i class="bi bi-chevron-right"></i>Help Center</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact"><i class="bi bi-chevron-right"></i>Contact Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/privacy-policy"><i class="bi bi-chevron-right"></i>Privacy Policy</a></li>
                        <li><a href="${pageContext.request.contextPath}/terms-conditions"><i class="bi bi-chevron-right"></i>Terms of Service</a></li>
                    </ul>
                </div>

                <!-- Contact Info -->
                <div class="col-lg-4 col-md-4">
                    <h6 class="footer-title">Contact & Updates</h6>
                    <ul class="contact-info">
                        <li>
                            <i class="bi bi-envelope-fill"></i>
                            <span>support@campusfinder.edu.in</span>
                        </li>
                        <li>
                            <i class="bi bi-telephone-fill"></i>
                            <span>+91 (555) 123-4567</span>
                        </li>
                        <li>
                            <i class="bi bi-geo-alt-fill"></i>
                            <span>College Campus, Student Union</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Bottom -->
    <div class="footer-bottom">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4 mb-3 mb-md-0">
                    <span class="copyright">
                        <i class="bi bi-c-circle me-1"></i>
                        2026 CampusFinder. All rights reserved.
                    </span>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="footer-stats">
                        <span class="stat-badge">
                            <i class="bi bi-people-fill"></i>
                            1,893 Students
                        </span>
                        <span class="stat-badge">
                            <i class="bi bi-box-seam"></i>
                            2,139 Items
                        </span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="social-links">
                        <a href="#" class="social-link" title="Facebook">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="#" class="social-link" title="Twitter">
                            <i class="bi bi-twitter-x"></i>
                        </a>
                        <a href="#" class="social-link" title="Instagram">
                            <i class="bi bi-instagram"></i>
                        </a>
                        <a href="#" class="social-link" title="LinkedIn">
                            <i class="bi bi-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>

<!-- Initialize AOS -->
<script>
    AOS.init({
        duration: 800,
        once: true
    });
</script>

<style>
/* Footer Styles */
.footer {
    background: var(--bg-white);
    border-top: 1px solid var(--border-light);
    position: relative;
    overflow: hidden;
}

.footer::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: var(--gradient-primary);
}

.footer-main {
    padding: 4rem 0 2rem;
    position: relative;
}

/* Brand Section */
.footer-brand .brand-icon {
    width: 50px;
    height: 50px;
    background: var(--gradient-primary);
    border-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 2rem;
    transform: rotate(-5deg);
    transition: all 0.3s ease;
}

.footer-brand:hover .brand-icon {
    transform: rotate(0deg) scale(1.1);
}

.verified-badge {
    display: inline-flex;
    align-items: center;
    padding: 0.5rem 1rem;
    background: var(--primary-soft);
    border-radius: 50px;
    color: var(--primary);
    font-weight: 600;
    font-size: 0.9rem;
}

/* Footer Titles */
.footer-title {
    font-weight: 700;
    color: var(--text-primary);
    margin-bottom: 1.5rem;
    position: relative;
    padding-bottom: 0.5rem;
}

.footer-title::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 40px;
    height: 2px;
    background: var(--gradient-primary);
}

/* Footer Links */
.footer-links {
    list-style: none;
    padding: 0;
    margin: 0;
}

.footer-links li {
    margin-bottom: 0.75rem;
}

.footer-links a {
    color: var(--text-secondary);
    text-decoration: none;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.footer-links a i {
    font-size: 0.8rem;
    color: var(--primary);
    transition: transform 0.3s ease;
}

.footer-links a:hover {
    color: var(--primary);
    transform: translateX(5px);
}

.footer-links a:hover i {
    transform: translateX(3px);
}

/* Contact Info */
.contact-info {
    list-style: none;
    padding: 0;
    margin: 0;
}

.contact-info li {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    margin-bottom: 1rem;
    color: var(--text-secondary);
}

.contact-info i {
    color: var(--primary);
    font-size: 1.2rem;
    width: 24px;
}

/* Newsletter */
.newsletter-box {
    background: var(--bg-light);
    padding: 1rem;
    border-radius: 15px;
}

.newsletter-box .form-control {
    border: 1px solid var(--border-light);
    border-radius: 10px 0 0 10px;
    padding: 0.5rem 1rem;
}

.newsletter-box .btn {
    border-radius: 0 10px 10px 0;
    padding: 0.5rem 1rem;
}

/* Footer Bottom */
.footer-bottom {
    background: var(--bg-light);
    padding: 1.5rem 0;
    border-top: 1px solid var(--border-light);
}

.copyright {
    color: var(--text-muted);
    font-size: 0.9rem;
    display: flex;
    align-items: center;
    gap: 0.25rem;
}

.footer-stats {
    display: flex;
    gap: 1rem;
    justify-content: center;
}

.stat-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.25rem 1rem;
    background: var(--bg-white);
    border-radius: 50px;
    color: var(--text-secondary);
    font-size: 0.85rem;
    border: 1px solid var(--border-light);
}

.stat-badge i {
    color: var(--primary);
}

/* Social Links */
.social-links {
    display: flex;
    gap: 0.75rem;
    justify-content: flex-end;
}

.social-link {
    width: 40px;
    height: 40px;
    background: var(--bg-white);
    border: 1px solid var(--border-light);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--primary);
    text-decoration: none;
    transition: all 0.3s ease;
    font-size: 1.2rem;
}

.social-link:hover {
    background: var(--gradient-primary);
    color: white;
    transform: translateY(-3px);
    border-color: transparent;
    box-shadow: 0 4px 12px rgba(42, 111, 151, 0.3);
}

/* Responsive */
@media (max-width: 768px) {
    .footer-main {
        padding: 3rem 0 1.5rem;
    }
    
    .footer-title {
        margin-top: 1.5rem;
    }
    
    .footer-stats {
        justify-content: flex-start;
    }
    
    .social-links {
        justify-content: flex-start;
        margin-top: 1rem;
    }
    
    .footer-brand {
        text-align: center;
    }
    
    .footer-brand .brand-icon {
        margin-left: auto;
        margin-right: auto;
    }
    
    .contact-info li {
        justify-content: center;
    }
    
    .newsletter-box .input-group {
        max-width: 300px;
        margin: 0 auto;
    }
}

@media (max-width: 576px) {
    .footer-stats {
        flex-direction: column;
        gap: 0.5rem;
    }
    
    .stat-badge {
        justify-content: center;
    }
    
    .social-links {
        justify-content: center;
    }
}
</style>