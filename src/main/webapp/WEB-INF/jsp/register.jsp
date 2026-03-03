<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register | CampusFinder - Academic Lost & Found</title>
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
        
        .auth-shape-3 {
            width: 300px;
            height: 300px;
            top: 50%;
            right: 20%;
            background: linear-gradient(135deg, #f39c12, #4a8bb7);
            opacity: 0.2;
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
        
        .password-strength {
            margin-top: 0.5rem;
            height: 5px;
            background: var(--border-light);
            border-radius: 10px;
            overflow: hidden;
        }
        
        .password-strength-bar {
            height: 100%;
            width: 0%;
            transition: all 0.3s ease;
        }
        
        .password-strength-text {
            font-size: 0.8rem;
            margin-top: 0.25rem;
            text-align: right;
            color: var(--text-muted);
        }
        
        .strength-weak { background: #ef4444; width: 33.33%; }
        .strength-medium { background: #f59e0b; width: 66.66%; }
        .strength-strong { background: #10b981; width: 100%; }
        
        .terms-check {
            margin: 1.5rem 0;
        }
        
        .terms-check .form-check-input {
            width: 1.2rem;
            height: 1.2rem;
            margin-right: 0.5rem;
            border: 2px solid var(--border-light);
            cursor: pointer;
        }
        
        .terms-check .form-check-input:checked {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .terms-check .form-check-label {
            color: var(--text-secondary);
            font-weight: 500;
            cursor: pointer;
        }
        
        .terms-link {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .terms-link:hover {
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
        
        .row.g-3 {
            margin-bottom: 0.5rem;
        }
        
        @media (max-width: 768px) {
            .auth-card {
                padding: 2rem;
            }
            
            .auth-title {
                font-size: 1.75rem;
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
            <div class="auth-shape auth-shape-3"></div>
        </div>
        
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-6">
                    <div class="auth-card" data-aos="fade-up" data-aos-duration="800">
                        <div class="auth-icon">
                            <i class="bi bi-person-plus"></i>
                        </div>
                        
                        <h2 class="auth-title text-center">Create Account</h2>
                        <p class="auth-subtitle text-center">Join our academic community and start managing lost & found items.</p>

                        <c:if test="${not empty error}">
                            <div class="alert-custom alert-danger">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                ${error}
                            </div>
                        </c:if>

                        <form action="/register" method="POST" id="registerForm">
                            <div class="form-floating position-relative">
                                <i class="bi bi-person input-icon"></i>
                                <input type="text" 
                                       name="fullName" 
                                       class="form-control" 
                                       id="fullNameInput"
                                       placeholder="Full Name"
                                       required>
                                <label for="fullNameInput">Full Name</label>
                            </div>
                            
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
                            
                            <div class="row g-3">
                                <div class="col-md-6">
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
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-floating position-relative">
                                        <i class="bi bi-shield-lock input-icon"></i>
                                        <input type="password" 
                                               name="confirmPassword" 
                                               class="form-control" 
                                               id="confirmPasswordInput"
                                               placeholder="Confirm Password"
                                               required>
                                        <label for="confirmPasswordInput">Confirm Password</label>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Password Strength Indicator -->
                            <div class="password-strength">
                                <div class="password-strength-bar" id="passwordStrengthBar"></div>
                            </div>
                            <div class="password-strength-text" id="passwordStrengthText">
                                Enter a password
                            </div>
                            
                            <div class="terms-check">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="terms" required>
                                    <label class="form-check-label" for="terms">
                                        I agree to the <a href="${pageContext.request.contextPath}/terms-conditions" class="terms-link">Terms & Conditions</a> and 
                                        <a href="${pageContext.request.contextPath}/privacy-policy" class="terms-link">Privacy Policy</a>
                                    </label>
                                </div>
                            </div>
                            
                            <button type="submit" class="btn-auth" id="submitBtn">
                                <i class="bi bi-person-plus-fill me-2"></i>
                                Create Account
                            </button>
                            
                            <div class="auth-footer">
                                Already have an account? 
                                <a href="${pageContext.request.contextPath}/login">
                                    Login Here <i class="bi bi-arrow-right ms-1"></i>
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
        
        // Password strength checker
        const passwordInput = document.getElementById('passwordInput');
        const strengthBar = document.getElementById('passwordStrengthBar');
        const strengthText = document.getElementById('passwordStrengthText');
        
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = 0;
            
            // Check length
            if (password.length >= 8) strength += 1;
            if (password.length >= 12) strength += 1;
            
            // Check for numbers
            if (/\d/.test(password)) strength += 1;
            
            // Check for special characters
            if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) strength += 1;
            
            // Check for uppercase
            if (/[A-Z]/.test(password)) strength += 1;
            
            // Update bar
            strengthBar.className = 'password-strength-bar';
            if (password.length === 0) {
                strengthBar.style.width = '0%';
                strengthText.textContent = 'Enter a password';
            } else if (strength <= 2) {
                strengthBar.classList.add('strength-weak');
                strengthText.textContent = 'Weak password';
            } else if (strength <= 4) {
                strengthBar.classList.add('strength-medium');
                strengthText.textContent = 'Medium password';
            } else {
                strengthBar.classList.add('strength-strong');
                strengthText.textContent = 'Strong password';
            }
        });
        
        // Password match validation
        const confirmPasswordInput = document.getElementById('confirmPasswordInput');
        const submitBtn = document.getElementById('submitBtn');
        
        function validatePasswords() {
            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;
            
            if (confirmPassword.length > 0) {
                if (password !== confirmPassword) {
                    confirmPasswordInput.setCustomValidity('Passwords do not match');
                } else {
                    confirmPasswordInput.setCustomValidity('');
                }
            }
        }
        
        passwordInput.addEventListener('change', validatePasswords);
        confirmPasswordInput.addEventListener('keyup', validatePasswords);
        
        // Floating label animation
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