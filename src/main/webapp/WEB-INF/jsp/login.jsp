<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login | CampusFinder - Academic Lost & Found</title>
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
            padding: 100px 0;
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
            padding: 3rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-light);
            position: relative;
            z-index: 2;
            transition: transform 0.3s ease;
        }
        
        .auth-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }
        
        .auth-icon {
            width: 80px;
            height: 80px;
            background: var(--gradient-primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            font-size: 2.5rem;
            box-shadow: var(--shadow-md);
        }
        
        .auth-title {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }
        
        .auth-subtitle {
            color: var(--text-secondary);
            margin-bottom: 2rem;
        }
        
        .form-floating {
            margin-bottom: 1.5rem;
        }
        
        .form-floating > .form-control {
            border: 2px solid var(--border-light);
            border-radius: 15px;
            height: 60px;
            padding: 1rem 1rem 1rem 3rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-floating > .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(42, 111, 151, 0.1);
        }
        
        .form-floating > label {
            padding-left: 3rem;
            color: var(--text-muted);
            font-weight: 500;
        }
        
        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            font-size: 1.2rem;
            z-index: 10;
        }
        
        .auth-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        
        .form-check-input {
            width: 1.2rem;
            height: 1.2rem;
            margin-right: 0.5rem;
            border: 2px solid var(--border-light);
            cursor: pointer;
        }
        
        .form-check-input:checked {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .form-check-label {
            color: var(--text-secondary);
            font-weight: 500;
            cursor: pointer;
        }
        
        .forgot-link {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .forgot-link:hover {
            color: var(--secondary);
            text-decoration: underline;
        }
        
        .btn-auth {
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 15px;
            padding: 1rem;
            font-weight: 700;
            font-size: 1.1rem;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
            margin-bottom: 1.5rem;
        }
        
        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }
        
        .auth-footer {
            text-align: center;
            color: var(--text-secondary);
        }
        
        .auth-footer a {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
            border-bottom: 2px solid transparent;
            transition: all 0.3s ease;
        }
        
        .auth-footer a:hover {
            color: var(--secondary);
            border-bottom-color: var(--secondary);
        }
        
        .alert-custom {
            border-radius: 15px;
            padding: 1rem;
            margin-bottom: 2rem;
            border: none;
            font-weight: 500;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .alert-success {
            background: linear-gradient(135deg, #dcfce7, #bbf7d0);
            color: #166534;
        }
        
        @media (max-width: 768px) {
            .auth-card {
                padding: 2rem;
            }
            
            .auth-title {
                font-size: 1.75rem;
            }
            
            .auth-options {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
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
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="auth-card" data-aos="fade-up" data-aos-duration="800">
                        <div class="auth-icon">
                            <i class="bi bi-person-lock"></i>
                        </div>
                        
                        <h2 class="auth-title text-center">Welcome Back!</h2>
                        <p class="auth-subtitle text-center">Please login to access your academic account.</p>

                        <c:if test="${not empty error}">
                            <div class="alert-custom alert-danger">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                ${error}
                            </div>
                        </c:if>

                        <c:if test="${not empty message}">
                            <div class="alert-custom alert-success">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                ${message}
                            </div>
                        </c:if>

                        <form action="/login-process" method="POST">
                            <div class="form-floating position-relative">
                                <i class="bi bi-envelope input-icon"></i>
                                <input type="email" 
                                       name="email" 
                                       class="form-control" 
                                       id="emailInput"
                                       placeholder="name@example.com"
                                       required>
                                <label for="emailInput">Email Address</label>
                            </div>
                            
                            <div class="form-floating position-relative">
                                <i class="bi bi-lock input-icon"></i>
                                <input type="password" 
                                       name="password" 
                                       class="form-control" 
                                       id="passwordInput"
                                       placeholder="Password"
                                       required>
                                <label for="passwordInput">Password</label>
                            </div>
                            
                            <div class="auth-options">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">
                                        Remember me
                                    </label>
                                </div>
                                <a href="#" class="forgot-link">
                                    <i class="bi bi-question-circle me-1"></i>
                                    Forgot Password?
                                </a>
                            </div>
                            
                            <button type="submit" class="btn-auth">
                                <i class="bi bi-box-arrow-in-right me-2"></i>
                                Login to Dashboard
                            </button>
                            
                            <div class="auth-footer">
                                Don't have an account? 
                                <a href="${pageContext.request.contextPath}/register">
                                    Create Account <i class="bi bi-arrow-right ms-1"></i>
                                </a>
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
        
        // Add floating label animation
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', () => {
                input.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', () => {
                if (!input.value) {
                    input.parentElement.classList.remove('focused');
                }
            });
        });
    </script>
</body>
</html>