<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Claims | CampusFinder</title>
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
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
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
        
        .claims-timeline {
            background: var(--bg-white);
            border-radius: 30px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-lg);
            overflow: hidden;
        }
        
        .timeline-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--border-light);
            background: linear-gradient(135deg, var(--primary-soft), var(--secondary-light));
        }
        
        .timeline-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-primary);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .timeline {
            padding: 2rem;
        }
        
        .timeline-item {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 2rem;
            position: relative;
        }
        
        .timeline-item:last-child {
            margin-bottom: 0;
        }
        
        .timeline-item::before {
            content: '';
            position: absolute;
            left: 35px;
            top: 50px;
            bottom: -30px;
            width: 2px;
            background: var(--border-light);
        }
        
        .timeline-item:last-child::before {
            display: none;
        }
        
        .timeline-icon {
            width: 70px;
            height: 70px;
            background: var(--bg-white);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.8rem;
            box-shadow: var(--shadow-md);
            z-index: 2;
            border: 2px solid var(--bg-white);
        }
        
        .timeline-icon.pending {
            background: linear-gradient(135deg, #f59e0b, #d97706);
        }
        
        .timeline-icon.approved {
            background: linear-gradient(135deg, #10b981, #059669);
        }
        
        .timeline-icon.rejected {
            background: linear-gradient(135deg, #ef4444, #dc2626);
        }
        
        .timeline-content {
            flex: 1;
            background: var(--bg-light);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid var(--border-light);
        }
        
        .timeline-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .timeline-item-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-primary);
            margin: 0;
        }
        
        .timeline-status {
            padding: 0.5rem 1.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .timeline-status.pending {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            color: #92400e;
        }
        
        .timeline-status.approved {
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            color: #065f46;
        }
        
        .timeline-status.rejected {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .timeline-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1rem;
        }
        
        .detail-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-secondary);
            font-size: 0.95rem;
        }
        
        .detail-item i {
            color: var(--primary);
            width: 20px;
        }
        
        .proof-section {
            background: var(--bg-white);
            border-radius: 12px;
            padding: 1rem;
            margin-top: 1rem;
        }
        
        .proof-title {
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .proof-text {
            color: var(--text-secondary);
            font-size: 0.95rem;
            line-height: 1.5;
        }
        
        .empty-state {
            background: var(--bg-white);
            border-radius: 30px;
            padding: 4rem;
            text-align: center;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
        }
        
        .empty-icon {
            font-size: 4rem;
            color: var(--text-light);
            margin-bottom: 1.5rem;
        }
        
        .empty-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }
        
        .empty-text {
            color: var(--text-secondary);
            margin-bottom: 2rem;
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
            
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .timeline-item {
                flex-direction: column;
                gap: 1rem;
            }
            
            .timeline-item::before {
                display: none;
            }
            
            .timeline-icon {
                margin-left: auto;
                margin-right: auto;
            }
            
            .timeline-header-row {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .timeline-details {
                grid-template-columns: 1fr;
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

                <a href="${pageContext.request.contextPath}/dashboard" class="sidebar-link">
                    <i class="bi bi-grid"></i> Overview
                </a>
                <a href="${pageContext.request.contextPath}/my-items?status=LOST" class="sidebar-link">
                    <i class="bi bi-search"></i> Lost Reports
                </a>
                <a href="${pageContext.request.contextPath}/my-items?status=FOUND" class="sidebar-link">
                    <i class="bi bi-gift"></i> Found Reports
                </a>
                <a href="${pageContext.request.contextPath}/my-claims" class="sidebar-link active">
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
                <div class="page-header" data-aos="fade-up">
                    <h1 class="page-title">My Claims</h1>
                    <p class="page-subtitle">Track the status of all your submitted claims.</p>
                </div>

                <!-- Stats Cards -->
                <div class="stats-grid" data-aos="fade-up" data-aos-delay="100">
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #f59e0b; background: rgba(245, 158, 11, 0.1);">
                            <i class="bi bi-clock-history"></i>
                        </div>
                        <div class="stat-value">${pendingCount}</div>
                        <div class="stat-label">Pending Claims</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #10b981; background: rgba(16, 185, 129, 0.1);">
                            <i class="bi bi-check-circle"></i>
                        </div>
                        <div class="stat-value">${approvedCount}</div>
                        <div class="stat-label">Approved Claims</div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-icon" style="color: #ef4444; background: rgba(239, 68, 68, 0.1);">
                            <i class="bi bi-x-circle"></i>
                        </div>
                        <div class="stat-value">${rejectedCount}</div>
                        <div class="stat-label">Rejected Claims</div>
                    </div>
                </div>

                <!-- My Lost Items (Items I want to find) -->
                <div class="mb-5" data-aos="fade-up" data-aos-delay="150">
                    <div class="d-flex align-items-center mb-4">
                        <div class="bg-danger bg-opacity-10 p-2 rounded-3 me-3">
                            <i class="bi bi-search text-danger fs-4"></i>
                        </div>
                        <h4 class="fw-bold mb-0">My Lost Reports</h4>
                    </div>
                    
                    <div class="row g-4">
                        <c:forEach var="lostItem" items="${myLostItems}">
                            <div class="col-md-6 col-lg-4">
                                <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden">
                                    <div class="card-body p-4">
                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                            <h5 class="fw-bold text-primary mb-0">${lostItem.title}</h5>
                                            <span class="badge bg-danger bg-opacity-10 text-danger rounded-pill px-3">LOST</span>
                                        </div>
                                        <div class="text-secondary small mb-3">
                                            <i class="bi bi-geo-alt me-1"></i>${lostItem.location}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${empty myLostItems}">
                            <div class="col-12">
                                <div class="alert alert-light border-dashed rounded-4 p-4 text-center">
                                    <p class="text-muted mb-0">No active lost reports.</p>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>

                <hr class="my-5">

                <!-- Claims Timeline -->
                <c:choose>
                    <c:when test="${not empty claims}">
                        <div class="claims-timeline" data-aos="fade-up" data-aos-delay="200">
                            <div class="timeline-header">
                                <h5 class="timeline-title">
                                    <i class="bi bi-clock-history"></i>
                                    Claim History
                                </h5>
                            </div>
                            
                            <div class="timeline">
                                <c:forEach var="claim" items="${claims}">
                                    <div class="timeline-item">
                                        <div class="timeline-icon ${claim.status == 'PENDING' ? 'pending' : (claim.status == 'APPROVED' ? 'approved' : 'rejected')}">
                                            <i class="bi ${claim.status == 'PENDING' ? 'bi-clock' : (claim.status == 'APPROVED' ? 'bi-check' : 'bi-x')}"></i>
                                        </div>
                                        
                                        <div class="timeline-content">
                                            <div class="timeline-header-row">
                                                <h6 class="timeline-item-title">${claim.item.title}</h6>
                                                <span class="timeline-status ${claim.status == 'PENDING' ? 'pending' : (claim.status == 'APPROVED' ? 'approved' : 'rejected')}">
                                                    <i class="bi bi-circle-fill" style="font-size: 0.5rem;"></i>
                                                    ${claim.status}
                                                </span>
                                            </div>
                                            
                                            <div class="timeline-details">
                                                <div class="detail-item">
                                                    <i class="bi bi-tag"></i>
                                                    <span>${claim.item.category}</span>
                                                </div>
                                                <div class="detail-item">
                                                    <i class="bi bi-geo-alt"></i>
                                                    <span>${claim.item.location}</span>
                                                </div>
                                                <div class="detail-item">
                                                    <i class="bi bi-calendar3"></i>
                                                    <span>Submitted: ${claim.createdAt}</span>
                                                </div>
                                                <div class="detail-item">
                                                    <i class="bi bi-clock"></i>
                                                    <span>Last updated: ${claim.updatedAt}</span>
                                                </div>
                                            </div>
                                            
                                            <div class="proof-section">
                                                <div class="proof-title">
                                                    <i class="bi bi-pencil-square"></i>
                                                    Your Proof of Ownership:
                                                </div>
                                                <div class="proof-text">
                                                    "${claim.proofOfOwnership}"
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:when>
                    
                    <c:otherwise>
                        <div class="empty-state" data-aos="fade-up" data-aos-delay="200">
                            <div class="empty-icon">
                                <i class="bi bi-shield-exclamation"></i>
                            </div>
                            <h3 class="empty-title">No Claims Yet</h3>
                            <p class="empty-text">You haven't submitted any claims for found items yet.</p>
                            <a href="/items" class="btn btn-primary rounded-pill px-5 py-3">
                                <i class="bi bi-search me-2"></i>
                                Browse Found Items
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
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