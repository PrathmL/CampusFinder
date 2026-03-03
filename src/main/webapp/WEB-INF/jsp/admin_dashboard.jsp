<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard | CampusFinder Analytics</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .admin-container {
            background: var(--bg-light);
            min-height: 100vh;
        }
        
        .sidebar-admin {
            background: var(--bg-white);
            border-right: 1px solid var(--border-light);
            min-height: 100vh;
            box-shadow: var(--shadow-sm);
            padding: 2rem 1rem;
            position: sticky;
            top: 0;
        }
        
        .sidebar-admin .admin-profile {
            text-align: center;
            padding-bottom: 2rem;
            border-bottom: 1px solid var(--border-light);
            margin-bottom: 2rem;
        }
        
        .admin-avatar {
            width: 80px;
            height: 80px;
            background: var(--gradient-primary);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: white;
            font-size: 2rem;
            font-weight: 700;
            transform: rotate(-5deg);
            transition: all 0.3s ease;
        }
        
        .admin-avatar:hover {
            transform: rotate(0deg) scale(1.05);
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
        
        .metric-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .metric-card {
            background: var(--bg-white);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .metric-card::before {
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
        
        .metric-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }
        
        .metric-card:hover::before {
            opacity: 1;
        }
        
        .metric-icon {
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
        
        .metric-value {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-primary);
            line-height: 1.2;
            margin-bottom: 0.25rem;
        }
        
        .metric-label {
            color: var(--text-secondary);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.8rem;
        }
        
        .chart-container {
            background: var(--bg-white);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .chart-container:hover {
            box-shadow: var(--shadow-hover);
        }
        
        .chart-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }
        
        .chart-title i {
            color: var(--primary);
            margin-right: 0.5rem;
            font-size: 1.2rem;
        }
        
        .insight-alert {
            background: linear-gradient(135deg, var(--primary-soft), var(--secondary-light));
            border: none;
            border-radius: 16px;
            padding: 1.5rem;
            color: var(--text-primary);
            margin-top: 2rem;
        }
        
        .insight-alert i {
            color: var(--primary);
            font-size: 1.5rem;
            margin-right: 1rem;
        }
        
        .insight-alert strong {
            color: var(--primary);
        }
        
        @media (max-width: 992px) {
            .sidebar-admin {
                position: fixed;
                left: -100%;
                transition: left 0.3s ease;
                z-index: 1000;
            }
            
            .sidebar-admin.show {
                left: 0;
            }
            
            .main-content {
                padding: 2rem 1.5rem;
            }
            
            .metric-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 576px) {
            .metric-grid {
                grid-template-columns: 1fr;
            }
            
            .metric-value {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body class="admin-container">
    <jsp:include page="components/navbar.jsp" />

    <div class="container-fluid">
        <div class="row">
            <!-- Admin Sidebar -->
            <nav class="col-md-3 col-lg-2 p-0 sidebar-admin">
                <div class="admin-profile">
                    <div class="admin-avatar">
                        <span>A</span>
                    </div>
                    <h6 class="fw-bold mb-0">System Administrator</h6>
                    <p class="small text-secondary mt-1">admin@campus.edu</p>
                    <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-1 rounded-pill">
                        <i class="bi bi-shield-fill-check me-1"></i>Verified
                    </span>
                </div>

                <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-link active">
                    <i class="bi bi-speedometer2"></i> Portal Overview
                </a>
                <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-link">
                    <i class="bi bi-people"></i> User Directory
                </a>
                <a href="${pageContext.request.contextPath}/admin/items" class="sidebar-link">
                    <i class="bi bi-archive"></i> Item Database
                </a>
                <a href="${pageContext.request.contextPath}/admin/claims" class="sidebar-link">
                    <i class="bi bi-check-all"></i> Claim Requests
                </a>
                <a href="${pageContext.request.contextPath}/admin/messages" class="sidebar-link">
                    <i class="bi bi-envelope"></i> User Messages
                </a>
                <hr class="my-4">
                <a href="${pageContext.request.contextPath}/logout" class="sidebar-link text-danger">
                    <i class="bi bi-power"></i> System Logout
                </a>
            </nav>

            <!-- Main Admin Area -->
            <main class="col-md-9 ms-sm-auto col-lg-10 p-0 main-content">
                <div class="page-header">
                    <h1 class="page-title">Administrative Insights</h1>
                    <p class="page-subtitle">Real-time data visualization of campus activities and system metrics.</p>
                </div>

                <!-- Metric Tiles -->
                <div class="metric-grid" data-aos="fade-up" data-aos-duration="800">
                    <div class="metric-card">
                        <div class="metric-icon">
                            <i class="bi bi-people-fill"></i>
                        </div>
                        <div class="metric-value">${totalUsers}</div>
                        <div class="metric-label">Total Students</div>
                    </div>
                    
                    <div class="metric-card">
                        <div class="metric-icon">
                            <i class="bi bi-box-seam-fill"></i>
                        </div>
                        <div class="metric-value">${totalItems}</div>
                        <div class="metric-label">Total Reports</div>
                    </div>
                    
                    <div class="metric-card">
                        <div class="metric-icon" style="color: var(--terracotta); background: rgba(229, 62, 62, 0.1);">
                            <i class="bi bi-shield-exclamation"></i>
                        </div>
                        <div class="metric-value" style="color: var(--terracotta);">${pendingClaims}</div>
                        <div class="metric-label">Pending Claims</div>
                    </div>
                    
                    <div class="metric-card">
                        <div class="metric-icon" style="color: var(--emerald); background: rgba(72, 187, 120, 0.1);">
                            <i class="bi bi-activity"></i>
                        </div>
                        <div class="metric-value" style="color: var(--emerald);">100%</div>
                        <div class="metric-label">System Health</div>
                    </div>
                </div>

                <!-- Visual Charts Section -->
                <div class="row g-4 mb-4">
                    <div class="col-lg-8" data-aos="fade-right" data-aos-delay="100">
                        <div class="chart-container">
                            <h5 class="chart-title">
                                <i class="bi bi-graph-up-arrow"></i>
                                System Activity Trends (Last 7 Days)
                            </h5>
                            <canvas id="trendChart" style="max-height: 350px;"></canvas>
                        </div>
                    </div>
                    <div class="col-lg-4" data-aos="fade-left" data-aos-delay="200">
                        <div class="chart-container">
                            <h5 class="chart-title">
                                <i class="bi bi-pie-chart-fill"></i>
                                Status Mix
                            </h5>
                            <canvas id="statusChart" style="max-height: 300px;"></canvas>
                        </div>
                    </div>
                </div>

                <div class="row g-4 mb-4">
                    <div class="col-12" data-aos="fade-up" data-aos-delay="250">
                        <div class="chart-container">
                            <h5 class="chart-title">
                                <i class="bi bi-bar-chart-line-fill"></i>
                                Reports by Category Breakdown
                            </h5>
                            <canvas id="categoryChart" style="max-height: 300px;"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity Preview -->
                <div class="row g-4">
                    <div class="col-12" data-aos="fade-up" data-aos-delay="300">
                        <div class="chart-container">
                            <h5 class="chart-title">
                                <i class="bi bi-clock-history"></i>
                                Recent Activity
                            </h5>
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead class="bg-light">
                                        <tr>
                                            <th>Time</th>
                                            <th>Action</th>
                                            <th>User</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="activity" items="${activities}">
                                            <tr>
                                                <td>${activity.time}</td>
                                                <td>${activity.action}</td>
                                                <td>${activity.user}</td>
                                                <td>
                                                    <span class="badge bg-opacity-10 
                                                        ${activity.status == 'LOST' ? 'bg-danger text-danger' : 
                                                          (activity.status == 'FOUND' ? 'bg-success text-success' : 
                                                          (activity.status == 'PENDING' ? 'bg-warning text-warning' : 'bg-primary text-primary'))}">
                                                        ${activity.status}
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty activities}">
                                            <tr>
                                                <td colspan="4" class="text-center text-muted py-4">No recent activity recorded.</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Smart Insight Alert -->
                <div class="insight-alert" data-aos="fade-up" data-aos-delay="400">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-lightning-charge-fill"></i>
                        <div>
                            <strong>Smart Insight:</strong> Your portal currently has more 
                            <strong>${lostCount > foundCount ? 'Lost' : 'Found'}</strong> reports than 
                            <strong>${lostCount > foundCount ? 'Found' : 'Lost'}</strong> ones. 
                            <span class="d-block mt-1 small">Consider sending a campus-wide notification to encourage item returns.</span>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <jsp:include page="components/footer.jsp" />

    <script>
        AOS.init();

        // 1. Trend Line Chart (Last 7 Days)
        const trendLabels = [];
        const trendValues = [];
        <c:forEach var="label" items="${trendLabels}">trendLabels.push('${label}');</c:forEach>
        <c:forEach var="val" items="${trendValues}">trendValues.push(${val});</c:forEach>

        const trendCtx = document.getElementById('trendChart').getContext('2d');
        const gradientBg = trendCtx.createLinearGradient(0, 0, 0, 400);
        gradientBg.addColorStop(0, 'rgba(42, 111, 151, 0.4)');
        gradientBg.addColorStop(1, 'rgba(42, 111, 151, 0)');

        new Chart(trendCtx, {
            type: 'line',
            data: {
                labels: trendLabels,
                datasets: [{
                    label: 'New Reports',
                    data: trendValues,
                    borderColor: '#2a6f97',
                    borderWidth: 3,
                    backgroundColor: gradientBg,
                    fill: true,
                    tension: 0.4,
                    pointBackgroundColor: '#2a6f97',
                    pointRadius: 4,
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        mode: 'index',
                        intersect: false,
                        backgroundColor: '#1e293b',
                        titleColor: '#fff',
                        bodyColor: '#fff',
                        padding: 12,
                        cornerRadius: 8
                    }
                },
                scales: {
                    y: { 
                        beginAtZero: true, 
                        grid: { color: 'rgba(0,0,0,0.05)' },
                        ticks: { stepSize: 1, color: '#64748b' }
                    },
                    x: { 
                        grid: { display: false },
                        ticks: { color: '#64748b' }
                    }
                }
            }
        });

        // 2. Status Doughnut Chart
        const lost = ${not empty lostCount ? lostCount : 0};
        const found = ${not empty foundCount ? foundCount : 0};
        const claimed = ${not empty claimedCount ? claimedCount : 0};

        const statusCtx = document.getElementById('statusChart').getContext('2d');
        new Chart(statusCtx, {
            type: 'doughnut',
            data: {
                labels: ['Lost', 'Found', 'Claimed'],
                datasets: [{
                    data: [lost, found, claimed],
                    backgroundColor: ['#E53E3E', '#48BB78', '#2a6f97'],
                    borderWidth: 0,
                    hoverOffset: 15
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: { usePointStyle: true, padding: 25, color: '#475569', font: { weight: '600' } }
                    },
                    tooltip: {
                        backgroundColor: '#1e293b',
                        padding: 12,
                        cornerRadius: 8
                    }
                },
                cutout: '75%'
            }
        });

        // 3. Item Lifecycle Comparison (Stacked Bar Chart)
        const lostByCat = [];
        const foundByCat = [];
        <c:forEach var="val" items="${lostByCategory}">lostByCat.push(${val});</c:forEach>
        <c:forEach var="val" items="${foundByCategory}">foundByCat.push(${val});</c:forEach>

        new Chart(document.getElementById('comparisonChart'), {
            type: 'bar',
            data: {
                labels: categoryLabels,
                datasets: [
                    {
                        label: 'Lost',
                        data: lostByCat,
                        backgroundColor: '#E53E3E',
                        borderRadius: 5
                    },
                    {
                        label: 'Found',
                        data: foundByCat,
                        backgroundColor: '#48BB78',
                        borderRadius: 5
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: { stacked: true, grid: { display: false }, ticks: { color: '#64748b' } },
                    y: { stacked: true, grid: { color: 'rgba(0,0,0,0.05)' }, ticks: { color: '#64748b' } }
                },
                plugins: {
                    legend: { position: 'top', labels: { usePointStyle: true, color: '#475569' } }
                }
            }
        });

        // 4. Claim Success Rate Gauge
        const totalClm = ${totalClaims > 0 ? totalClaims : 1}; // Avoid div by zero
        const apprvdClm = ${approvedCount > 0 ? approvedCount : 0};
        const successRate = Math.round((apprvdClm / totalClm) * 100);
        
        document.getElementById('gaugeValue').innerText = successRate + '%';

        new Chart(document.getElementById('gaugeChart'), {
            type: 'doughnut',
            data: {
                labels: ['Resolved', 'Remaining'],
                datasets: [{
                    data: [successRate, 100 - successRate],
                    backgroundColor: ['#2a6f97', '#e2e8f0'],
                    borderWidth: 0
                }]
            },
            options: {
                rotation: -90,
                circumference: 180,
                cutout: '85%',
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: { enabled: false }
                }
            }
        });

        // 5. Category Breakdown Chart
        const catLabels = [];
        const catValues = [];
        <c:forEach var="label" items="${categoryLabels}">catLabels.push('${label}');</c:forEach>
        <c:forEach var="value" items="${categoryValues}">catValues.push(${value});</c:forEach>

        new Chart(document.getElementById('categoryChart'), {
            type: 'bar',
            data: {
                labels: catLabels,
                datasets: [{
                    label: 'Total Items',
                    data: catValues,
                    backgroundColor: 'rgba(42, 111, 151, 0.8)',
                    borderRadius: 10,
                    barThickness: 40
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    x: { grid: { display: false }, ticks: { color: '#64748b' } },
                    y: { beginAtZero: true, grid: { color: 'rgba(0,0,0,0.05)' }, ticks: { color: '#64748b' } }
                }
            }
        });

        // Mobile sidebar toggle
        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.createElement('button');
            menuToggle.className = 'btn btn-primary d-md-none position-fixed';
            menuToggle.style.cssText = 'bottom: 20px; right: 20px; z-index: 1001; border-radius: 50%; width: 50px; height: 50px;';
            menuToggle.innerHTML = '<i class="bi bi-list"></i>';
            document.body.appendChild(menuToggle);
            
            menuToggle.addEventListener('click', function() {
                document.querySelector('.sidebar-admin').classList.toggle('show');
            });
        });
    </script>
</body>
</html>