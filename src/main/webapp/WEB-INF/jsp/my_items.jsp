<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Reported Items | CampusFinder</title>
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
        
        .status-tabs {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            border-bottom: 1px solid var(--border-light);
            padding-bottom: 1rem;
        }
        
        .status-tab {
            padding: 0.75rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .status-tab.lost {
            background: var(--bg-light);
            color: #991b1b;
            border: 1px solid #fecaca;
        }
        
        .status-tab.lost:hover,
        .status-tab.lost.active {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            border-color: transparent;
        }
        
        .status-tab.found {
            background: var(--bg-light);
            color: #166534;
            border: 1px solid #bbf7d0;
        }
        
        .status-tab.found:hover,
        .status-tab.found.active {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            border-color: transparent;
        }
        
        .items-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 1.5rem;
        }
        
        .item-card {
            background: var(--bg-white);
            border-radius: 20px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .item-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }
        
        .item-header {
            padding: 1rem;
            background: linear-gradient(135deg, var(--primary-soft), var(--secondary-light));
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .item-thumb {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            object-fit: cover;
            border: 2px solid var(--bg-white);
        }
        
        .item-thumb-placeholder {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background: var(--bg-white);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 1.5rem;
            border: 2px solid var(--bg-white);
        }
        
        .item-header-info {
            flex: 1;
        }
        
        .item-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.25rem;
        }
        
        .item-id {
            color: var(--text-secondary);
            font-size: 0.8rem;
        }
        
        .item-body {
            padding: 1.5rem;
        }
        
        .item-detail {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 0.75rem;
            color: var(--text-secondary);
            font-size: 0.95rem;
        }
        
        .item-detail i {
            color: var(--primary);
            width: 20px;
        }
        
        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.85rem;
            margin-top: 1rem;
        }
        
        .status-badge.lost {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .status-badge.found {
            background: linear-gradient(135deg, #dcfce7, #bbf7d0);
            color: #166534;
        }
        
        .status-badge.claimed {
            background: linear-gradient(135deg, #dbeafe, #bfdbfe);
            color: #1e40af;
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
        
        .quick-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
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
            
            .items-grid {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .status-tabs {
                flex-direction: column;
            }
            
            .status-tab {
                width: 100%;
                justify-content: center;
            }
            
            .quick-actions {
                flex-direction: column;
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
                <a href="${pageContext.request.contextPath}/my-items?status=LOST" class="sidebar-link ${statusType == 'LOST' ? 'active' : ''}">
                    <i class="bi bi-search"></i> Lost Reports
                </a>
                <a href="${pageContext.request.contextPath}/my-items?status=FOUND" class="sidebar-link ${statusType == 'FOUND' ? 'active' : ''}">
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
                <div class="page-header" data-aos="fade-up">
                    <h1 class="page-title">My ${statusType == 'LOST' ? 'Lost' : 'Found'} Items</h1>
                    <p class="page-subtitle">Manage and track all items you've reported to the portal.</p>
                </div>

                <!-- Status Tabs -->
                <div class="status-tabs" data-aos="fade-up" data-aos-delay="100">
                    <a href="/my-items?status=LOST" class="status-tab lost ${statusType == 'LOST' ? 'active' : ''}">
                        <i class="bi bi-search"></i>
                        Lost Items
                    </a>
                    <a href="/my-items?status=FOUND" class="status-tab found ${statusType == 'FOUND' ? 'active' : ''}">
                        <i class="bi bi-gift"></i>
                        Found Items
                    </a>
                </div>

                <!-- Items Grid -->
                <c:choose>
                    <c:when test="${not empty items}">
                        <div class="items-grid" data-aos="fade-up" data-aos-delay="200">
                            <c:forEach var="item" items="${items}">
                                <div class="item-card">
                                    <div class="item-header">
                                        <c:choose>
                                            <c:when test="${not empty item.imagePath}">
                                                <img src="/uploads/${item.imagePath}" class="item-thumb" alt="Item">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="item-thumb-placeholder">
                                                    <i class="bi bi-image"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="item-header-info">
                                            <div class="item-title">${item.title}</div>
                                            <div class="item-id">ID: #${item.id}</div>
                                        </div>
                                    </div>
                                    
                                    <div class="item-body">
                                        <div class="item-detail">
                                            <i class="bi bi-geo-alt-fill"></i>
                                            <span>${item.location}</span>
                                        </div>
                                        <div class="item-detail">
                                            <i class="bi bi-tag-fill"></i>
                                            <span>${item.category}</span>
                                        </div>
                                        <div class="item-detail">
                                            <i class="bi bi-calendar3"></i>
                                            <span>Reported: ${item.createdAt}</span>
                                        </div>
                                        
                                        <div class="status-badge ${item.status == 'LOST' ? 'lost' : (item.status == 'FOUND' ? 'found' : 'claimed')}">
                                            <i class="bi bi-circle-fill me-1" style="font-size: 0.5rem;"></i>
                                            ${item.status}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    
                    <c:otherwise>
                        <div class="empty-state" data-aos="fade-up" data-aos-delay="200">
                            <div class="empty-icon">
                                <i class="bi bi-inboxes"></i>
                            </div>
                            <h3 class="empty-title">No ${statusType == 'LOST' ? 'Lost' : 'Found'} Items</h3>
                            <p class="empty-text">You haven't reported any ${statusType.toLowerCase()} items yet.</p>
                            <div class="quick-actions">
                                <a href="/report-item?type=lost" class="btn btn-outline-danger rounded-pill px-4 py-2">
                                    <i class="bi bi-flag-fill me-2"></i>Report Lost
                                </a>
                                <a href="/report-item?type=found" class="btn btn-success rounded-pill px-4 py-2">
                                    <i class="bi bi-gift-fill me-2"></i>Report Found
                                </a>
                            </div>
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