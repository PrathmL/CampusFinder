<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Privacy Policy | CampusFinder</title>
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
        
        .policy-content h3 {
            color: var(--text-primary);
            font-weight: 700;
            margin-top: 2rem;
            margin-bottom: 1rem;
            font-size: 1.4rem;
        }
        
        .policy-content p {
            margin-bottom: 1.5rem;
        }
        
        .policy-content ul {
            margin-bottom: 1.5rem;
            padding-left: 1.5rem;
        }
        
        .policy-content ul li {
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
                <a href="javascript:history.back()" class="back-link">
                    <i class="bi bi-arrow-left"></i> Back to Registration
                </a>
                
                <h1 class="auth-title">Privacy Policy</h1>
                
                <div class="policy-content">
                    <p>Last updated: February 2026</p>
                    <p>At CampusFinder, we take your privacy seriously. This policy describes how we collect, use, and handle your information when you use our platform.</p>

                    <h3>1. Information We Collect</h3>
                    <p>We collect information you provide directly to us when you create an account, report an item, or claim an item. This includes:</p>
                    <ul>
                        <li>Full Name</li>
                        <li>University Email Address (.edu)</li>
                        <li>Item descriptions and photos</li>
                        <li>Location data related to items</li>
                    </ul>

                    <h3>2. How We Use Information</h3>
                    <p>We use the information we collect to provide, maintain, and improve our services, including to:</p>
                    <ul>
                        <li>Facilitate the return of lost items to their rightful owners.</li>
                        <li>Verify that users are part of the academic community via .edu emails.</li>
                        <li>Communicate with you about claims and reports.</li>
                        <li>Prevent fraud and unauthorized access.</li>
                    </ul>

                    <h3>3. Information Sharing</h3>
                    <p>We do not sell your personal information. We only share information necessary to facilitate item returns:</p>
                    <ul>
                        <li>Displaying your name on items you report.</li>
                        <li>Sharing necessary contact details with verified claimants once approved by an admin.</li>
                    </ul>

                    <h3>4. Data Security</h3>
                    <p>We use industry-standard security measures to protect your data. However, no method of transmission over the Internet is 100% secure, and we cannot guarantee absolute security.</p>

                    <h3>5. Your Rights</h3>
                    <p>You can access and update your profile information at any time through the dashboard. If you wish to delete your account, please contact our support team.</p>
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
