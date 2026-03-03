<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>CampusFinder | Smart Lost & Found for Education</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <!-- Hero Section with Clean Background -->
    <section class="hero-section">
        <div class="hero-shapes">
            <div class="shape shape-1"></div>
            <div class="shape shape-2"></div>
            <div class="shape shape-3"></div>
        </div>
        <div class="container position-relative">
            <div class="row min-vh-100 align-items-center">
                <div class="col-lg-8 mx-auto text-center" data-aos="fade-up" data-aos-duration="1000">
                    <div class="hero-badge mb-4">
                        <i class="bi bi-mortarboard-fill me-2"></i>
                        OFFICIAL CAMPUS SERVICE
                    </div>
                    <h1 class="display-3 fw-bold mb-4">
                        <span class="gradient-text">Never Lose</span> What Matters<br>in Your Academic Journey
                    </h1>
                    <p class="lead mb-5 text-secondary">Secure, smart, and community-driven lost & found platform exclusively for educational institutions. Reunite with your belongings faster.</p>
                    
                    <div class="d-flex flex-column flex-sm-row justify-content-center gap-3">
                        <a href="${pageContext.request.contextPath}/report/lost" class="btn-primary">
                            <i class="bi bi-flag-fill me-2"></i>
                            Report Lost Item
                        </a>
                        <a href="${pageContext.request.contextPath}/report/found" class="btn-outline-primary">
                            <i class="bi bi-gift-fill me-2"></i>
                            Report Found Item
                        </a>
                    </div>

                    <!-- Live Stats Counter -->
                    <div class="row mt-5 pt-5 g-4">
                        <div class="col-md-4">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="bi bi-search-heart"></i>
                                </div>
                                <div class="stat-number"><span class="counter" data-target="1247">0</span></div>
                                <div class="stat-label">Items Lost</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="bi bi-gift"></i>
                                </div>
                                <div class="stat-number"><span class="counter" data-target="892">0</span></div>
                                <div class="stat-label">Items Found</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card">
                                <div class="stat-icon">
                                    <i class="bi bi-people"></i>
                                </div>
                                <div class="stat-number"><span class="counter" data-target="1893">0</span></div>
                                <div class="stat-label">Active Students</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Scroll Indicator -->
        <div class="scroll-indicator">
            <div class="mouse">
                <div class="wheel"></div>
            </div>
            <div class="scroll-text">Scroll to explore</div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section bg-light">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-lg-8 mx-auto">
                    <h2 class="section-title">Smart Features for <span class="gradient-text">Modern Campus</span></h2>
                    <p class="section-subtitle text-secondary">Leverage technology to streamline the lost and found process across your educational institution</p>
                </div>
            </div>
            
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="feature-icon">
                            <i class="bi bi-lightning-charge"></i>
                        </div>
                        <h4>Instant Reporting</h4>
                        <p class="text-secondary">Submit lost or found reports in seconds with our optimized mobile-friendly forms</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card" data-aos="fade-up" data-aos-delay="200">
                        <div class="feature-icon">
                            <i class="bi bi-search"></i>
                        </div>
                        <h4>Smart Discovery</h4>
                        <p class="text-secondary">Our intelligent system cross-references reports to find potential matches across all categories</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card" data-aos="fade-up" data-aos-delay="300">
                        <div class="feature-icon">
                            <i class="bi bi-bell"></i>
                        </div>
                        <h4>Instant Alerts</h4>
                        <p class="text-secondary">Real-time notifications when your item is found or reported</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="feature-card" data-aos="fade-up" data-aos-delay="400">
                        <div class="feature-icon">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <h4>Secure Verification</h4>
                        <p class="text-secondary">Multi-step verification ensures items return to rightful owners</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works -->
    <section class="how-it-works">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-lg-8 mx-auto">
                    <h2 class="section-title">How It <span class="gradient-text">Works</span></h2>
                    <p class="section-subtitle text-secondary">Three simple steps to reunite with your belongings</p>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-4">
                    <div class="step-card text-center" data-aos="fade-right">
                        <div class="step-number">1</div>
                        <div class="step-icon">
                            <i class="bi bi-pencil-square"></i>
                        </div>
                        <h4>Report Item</h4>
                        <p class="text-secondary">Submit details about your lost or found item with photos and description</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="step-card text-center" data-aos="fade-up">
                        <div class="step-number">2</div>
                        <div class="step-icon">
                            <i class="bi bi-arrow-repeat"></i>
                        </div>
                        <h4>System Matching</h4>
                        <p class="text-secondary">Our system cross-references item categories to find potential matches instantly</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="step-card text-center" data-aos="fade-left">
                        <div class="step-number">3</div>
                        <div class="step-icon">
                            <i class="bi bi-hand-thumbs-up"></i>
                        </div>
                        <h4>Safe Return</h4>
                        <p class="text-secondary">Verify ownership and securely retrieve your item</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section bg-light">
        <div class="container">
            <div class="cta-card">
                <div class="row align-items-center">
                    <div class="col-lg-8 text-lg-start text-center mb-4 mb-lg-0">
                        <h3 class="display-6 fw-bold mb-2">Ready to join the smart campus community?</h3>
                        <p class="mb-0 text-secondary">Start managing lost and found items efficiently today</p>
                    </div>
                    <div class="col-lg-4 text-lg-end text-center">
                        <a href="${pageContext.request.contextPath}/register" class="btn-primary btn-lg">
                            <i class="bi bi-person-plus-fill me-2"></i>
                            Get Started Now
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="components/footer.jsp" />

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        // Initialize AOS
        AOS.init({
            duration: 800,
            once: true
        });

        // Counter Animation
        const counters = document.querySelectorAll('.counter');
        const speed = 200;

        const animateCounter = (counter) => {
            const target = parseInt(counter.getAttribute('data-target'));
            const count = parseInt(counter.innerText);
            const increment = target / speed;

            if (count < target) {
                counter.innerText = Math.ceil(count + increment);
                setTimeout(() => animateCounter(counter), 1);
            } else {
                counter.innerText = target;
            }
        };

        // Start counter animation when element is in viewport
        const observerOptions = {
            threshold: 0.5
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const counter = entry.target;
                    animateCounter(counter);
                    observer.unobserve(counter);
                }
            });
        }, observerOptions);

        counters.forEach(counter => observer.observe(counter));

        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>