<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Users | Admin Panel</title>
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
        
        .stats-card {
            background: var(--bg-white);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 2rem;
        }
        
        .stat-item {
            display: flex;
            align-items: center;
            gap: 1rem;
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
        }
        
        .stat-info h3 {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
            margin: 0;
            line-height: 1.2;
        }
        
        .stat-info p {
            color: var(--text-secondary);
            margin: 0;
            font-size: 0.9rem;
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
        
        .table-responsive {
            overflow-x: auto;
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
        
        .user-avatar {
            width: 40px;
            height: 40px;
            background: var(--gradient-primary);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1rem;
        }
        
        .badge-role {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .badge-role.admin {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .badge-role.user {
            background: linear-gradient(135deg, #dbeafe, #bfdbfe);
            color: #1e40af;
        }
        
        .action-buttons {
            display: flex;
            gap: 0.5rem;
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
        }
        
        .btn-action.edit:hover {
            background: #f59e0b;
            border-color: #f59e0b;
            color: white;
        }
        
        .btn-action.delete:hover {
            background: #ef4444;
            border-color: #ef4444;
            color: white;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 2rem;
        }
        
        .page-link {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            border: 1px solid var(--border-light);
            color: var(--text-secondary);
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .page-link:hover,
        .page-link.active {
            background: var(--gradient-primary);
            color: white;
            border-color: transparent;
        }
        
        @media (max-width: 768px) {
            .admin-container {
                padding: 1.5rem;
            }
            
            .stats-card {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
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
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="admin-container">
        <div class="page-header" data-aos="fade-up">
            <h1 class="page-title">
                <i class="bi bi-people-fill text-primary me-2"></i>
                User Management
            </h1>
            <p class="page-subtitle">Manage and monitor all registered users in the system.</p>
        </div>

        <!-- Stats Cards -->
        <div class="stats-card" data-aos="fade-up" data-aos-delay="100">
            <div class="stat-item">
                <div class="stat-icon">
                    <i class="bi bi-people"></i>
                </div>
                <div class="stat-info">
                    <h3>${totalUsers}</h3>
                    <p>Total Users</p>
                </div>
            </div>
            <div class="stat-item">
                <div class="stat-icon" style="background: rgba(245, 158, 11, 0.1); color: #f59e0b;">
                    <i class="bi bi-shield-check"></i>
                </div>
                <div class="stat-info">
                    <h3>${adminCount}</h3>
                    <p>Administrators</p>
                </div>
            </div>
            <div class="stat-item">
                <div class="stat-icon" style="background: rgba(16, 185, 129, 0.1); color: #10b981;">
                    <i class="bi bi-person-check"></i>
                </div>
                <div class="stat-info">
                    <h3>${activeToday}</h3>
                    <p>Active Today</p>
                </div>
            </div>
        </div>

        <!-- Analytics Section -->
        <div class="row g-4 mb-4" data-aos="fade-up" data-aos-delay="150">
            <div class="col-lg-4">
                <div class="table-container p-4 h-100">
                    <h5 class="fw-bold mb-4">Role Distribution</h5>
                    <canvas id="roleChart" style="max-height: 250px;"></canvas>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="table-container p-4 h-100">
                    <h5 class="fw-bold mb-4">Registration Trend (Last 7 Days)</h5>
                    <canvas id="userTrendChart" style="max-height: 250px;"></canvas>
                </div>
            </div>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-4" data-aos="fade-up">
                <i class="bi bi-check-circle-fill me-2"></i> ${param.success}
            </div>
        </c:if>

        <!-- Users Table -->
        <div class="table-container" data-aos="fade-up" data-aos-delay="200">
            <div class="table-header">
                <h5 class="fw-bold mb-0">Registered Users</h5>
                <div class="search-box">
                    <i class="bi bi-search"></i>
                    <input type="text" id="searchInput" placeholder="Search by name or email...">
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table" id="usersTable">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="user-avatar">
                                            ${user.fullName.substring(0,1)}
                                        </div>
                                        <div>
                                            <div class="fw-bold">${user.fullName}</div>
                                            <small class="text-secondary">ID: #${user.id}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>${user.email}</td>
                                <td>
                                    <span class="badge-role ${user.role == 'ROLE_ADMIN' ? 'admin' : 'user'}">
                                        <i class="bi ${user.role == 'ROLE_ADMIN' ? 'bi-shield-fill' : 'bi-person'}"></i>
                                        ${user.role == 'ROLE_ADMIN' ? 'Administrator' : 'Student'}
                                    </span>
                                </td>
                                <td>
                                    <span class="badge bg-success bg-opacity-10 text-success px-3 py-2 rounded-pill">
                                        <i class="bi bi-circle-fill me-1" style="font-size: 0.5rem;"></i>
                                        Active
                                    </span>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="/admin/users/edit/${user.id}" class="btn-action edit" title="Edit User">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <c:if test="${user.email != 'admin@gmail.com'}">
                                            <a href="/admin/users/delete/${user.id}" class="btn-action delete" 
                                               onclick="return confirm('Are you sure you want to delete this user?')" 
                                               title="Delete User">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination -->
            <div class="pagination">
                <a href="#" class="page-link active">1</a>
                <a href="#" class="page-link">2</a>
                <a href="#" class="page-link">3</a>
                <a href="#" class="page-link">4</a>
                <a href="#" class="page-link">5</a>
            </div>
        </div>
    </div>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        AOS.init();

        // 1. Role Distribution Chart
        const roleLabels = [];
        const roleValues = [];
        <c:forEach var="label" items="${roleLabels}">roleLabels.push('${label}');</c:forEach>
        <c:forEach var="val" items="${roleValues}">roleValues.push(${val});</c:forEach>

        new Chart(document.getElementById('roleChart'), {
            type: 'pie',
            data: {
                labels: roleLabels,
                datasets: [{
                    data: roleValues,
                    backgroundColor: ['#2a6f97', '#f39c12'],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });

        // 2. User Trend Chart
        const trendLabels = [];
        const trendValues = [];
        <c:forEach var="label" items="${userTrendLabels}">trendLabels.push('${label}');</c:forEach>
        <c:forEach var="val" items="${userTrendValues}">trendValues.push(${val});</c:forEach>

        new Chart(document.getElementById('userTrendChart'), {
            type: 'bar',
            data: {
                labels: trendLabels,
                datasets: [{
                    label: 'New Registrations',
                    data: trendValues,
                    backgroundColor: '#4a8bb7',
                    borderRadius: 8
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { beginAtZero: true, ticks: { stepSize: 1 } },
                    x: { grid: { display: false } }
                }
            }
        });

        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchValue = this.value.toLowerCase();
            const rows = document.querySelectorAll('#usersTable tbody tr');
            
            rows.forEach(row => {
                const name = row.querySelector('td:first-child .fw-bold').textContent.toLowerCase();
                const email = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                
                if (name.includes(searchValue) || email.includes(searchValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>