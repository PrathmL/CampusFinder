<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Terms & Conditions | CampusFinder</title>
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
                
                <h1 class="auth-title">Terms & Conditions</h1>
                
                <div class="policy-content">
                    <p>Last updated: February 2026</p>
                    <p>By using CampusFinder, you agree to comply with and be bound by the following terms and conditions of use.</p>

                    <h3>1. Acceptance of Terms</h3>
                    <p>The service is provided to you subject to your acceptance of these Terms. If you do not agree to all of these Terms, do not use this platform.</p>

                    <h3>2. Eligibility</h3>
                    <p>You must be a student, faculty member, or staff member of a recognized educational institution with a valid .edu email address to register for and use this service.</p>

                    <h3>3. User Conduct</h3>
                    <p>You agree to use CampusFinder only for lawful purposes. You are prohibited from:</p>
                    <ul>
                        <li>Posting false or misleading information about lost or found items.</li>
                        <li>Attempting to claim items that do not belong to you (fraudulent claims).</li>
                        <li>Harassing or stalking other users.</li>
                        <li>Uploading malicious software or code.</li>
                    </ul>

                    <h3>4. Item Claims and Returns</h3>
                    <p>CampusFinder is a platform to facilitate the discovery of lost items. We do not guarantee the return of any item and are not responsible for the condition of items found or returned through the platform.</p>

                    <h3>5. Termination</h3>
                    <p>We reserve the right to suspend or terminate your account at our discretion, without notice, for conduct that we believe violates these Terms or is harmful to other users of the platform.</p>

                    <h3>6. Limitation of Liability</h3>
                    <p>CampusFinder and its administrators shall not be liable for any direct, indirect, incidental, or consequential damages resulting from the use or inability to use the service.</p>
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
