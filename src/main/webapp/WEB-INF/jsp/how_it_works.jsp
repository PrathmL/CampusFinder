<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>How It Works | CampusFinder</title>
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
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .step-num {
            width: 35px;
            height: 35px;
            background: var(--gradient-primary);
            color: white;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
        }
        
        .policy-content p {
            margin-bottom: 1.5rem;
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
                
                <h1 class="auth-title">How It Works</h1>
                
                <div class="policy-content">
                    <p class="text-center mb-5">CampusFinder makes it easy to recover lost items or return found belongings within our academic community. Here is how our process works.</p>

                    <h3><span class="step-num">1</span> Report Your Item</h3>
                    <p>Whether you've lost something or found something that doesn't belong to you, start by filing a report. Provide a clear title, category, location where it was lost/found, and a detailed description. Uploading a photo significantly increases the chances of a successful match.</p>

                    <h3><span class="step-num">2</span> Smart Matching</h3>
                    <p>Our system automatically cross-references new reports. If you're reporting a lost item, we'll show you potential matches from our "Found" database. Our administrators also review reports daily to ensure accuracy.</p>

                    <h3><span class="step-num">3</span> Verify Ownership</h3>
                    <p>When a potential match is identified, the owner must provide specific details or proof of ownership that wasn't mentioned in the public description. This ensures that items are only returned to their rightful owners.</p>

                    <h3><span class="step-num">4</span> Secure Return</h3>
                    <p>Once an administrator approves a claim, we facilitate a safe exchange. For high-value items, we coordinate returns through the campus security office or student union service desk.</p>
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
