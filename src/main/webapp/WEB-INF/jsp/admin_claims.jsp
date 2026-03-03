<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Claims | Admin Panel</title>
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
        
        .stat-title {
            color: var(--text-secondary);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 0.5rem;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
        }
        
        .stat-number.pending { color: #f59e0b; }
        .stat-number.approved { color: #10b981; }
        .stat-number.rejected { color: #ef4444; }
        
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
        
        .claim-item {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .item-icon {
            width: 40px;
            height: 40px;
            background: var(--primary-soft);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 1.2rem;
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
        
        .status-badge.pending {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            color: #92400e;
        }
        
        .status-badge.approved {
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            color: #065f46;
        }
        
        .status-badge.rejected {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .proof-text {
            max-width: 300px;
            background: var(--bg-light);
            padding: 0.75rem 1rem;
            border-radius: 10px;
            color: var(--text-secondary);
            font-size: 0.9rem;
            border-left: 3px solid var(--primary);
        }
        
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn-approve {
            padding: 0.5rem 1rem;
            border-radius: 10px;
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            border: none;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .btn-approve:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
        }
        
        .btn-reject {
            padding: 0.5rem 1rem;
            border-radius: 10px;
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            border: none;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .btn-reject:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        }
        
        @media (max-width: 992px) {
            .admin-container {
                padding: 1.5rem;
            }
            
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .table td {
                padding: 1rem;
            }
            
            .proof-text {
                max-width: 200px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="admin-container">
        <div class="page-header" data-aos="fade-up">
            <h1 class="page-title">
                <i class="bi bi-shield-check text-primary me-2"></i>
                Claim Management
            </h1>
            <p class="page-subtitle">Review and process item ownership claims.</p>
        </div>

        <!-- Stats Cards -->
        <div class="stats-grid" data-aos="fade-up" data-aos-delay="100">
            <div class="stat-card">
                <div class="stat-title">Total Claims</div>
                <div class="stat-number">${totalClaims}</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Pending Review</div>
                <div class="stat-number pending">${pendingCount}</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Approved</div>
                <div class="stat-number approved">${approvedCount}</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Rejected</div>
                <div class="stat-number rejected">${rejectedCount}</div>
            </div>
        </div>

        <!-- Analytics Section -->
        <div class="row g-4 mb-4" data-aos="fade-up" data-aos-delay="150">
            <div class="col-lg-4">
                <div class="table-container p-4 h-100">
                    <h5 class="fw-bold mb-4">Status Distribution</h5>
                    <canvas id="claimStatusChart" style="max-height: 250px;"></canvas>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="table-container p-4 h-100">
                    <h5 class="fw-bold mb-4">Submission Trend (Last 7 Days)</h5>
                    <canvas id="claimTrendChart" style="max-height: 250px;"></canvas>
                </div>
            </div>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-4" data-aos="fade-up">
                <i class="bi bi-check-circle-fill me-2"></i> ${param.success}
            </div>
        </c:if>

        <!-- Claims Table -->
        <div class="table-container" data-aos="fade-up" data-aos-delay="200">
            <div class="table-header">
                <h5 class="fw-bold mb-0">Pending & Processed Claims</h5>
            </div>
            
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Claimant</th>
                            <th>Proof of Ownership</th>
                            <th>Submitted</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="claim" items="${claims}">
                            <tr>
                                <td>
                                    <div class="claim-item">
                                        <div class="item-icon">
                                            <i class="bi bi-box"></i>
                                        </div>
                                        <div>
                                            <div class="fw-bold">${claim.item.title}</div>
                                            <small class="text-secondary">ID: #${claim.item.id}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="fw-bold">${claim.user.fullName}</div>
                                    <small class="text-secondary">${claim.user.email}</small>
                                </td>
                                <td>
                                    <div class="proof-text" title="${claim.proofOfOwnership}">
                                        ${claim.proofOfOwnership}
                                    </div>
                                </td>
                                <td>
                                    <div class="text-secondary">
                                        <i class="bi bi-clock me-1"></i>
                                        ${claim.createdAt}
                                    </div>
                                </td>
                                <td>
                                    <span class="status-badge ${claim.status == 'PENDING' ? 'pending' : (claim.status == 'APPROVED' ? 'approved' : 'rejected')}">
                                        <i class="bi bi-circle-fill" style="font-size: 0.5rem;"></i>
                                        ${claim.status}
                                    </span>
                                </td>
                                <td>
                                    <c:if test="${claim.status == 'PENDING'}">
                                        <div class="action-buttons">
                                            <form action="/admin/claims/process" method="POST" style="display: inline;">
                                                <input type="hidden" name="claimId" value="${claim.id}">
                                                <input type="hidden" name="status" value="APPROVED">
                                                <button type="submit" class="btn-approve">
                                                    <i class="bi bi-check-lg"></i> Approve
                                                </button>
                                            </form>
                                            <form action="/admin/claims/process" method="POST" style="display: inline;">
                                                <input type="hidden" name="claimId" value="${claim.id}">
                                                <input type="hidden" name="status" value="REJECTED">
                                                <button type="submit" class="btn-reject">
                                                    <i class="bi bi-x-lg"></i> Reject
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                    <c:if test="${claim.status != 'PENDING'}">
                                        <span class="text-secondary">
                                            <i class="bi bi-check-circle-fill text-success me-1"></i>
                                            Processed
                                        </span>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty claims}">
                            <tr>
                                <td colspan="6" class="text-center py-5">
                                    <i class="bi bi-shield-exclamation fs-1 text-muted mb-3 d-block"></i>
                                    <h6 class="text-muted">No claims submitted yet.</h6>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        AOS.init();

        // 1. Claim Status Distribution
        const statusLabels = [];
        const statusValues = [];
        <c:forEach var="label" items="${claimStatusLabels}">statusLabels.push('${label}');</c:forEach>
        <c:forEach var="val" items="${claimStatusValues}">statusValues.push(${val});</c:forEach>

        new Chart(document.getElementById('claimStatusChart'), {
            type: 'doughnut',
            data: {
                labels: statusLabels,
                datasets: [{
                    data: statusValues,
                    backgroundColor: ['#f59e0b', '#10b981', '#ef4444'],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom' }
                },
                cutout: '70%'
            }
        });

        // 2. Claim Trend Chart
        const trendLabels = [];
        const trendValues = [];
        <c:forEach var="label" items="${claimTrendLabels}">trendLabels.push('${label}');</c:forEach>
        <c:forEach var="val" items="${claimTrendValues}">trendValues.push(${val});</c:forEach>

        new Chart(document.getElementById('claimTrendChart'), {
            type: 'line',
            data: {
                labels: trendLabels,
                datasets: [{
                    label: 'New Claims',
                    data: trendValues,
                    borderColor: '#2a6f97',
                    backgroundColor: 'rgba(42, 111, 151, 0.1)',
                    fill: true,
                    tension: 0.4
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
    </script>
</body>
</html>