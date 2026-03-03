<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Dashboard | CampusFinder</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .dashboard-container {
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
        
        .welcome-section {
            margin-bottom: 2rem;
        }
        
        .welcome-title {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.25rem;
        }
        
        .welcome-subtitle {
            color: var(--text-secondary);
        }
        
        .quick-actions {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }
        
        .quick-action-btn {
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-lost {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .btn-lost:hover {
            background: linear-gradient(135deg, #fecaca, #fee2e2);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);
        }
        
        .btn-found {
            background: linear-gradient(135deg, #dcfce7, #bbf7d0);
            color: #166534;
        }
        
        .btn-found:hover {
            background: linear-gradient(135deg, #bbf7d0, #dcfce7);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.2);
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: var(--bg-white);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }
        
        .stat-card:hover::before {
            opacity: 1;
        }
        
        .stat-icon {
            width: 50px;
            height: 50px;
            background: var(--primary-soft);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            line-height: 1.2;
            margin-bottom: 0.25rem;
        }
        
        .stat-label {
            color: var(--text-secondary);
            font-weight: 500;
            font-size: 0.9rem;
        }
        
        .recent-activity {
            background: var(--bg-white);
            border-radius: 20px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
        }
        
        .activity-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--border-light);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .activity-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text-primary);
            margin: 0;
        }
        
        .view-all {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }
        
        .view-all:hover {
            color: var(--secondary);
        }
        
        .activity-list {
            padding: 1rem;
        }
        
        .activity-item {
            display: flex;
            align-items: center;
            padding: 1rem;
            border-bottom: 1px solid var(--border-light);
            transition: all 0.3s ease;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-item:hover {
            background: var(--bg-light);
            transform: translateX(5px);
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            background: var(--primary-soft);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            margin-right: 1rem;
        }
        
        .activity-content {
            flex: 1;
        }
        
        .activity-text {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.25rem;
        }
        
        .activity-time {
            color: var(--text-muted);
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
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
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 576px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .quick-actions {
                flex-direction: column;
            }
            
            .quick-action-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body class="dashboard-container">
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

                <a href="${pageContext.request.contextPath}/dashboard" class="sidebar-link active">
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
                <a href="${pageContext.request.contextPath}/profile" class="sidebar-link">
                    <i class="bi bi-person"></i> Profile
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="sidebar-link text-danger">
                    <i class="bi bi-box-arrow-left"></i> Sign Out
                </a>
            </nav>

            <!-- Main Content Area -->
            <main class="col-md-9 ms-sm-auto col-lg-10 p-0 main-content">
                <div class="welcome-section" data-aos="fade-up">
                    <h1 class="welcome-title">Welcome back, ${loggedInUser.fullName.split(' ')[0]}!</h1>
                    <p class="welcome-subtitle">Here's what's happening with your lost & found items.</p>
                </div>

                <!-- Quick Actions -->
                <div class="quick-actions" data-aos="fade-up" data-aos-delay="100">
                    <a href="/report-item?type=lost" class="quick-action-btn btn-lost">
                        <i class="bi bi-flag-fill"></i>
                        Report Lost Item
                    </a>
                    <a href="/report-item?type=found" class="quick-action-btn btn-found">
                        <i class="bi bi-gift-fill"></i>
                        Report Found Item
                    </a>
                </div>

                <!-- Stats Cards -->
                <div class="stats-grid" data-aos="fade-up" data-aos-delay="200">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="bi bi-file-earmark-text"></i>
                        </div>
                        <div class="stat-value">${lostCount}</div>
                        <div class="stat-label">Active Lost Reports</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #10b981; background: rgba(16, 185, 129, 0.1);">
                            <i class="bi bi-box-seam"></i>
                        </div>
                        <div class="stat-value">${foundCount}</div>
                        <div class="stat-label">Items Handed In</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #f59e0b; background: rgba(245, 158, 11, 0.1);">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <div class="stat-value">${claimCount}</div>
                        <div class="stat-label">Pending Claims</div>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="recent-activity" data-aos="fade-up" data-aos-delay="300">
                    <div class="activity-header">
                        <h5 class="activity-title">
                            <i class="bi bi-clock-history text-primary me-2"></i>
                            Recent Activity
                        </h5>
                        <a href="/my-items" class="view-all">View All <i class="bi bi-arrow-right"></i></a>
                    </div>
                    
                    <div class="activity-list">
                        <c:choose>
                            <c:when test="${not empty recentActivities}">
                                <c:forEach var="activity" items="${recentActivities}">
                                    <div class="activity-item">
                                        <div class="activity-icon">
                                            <i class="bi ${activity.type == 'LOST' ? 'bi-search' : (activity.type == 'FOUND' ? 'bi-gift' : 'bi-shield-check')}"></i>
                                        </div>
                                        <div class="activity-content">
                                            <div class="activity-text">${activity.description}</div>
                                            <div class="activity-time">
                                                <i class="bi bi-clock"></i>
                                                ${activity.time}
                                            </div>
                                        </div>
                                        <span class="badge 
                                            ${activity.type == 'LOST' ? 'bg-danger' : (activity.type == 'FOUND' ? 'bg-success' : 'bg-primary')} 
                                            bg-opacity-10 
                                            ${activity.type == 'LOST' ? 'text-danger' : (activity.type == 'FOUND' ? 'text-success' : 'text-primary')} 
                                            px-3 py-2 rounded-pill">
                                            ${activity.type}
                                        </span>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5">
                                    <i class="bi bi-activity fs-1 text-muted mb-3 d-block"></i>
                                    <p class="text-secondary">No recent activity to show.</p>
                                    <a href="/items" class="btn btn-primary btn-sm px-4">Browse Items</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Tips Card -->
                <div class="alert alert-primary bg-opacity-10 border-primary border-opacity-25 text-primary rounded-4 mt-4" data-aos="fade-up" data-aos-delay="400">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-lightbulb-fill fs-4 me-3"></i>
                        <div>
                            <strong>Pro Tip:</strong> Add clear photos and detailed descriptions to your reports. Items with photos are 3x more likely to be recovered!
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
    </script>
</body>
</html>