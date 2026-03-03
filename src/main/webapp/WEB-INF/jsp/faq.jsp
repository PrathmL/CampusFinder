<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Frequently Asked Questions | CampusFinder</title>
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
        
        .faq-item {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid var(--border-light);
        }

        .faq-item:last-child {
            border-bottom: none;
        }

        .faq-question {
            color: var(--text-primary);
            font-weight: 700;
            margin-bottom: 0.75rem;
            font-size: 1.2rem;
            display: flex;
            align-items: flex-start;
            gap: 1rem;
        }

        .faq-question i {
            color: var(--primary);
            margin-top: 0.25rem;
        }
        
        .faq-answer {
            padding-left: 2.2rem;
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
                
                <h1 class="auth-title">Frequently Asked Questions</h1>
                
                <div class="policy-content">
                    <div class="faq-item">
                        <div class="faq-question">
                            <i class="bi bi-question-circle-fill"></i>
                            Is this service only for students?
                        </div>
                        <div class="faq-answer">
                            No, CampusFinder is available to all members of the academic community, including students, faculty, and university staff. Anyone with a valid university email address can register.
                        </div>
                    </div>

                    <div class="faq-item">
                        <div class="faq-question">
                            <i class="bi bi-question-circle-fill"></i>
                            How do I report a found item?
                        </div>
                        <div class="faq-answer">
                            Click on the "Report Found" button on the homepage or in the directory. Fill out the form with as much detail as possible and upload a photo. This will make it easier for the owner to identify their property.
                        </div>
                    </div>

                    <div class="faq-item">
                        <div class="faq-question">
                            <i class="bi bi-question-circle-fill"></i>
                            What if I found a high-value item like a wallet or laptop?
                        </div>
                        <div class="faq-answer">
                            For high-value items, we recommend reporting them on CampusFinder and then immediately dropping them off at the Campus Security office or the main library service desk for safe keeping. Please note in your report where you handed it in.
                        </div>
                    </div>

                    <div class="faq-item">
                        <div class="faq-question">
                            <i class="bi bi-question-circle-fill"></i>
                            How long does the verification process take?
                        </div>
                        <div class="faq-answer">
                            Administrators typically review and approve claims within 24-48 hours. You will receive a notification once your claim has been processed.
                        </div>
                    </div>

                    <div class="faq-item">
                        <div class="faq-question">
                            <i class="bi bi-question-circle-fill"></i>
                            Is my contact information visible to everyone?
                        </div>
                        <div class="faq-answer">
                            No. Your privacy is protected. Only your full name is displayed on reports. Your email and phone number (if provided) are only shared with the approved claimant or reporter once an administrator has verified the claim.
                        </div>
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
