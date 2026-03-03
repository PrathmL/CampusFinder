<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Item Directory | CampusFinder</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .directory-container {
            background: var(--bg-light);
            min-height: 100vh;
            padding: 100px 3rem 3rem;
        }
        
        .page-header {
            margin-bottom: 3rem;
            position: relative;
        }
        
        .page-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }
        
        .page-subtitle {
            color: var(--text-secondary);
            font-size: 1.1rem;
        }
        
        .header-actions {
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            display: flex;
            gap: 1rem;
        }
        
        .filter-section {
            background: var(--bg-white);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            margin-bottom: 2rem;
        }
        
        .filter-title {
            font-size: 1rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 1rem;
        }
        
        .filter-badges {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        
        .filter-badge {
            padding: 0.5rem 1.5rem;
            border-radius: 50px;
            background: var(--bg-light);
            color: var(--text-secondary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border: 1px solid var(--border-light);
        }
        
        .filter-badge:hover,
        .filter-badge.active {
            background: var(--gradient-primary);
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
            border-radius: 24px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .item-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-hover);
        }
        
        .item-image {
            height: 200px;
            position: relative;
            overflow: hidden;
        }
        
        .item-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }
        
        .item-card:hover .item-image img {
            transform: scale(1.1);
        }
        
        .item-image-placeholder {
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-soft), var(--secondary-light));
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 3rem;
        }
        
        .item-status {
            position: absolute;
            top: 1rem;
            right: 1rem;
            padding: 0.5rem 1.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.9rem;
            z-index: 2;
            box-shadow: var(--shadow-md);
        }
        
        .status-lost {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
        }
        
        .status-found {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
        }
        
        .item-content {
            padding: 1.5rem;
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        
        .item-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }
        
        .item-description {
            color: var(--text-secondary);
            font-size: 0.9rem;
            margin-bottom: 1rem;
            line-height: 1.5;
            flex: 1;
        }
        
        .item-details {
            background: var(--bg-light);
            border-radius: 12px;
            padding: 1rem;
            margin-bottom: 1rem;
        }
        
        .detail-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-secondary);
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }
        
        .detail-item:last-child {
            margin-bottom: 0;
        }
        
        .detail-item i {
            color: var(--primary);
            width: 20px;
        }
        
        .btn-claim {
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0.75rem;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-claim:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(42, 111, 151, 0.3);
            color: white;
        }
        
        .btn-disabled {
            background: var(--bg-light);
            color: var(--text-muted);
            border: 1px solid var(--border-light);
            border-radius: 12px;
            padding: 0.75rem;
            font-weight: 600;
            width: 100%;
            cursor: not-allowed;
            text-align: center;
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
            .directory-container {
                padding: 80px 1.5rem 1.5rem;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .header-actions {
                position: static;
                transform: none;
                margin-top: 1rem;
            }
        }
        
        @media (max-width: 768px) {
            .items-grid {
                grid-template-columns: 1fr;
            }
            
            .filter-badges {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="directory-container">
        <div class="page-header" data-aos="fade-up">
            <h1 class="page-title">Item Directory</h1>
            <p class="page-subtitle">Browse verified lost and found belongings on campus.</p>
            
            <div class="header-actions">
                <a href="/report-item?type=lost" class="btn btn-outline-danger fw-bold rounded-pill px-4 py-2">
                    <i class="bi bi-flag-fill me-2"></i>Report Lost
                </a>
                <a href="/report-item?type=found" class="btn btn-success fw-bold rounded-pill px-4 py-2">
                    <i class="bi bi-gift-fill me-2"></i>Report Found
                </a>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-section" data-aos="fade-up" data-aos-delay="100">
            <div class="filter-title">Filter by Status</div>
            <div class="filter-badges">
                <a href="/items" class="filter-badge ${param.status == null ? 'active' : ''}">All Items</a>
                <a href="/items?status=LOST" class="filter-badge ${param.status == 'LOST' ? 'active' : ''}">Lost</a>
                <a href="/items?status=FOUND" class="filter-badge ${param.status == 'FOUND' ? 'active' : ''}">Found</a>
            </div>
        </div>

        <!-- Items Grid -->
        <c:choose>
            <c:when test="${not empty items}">
                <div class="items-grid">
                    <c:forEach var="item" items="${items}">
                        <div class="item-card" data-aos="fade-up" data-aos-delay="200">
                            <div class="item-image">
                                <c:choose>
                                    <c:when test="${not empty item.imagePath}">
                                        <img src="/uploads/${item.imagePath}" alt="${item.title}">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="item-image-placeholder">
                                            <i class="bi bi-image"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <span class="item-status ${item.status == 'LOST' ? 'status-lost' : 'status-found'}">
                                    ${item.status}
                                </span>
                            </div>
                            
                            <div class="item-content">
                                <h3 class="item-title">${item.title}</h3>
                                <p class="item-description">${item.description}</p>
                                
                                <div class="item-details">
                                    <div class="detail-item">
                                        <i class="bi bi-geo-alt-fill"></i>
                                        <span><strong>Location:</strong> ${item.location}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="bi bi-tag-fill"></i>
                                        <span><strong>Category:</strong> ${item.category}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="bi bi-person-fill"></i>
                                        <span><strong>Reported By:</strong> ${item.user.fullName}</span>
                                    </div>
                                    <div class="detail-item">
                                        <i class="bi bi-calendar3"></i>
                                        <span><strong>Reported:</strong> ${item.createdAt}</span>
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${item.status.equalsIgnoreCase('CLAIMED')}">
                                        <div class="btn-disabled">
                                            <i class="bi bi-lock me-2"></i>
                                            ITEM RECOVERED
                                        </div>
                                    </c:when>
                                    <%-- Show claim button only if:
                                         1. Item is FOUND
                                         2. User is logged in
                                         3. Item was NOT reported by the logged-in user
                                         4. User has reported something LOST in the same category --%>
                                    <c:when test="${item.status.equalsIgnoreCase('FOUND') && not empty loggedInUser && (item.user == null || item.user.id != loggedInUser.id) && userLostCategories.contains(item.category)}">
                                        <a href="/claim-item/${item.id}" class="btn-claim">
                                            <i class="bi bi-shield-check me-2"></i>
                                            Claim Ownership
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="btn-disabled">
                                            <i class="bi bi-check-circle me-2"></i>
                                            ${item.status.toUpperCase()} REPORT FILED
                                        </div>
                                    </c:otherwise>
                                </c:choose>
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
                    <h3 class="empty-title">No Items Found</h3>
                    <p class="empty-text">There are currently no items in the directory. Be the first to report an item!</p>
                    <div class="d-flex gap-3 justify-content-center">
                        <!-- <a href="/report-item?type=lost" class="btn btn-outline-danger rounded-pill px-4 py-2">
                            <i class="bi bi-flag-fill me-2"></i>Report Lost
                        </a> -->
                        <!-- <a href="/report-item?type=found" class="btn btn-success rounded-pill px-4 py-2">
                            <i class="bi bi-gift-fill me-2"></i>Report Found
                        </a> -->
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>