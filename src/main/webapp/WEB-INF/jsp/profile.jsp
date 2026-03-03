<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile Settings | CampusFinder</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .profile-container {
            background: var(--bg-light);
            min-height: 100vh;
        }
        
        .sidebar-student {
            background: var(--bg-white);
            border-right: 1px solid var(--border-light);
            min-height: 100vh;
            box-shadow: var(--shadow-sm);
            padding: 2rem 1rem;
            position: sticky;
            top: 0;
        }
        
        .student-profile {
            text-align: center;
            padding-bottom: 2rem;
            border-bottom: 1px solid var(--border-light);
            margin-bottom: 2rem;
        }
        
        .student-avatar {
            width: 100px;
            height: 100px;
            background: var(--gradient-primary);
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: white;
            font-size: 2.5rem;
            font-weight: 700;
            border: 4px solid var(--bg-white);
            box-shadow: var(--shadow-md);
            transition: all 0.3s ease;
        }
        
        .student-avatar:hover {
            transform: scale(1.05) rotate(5deg);
        }
        
        .student-name {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.25rem;
        }
        
        .student-email {
            color: var(--text-secondary);
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }
        
        .student-badge {
            background: var(--primary-soft);
            color: var(--primary);
            padding: 0.25rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            display: inline-block;
        }
        
        .sidebar-link {
            display: flex;
            align-items: center;
            padding: 1rem 1.5rem;
            color: var(--text-secondary);
            text-decoration: none;
            border-radius: 12px;
            margin-bottom: 0.5rem;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .sidebar-link i {
            margin-right: 1rem;
            font-size: 1.2rem;
            width: 24px;
        }
        
        .sidebar-link:hover {
            background: var(--primary-soft);
            color: var(--primary);
            transform: translateX(5px);
        }
        
        .sidebar-link.active {
            background: var(--gradient-primary);
            color: white;
            box-shadow: var(--shadow-md);
        }
        
        .main-content {
            padding: 2rem 3rem;
        }
        
        .page-header {
            margin-bottom: 2rem;
        }
        
        .page-title {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.25rem;
        }
        
        .page-subtitle {
            color: var(--text-secondary);
        }
        
        .profile-card {
            background: var(--bg-white);
            border-radius: 30px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-lg);
            overflow: hidden;
        }
        
        .profile-header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            padding: 3rem;
            text-align: center;
            position: relative;
        }
        
        .profile-avatar-large {
            width: 120px;
            height: 120px;
            background: var(--bg-white);
            border-radius: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: var(--primary);
            font-size: 3rem;
            font-weight: 700;
            border: 4px solid rgba(255, 255, 255, 0.3);
            box-shadow: var(--shadow-lg);
        }
        
        .profile-name {
            font-size: 1.8rem;
            font-weight: 800;
            color: white;
            margin-bottom: 0.25rem;
        }
        
        .profile-role {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .profile-body {
            padding: 3rem;
        }
        
        .form-section {
            margin-bottom: 2rem;
        }
        
        .section-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }
        
        .section-title i {
            color: var(--primary);
            margin-right: 0.5rem;
            font-size: 1.2rem;
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
        
        .form-floating > .form-control[readonly] {
            background: var(--bg-light);
            border-color: var(--border-light);
            color: var(--text-secondary);
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
        
        .info-box {
            background: var(--bg-light);
            border-radius: 12px;
            padding: 1rem;
            color: var(--text-secondary);
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }
        
        .btn-update {
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 15px;
            padding: 1rem 2rem;
            font-weight: 700;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-update:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }
        
        .tip-alert {
            background: linear-gradient(135deg, var(--primary-soft), var(--secondary-light));
            border: none;
            border-radius: 16px;
            padding: 1.5rem;
            color: var(--text-primary);
            margin-top: 2rem;
        }
        
        .tip-alert i {
            color: var(--primary);
            font-size: 1.5rem;
            margin-right: 1rem;
        }
        
        @media (max-width: 992px) {
            .sidebar-student {
                position: fixed;
                left: -100%;
                transition: left 0.3s ease;
                z-index: 1000;
            }
            
            .sidebar-student.show {
                left: 0;
            }
            
            .main-content {
                padding: 2rem 1.5rem;
            }
            
            .profile-header {
                padding: 2rem;
            }
            
            .profile-body {
                padding: 2rem;
            }
        }
        
        @media (max-width: 768px) {
            .profile-name {
                font-size: 1.5rem;
            }
            
            .profile-avatar-large {
                width: 100px;
                height: 100px;
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body class="profile-container">
    <jsp:include page="components/navbar.jsp" />

    <div class="container-fluid">
        <div class="row">
            <!-- Student Sidebar -->
            <nav class="col-md-3 col-lg-2 p-0 sidebar-student">
                <div class="student-profile">
                    <div class="student-avatar">
                        ${loggedInUser.fullName.substring(0,1)}
                    </div>
                    <div class="student-name">${loggedInUser.fullName}</div>
                    <div class="student-email">${loggedInUser.email}</div>
                    <span class="student-badge">
                        <i class="bi bi-mortarboard-fill me-1"></i>Student
                    </span>
                </div>

                <a href="${pageContext.request.contextPath}/dashboard" class="sidebar-link">
                    <i class="bi bi-grid"></i> Overview
                </a>
                <a href="${pageContext.request.contextPath}/my-items?status=LOST" class="sidebar-link">
                    <i class="bi bi-search"></i> Lost Reports
                </a>
                <a href="${pageContext.request.contextPath}/my-items?status=FOUND" class="sidebar-link">
                    <i class="bi bi-gift"></i> Found Reports
                </a>
                <a href="${pageContext.request.contextPath}/my-claims" class="sidebar-link">
                    <i class="bi bi-shield-check"></i> Claim Items
                </a>
                <hr class="my-4">
                <a href="${pageContext.request.contextPath}/profile" class="sidebar-link active">
                    <i class="bi bi-person"></i> Profile
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="sidebar-link text-danger">
                    <i class="bi bi-box-arrow-left"></i> Sign Out
                </a>
            </nav>

            <!-- Main Content Area -->
            <main class="col-md-9 ms-sm-auto col-lg-10 p-0 main-content">
                <div class="page-header" data-aos="fade-up">
                    <h1 class="page-title">Account Profile</h1>
                    <p class="page-subtitle">Manage your personal information and account settings.</p>
                </div>

                <c:if test="${not empty param.success}">
                    <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-4" data-aos="fade-up">
                        <i class="bi bi-check-circle-fill me-2"></i> ${param.success}
                    </div>
                </c:if>

                <!-- Profile Card -->
                <div class="profile-card" data-aos="fade-up" data-aos-delay="100">
                    <div class="profile-header">
                        <div class="profile-avatar-large">
                            ${loggedInUser.fullName.substring(0,1)}
                        </div>
                        <h2 class="profile-name">${loggedInUser.fullName}</h2>
                        <div class="profile-role">
                            <i class="bi bi-shield-check"></i>
                            ${loggedInUser.role == 'ROLE_ADMIN' ? 'Administrator' : 'Student'}
                        </div>
                    </div>
                    
                    <div class="profile-body">
                        <form action="${pageContext.request.contextPath}/profile/update" method="POST">
                            <!-- Personal Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="bi bi-person-circle"></i>
                                    Personal Information
                                </h5>
                                
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-person input-icon"></i>
                                            <input type="text" 
                                                   name="fullName" 
                                                   class="form-control" 
                                                   id="fullNameInput"
                                                   value="${loggedInUser.fullName}" 
                                                   required>
                                            <label for="fullNameInput">Full Name</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-envelope input-icon"></i>
                                            <input type="email" 
                                                   class="form-control" 
                                                   id="emailInput"
                                                   value="${loggedInUser.email}" 
                                                   readonly>
                                            <label for="emailInput">Email Address</label>
                                        </div>
                                        <div class="info-box">
                                            <i class="bi bi-info-circle"></i>
                                            Contact admin to change your university email.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Account Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="bi bi-shield-lock"></i>
                                    Account Information
                                </h5>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-shield-check input-icon"></i>
                                            <input type="text" 
                                                   class="form-control" 
                                                   id="roleInput"
                                                   value="${loggedInUser.role}" 
                                                   readonly>
                                            <label for="roleInput">Account Role</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="form-floating position-relative">
                                            <i class="bi bi-shield-check input-icon"></i>
                                            <input type="text" 
                                                   class="form-control" 
                                                   id="joinedInput"
                                                   value="Active Member" 
                                                   readonly>
                                            <label for="joinedInput">Account Status</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="text-end">
                                <button type="submit" class="btn-update">
                                    <i class="bi bi-check-circle"></i>
                                    Update Profile
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Tip Alert -->
                <div class="tip-alert" data-aos="fade-up" data-aos-delay="200">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-lightbulb-fill"></i>
                        <div>
                            <strong>Pro Tip:</strong> Keep your full name accurate to help administrators verify your claim requests faster. This information is used for identity verification.
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();

        // Mobile sidebar toggle
        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.createElement('button');
            menuToggle.className = 'btn btn-primary d-md-none position-fixed';
            menuToggle.style.cssText = 'bottom: 20px; right: 20px; z-index: 1001; border-radius: 50%; width: 50px; height: 50px;';
            menuToggle.innerHTML = '<i class="bi bi-list"></i>';
            document.body.appendChild(menuToggle);
            
            menuToggle.addEventListener('click', function() {
                document.querySelector('.sidebar-student').classList.toggle('show');
            });
        });

        // Form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const fullName = document.getElementById('fullNameInput').value;
            
            if (fullName.trim().length < 2) {
                e.preventDefault();
                alert('Full name must be at least 2 characters long.');
                return;
            }
        });
    </script>
</body>
</html>