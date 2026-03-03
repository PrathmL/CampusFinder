<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Items | Admin Panel</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .admin-container {
            background: var(--bg-light);
            min-height: 100vh;
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
        
        .table-container {
            background: var(--bg-white);
            border-radius: 20px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
        }
        
        .table-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--border-light);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .search-box {
            position: relative;
            min-width: 300px;
        }
        
        .search-box i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
        }
        
        .search-box input {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: 1px solid var(--border-light);
            border-radius: 12px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }
        
        .search-box input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(42, 111, 151, 0.1);
        }
        
        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .table th {
            background: var(--bg-light);
            color: var(--text-secondary);
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 1rem 1.5rem;
            white-space: nowrap;
            border-bottom: 2px solid var(--border-light);
        }
        
        .table td {
            padding: 1.2rem 1.5rem;
            color: var(--text-primary);
            border-bottom: 1px solid var(--border-light);
            vertical-align: middle;
        }
        
        .table tbody tr {
            transition: all 0.3s ease;
        }
        
        .table tbody tr:hover {
            background: var(--bg-light);
        }
        
        .item-thumb {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            object-fit: cover;
            border: 1px solid var(--border-light);
        }
        
        .item-thumb-placeholder {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background: var(--bg-light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-muted);
            font-size: 1.5rem;
            border: 1px solid var(--border-light);
        }
        
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
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
        
        .btn-action {
            width: 35px;
            height: 35px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            border: 1px solid var(--border-light);
            background: var(--bg-white);
            color: var(--text-secondary);
            text-decoration: none;
        }
        
        .btn-action:hover {
            transform: translateY(-2px);
            background: #ef4444;
            border-color: #ef4444;
            color: white;
        }
        
        @media (max-width: 768px) {
            .admin-container {
                padding: 1.5rem;
            }
            
            .table-header {
                flex-direction: column;
                align-items: stretch;
            }
            
            .search-box {
                min-width: 100%;
            }
            
            .table td {
                padding: 1rem;
            }
            
            .item-thumb, .item-thumb-placeholder {
                width: 40px;
                height: 40px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="admin-container">
        <div class="page-header" data-aos="fade-up">
            <h1 class="page-title">
                <i class="bi bi-box-seam text-primary me-2"></i>
                Item Management
            </h1>
            <p class="page-subtitle">View and manage all reported items in the system.</p>
        </div>

        <!-- Filter Section -->
        <div class="filter-section" data-aos="fade-up" data-aos-delay="100">
            <div class="filter-title">Filter by Status</div>
            <div class="filter-badges">
                <a href="/admin/items" class="filter-badge ${param.status == null ? 'active' : ''}">All Items</a>
                <a href="/admin/items?status=LOST" class="filter-badge ${param.status == 'LOST' ? 'active' : ''}">Lost</a>
                <a href="/admin/items?status=FOUND" class="filter-badge ${param.status == 'FOUND' ? 'active' : ''}">Found</a>
                <a href="/admin/items?status=CLAIMED" class="filter-badge ${param.status == 'CLAIMED' ? 'active' : ''}">Claimed</a>
            </div>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-4" data-aos="fade-up">
                <i class="bi bi-check-circle-fill me-2"></i> ${param.success}
            </div>
        </c:if>

        <!-- Items Table -->
        <div class="table-container" data-aos="fade-up" data-aos-delay="200">
            <div class="table-header">
                <h5 class="fw-bold mb-0">Reported Items</h5>
                <div class="search-box">
                    <i class="bi bi-search"></i>
                    <input type="text" id="searchInput" placeholder="Search items...">
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table" id="itemsTable">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Item Details</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>Location</th>
                            <th>Reported By</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${items}">
                            <tr>
                                <td>
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
                                </td>
                                <td>
                                    <div class="fw-bold">${item.title}</div>
                                    <small class="text-secondary">ID: #${item.id}</small>
                                </td>
                                <td>
                                    <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2 rounded-pill">
                                        ${item.category}
                                    </span>
                                </td>
                                <td>
                                    <span class="status-badge ${item.status == 'LOST' ? 'lost' : (item.status == 'FOUND' ? 'found' : 'claimed')}">
                                        <i class="bi bi-circle-fill" style="font-size: 0.5rem;"></i>
                                        ${item.status}
                                    </span>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-geo-alt text-primary me-2"></i>
                                        ${item.location}
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-person-circle text-secondary me-2"></i>
                                        ${item.user.fullName}
                                    </div>
                                </td>
                                <td>
                                    <a href="/admin/items/delete/${item.id}" class="btn-action" 
                                       onclick="return confirm('Are you sure you want to delete this item?')" 
                                       title="Delete Item">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty items}">
                            <tr>
                                <td colspan="7" class="text-center py-5">
                                    <i class="bi bi-inboxes fs-1 text-muted mb-3 d-block"></i>
                                    <h6 class="text-muted">No items reported in the portal yet.</h6>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();

        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchValue = this.value.toLowerCase();
            const rows = document.querySelectorAll('#itemsTable tbody tr');
            
            rows.forEach(row => {
                const title = row.querySelector('td:nth-child(2) .fw-bold').textContent.toLowerCase();
                const category = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
                const location = row.querySelector('td:nth-child(5)').textContent.toLowerCase();
                const reporter = row.querySelector('td:nth-child(6)').textContent.toLowerCase();
                
                if (title.includes(searchValue) || category.includes(searchValue) || 
                    location.includes(searchValue) || reporter.includes(searchValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>