<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact Us | CampusFinder</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .auth-section {
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 120px 0;
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, #f0f9ff 0%, #e6f0fa 100%);
        }
        
        .auth-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }
        
        .auth-shape {
            position: absolute;
            background: linear-gradient(135deg, rgba(42, 111, 151, 0.1), rgba(0, 166, 180, 0.1));
            border-radius: 50%;
            filter: blur(60px);
        }
        
        .auth-shape-1 {
            width: 500px;
            height: 500px;
            top: -250px;
            right: -100px;
            background: linear-gradient(135deg, #4a8bb7, #00a6b4);
            opacity: 0.3;
        }
        
        .auth-shape-2 {
            width: 400px;
            height: 400px;
            bottom: -200px;
            left: -100px;
            background: linear-gradient(135deg, #00a6b4, #f39c12);
            opacity: 0.3;
        }
        
        .auth-card {
            background: var(--bg-white);
            border-radius: 30px;
            padding: 4rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-light);
            position: relative;
            z-index: 2;
            max-width: 900px;
            width: 100%;
            margin: 0 auto;
        }
        
        .auth-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .policy-content {
            color: var(--text-secondary);
            line-height: 1.8;
            font-size: 1.05rem;
        }
        
        .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .contact-method {
            text-align: center;
            padding: 2rem;
            background: var(--bg-light);
            border-radius: 20px;
            border: 1px solid var(--border-light);
        }

        .contact-method i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
            display: block;
        }

        .contact-method h4 {
            color: var(--text-primary);
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            margin-bottom: 2rem;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--secondary);
            transform: translateX(-5px);
        }

        .contact-form {
            margin-top: 3rem;
            padding-top: 3rem;
            border-top: 1px solid var(--border-light);
        }

        .form-control {
            border-radius: 12px;
            padding: 0.75rem 1rem;
            border: 2px solid var(--border-light);
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: none;
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <section class="auth-section">
        <div class="auth-shapes">
            <div class="auth-shape auth-shape-1"></div>
            <div class="auth-shape auth-shape-2"></div>
        </div>
        
        <div class="container">
            <div class="auth-card" data-aos="fade-up">
                <a href="${pageContext.request.contextPath}/" class="back-link">
                    <i class="bi bi-arrow-left"></i> Back to Home
                </a>
                
                <h1 class="auth-title">Contact Us</h1>
                
                <div class="policy-content">
                    <p class="text-center">Have questions or need assistance? Our team is here to help you reunite with your belongings.</p>

                    <div class="contact-grid">
                        <div class="contact-method">
                            <i class="bi bi-envelope-at"></i>
                            <h4>Email Us</h4>
                            <p>support@campusfinder.edu</p>
                        </div>
                        <div class="contact-method">
                            <i class="bi bi-telephone"></i>
                            <h4>Call Us</h4>
                            <p>+1 (555) 123-4567</p>
                        </div>
                        <div class="contact-method">
                            <i class="bi bi-geo-alt"></i>
                            <h4>Visit Us</h4>
                            <p>Student Union, Room 204</p>
                        </div>
                    </div>

                    <div class="contact-form">
                        <h3 class="text-center mb-4">Send us a Message</h3>
                        <form action="/contact" method="POST">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Name</label>
                                    <input type="text" name="name" class="form-control" value="${loggedInUser.fullName}" placeholder="Your Name" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">University Email</label>
                                    <input type="email" name="email" class="form-control" value="${loggedInUser.email}" placeholder="name@example.edu" required readonly>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Subject</label>
                                    <input type="text" name="subject" class="form-control" placeholder="How can we help?" required>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Message</label>
                                    <textarea name="message" class="form-control" rows="5" placeholder="Your message here..." required></textarea>
                                </div>
                                <div class="col-12 text-center mt-4">
                                    <button type="submit" class="btn btn-primary btn-lg rounded-pill px-5">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>
