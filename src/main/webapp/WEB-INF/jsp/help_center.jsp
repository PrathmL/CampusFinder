<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Help Center | CampusFinder</title>
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
        
        .help-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .help-box {
            padding: 2rem;
            background: var(--bg-light);
            border-radius: 20px;
            border: 1px solid var(--border-light);
            transition: all 0.3s ease;
        }

        .help-box:hover {
            transform: translateY(-5px);
            border-color: var(--primary);
            background: var(--bg-white);
        }

        .help-box i {
            font-size: 2rem;
            color: var(--primary);
            margin-bottom: 1rem;
            display: block;
        }

        .help-box h4 {
            color: var(--text-primary);
            font-weight: 700;
            margin-bottom: 1rem;
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
                
                <h1 class="auth-title">Help Center</h1>
                
                <div class="policy-content">
                    <p class="text-center">How can we help you today? Explore our guides and support resources to get the most out of CampusFinder.</p>

                    <div class="help-grid">
                        <div class="help-box">
                            <i class="bi bi-person-badge"></i>
                            <h4>Account & Profile</h4>
                            <p>Learn how to manage your university profile, change passwords, and update notification settings.</p>
                        </div>
                        <div class="help-box">
                            <i class="bi bi-search"></i>
                            <h4>Reporting Items</h4>
                            <p>Guide on how to file effective reports with photos and detailed descriptions for better matching.</p>
                        </div>
                        <div class="help-box">
                            <i class="bi bi-shield-check"></i>
                            <h4>Claiming Process</h4>
                            <p>Everything you need to know about providing proof of ownership and retrieving your items.</p>
                        </div>
                        <div class="help-box">
                            <i class="bi bi-safe"></i>
                            <h4>Safety & Security</h4>
                            <p>Best practices for meeting other users and coordinating safe item returns on campus.</p>
                        </div>
                    </div>

                    <div class="mt-5 text-center">
                        <p>Can't find what you're looking for?</p>
                        <a href="${pageContext.request.contextPath}/contact" class="btn btn-primary rounded-pill px-4">Contact Support</a>
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
