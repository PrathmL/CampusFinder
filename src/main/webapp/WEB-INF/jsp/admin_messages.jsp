<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact Messages | Admin Panel</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/academic-theme.css">
    <style>
        .admin-container {
            background: #f8fafc;
            min-height: 100vh;
        }
        
        .sidebar-admin {
            background: #1e293b;
            min-height: 100vh;
            color: white;
            padding: 2rem 1rem;
            position: sticky;
            top: 0;
        }
        
        .sidebar-link {
            display: flex;
            align-items: center;
            padding: 0.8rem 1.2rem;
            color: #94a3b8;
            text-decoration: none;
            border-radius: 10px;
            margin-bottom: 0.5rem;
            transition: all 0.3s ease;
        }
        
        .sidebar-link:hover, .sidebar-link.active {
            background: #334155;
            color: white;
        }
        
        .sidebar-link i {
            margin-right: 1rem;
            font-size: 1.2rem;
        }

        .main-content {
            padding: 2rem 3rem;
        }

        .message-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
            transition: transform 0.3s ease;
        }

        .message-card:hover {
            transform: translateY(-5px);
        }

        .message-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1.5rem;
            border-bottom: 1px solid #f1f5f9;
            padding-bottom: 1rem;
        }

        .sender-info h5 {
            margin: 0;
            font-weight: 700;
            color: #1e293b;
        }

        .sender-email {
            color: #64748b;
            font-size: 0.9rem;
        }

        .message-date {
            font-size: 0.85rem;
            color: #94a3b8;
        }

        .message-subject {
            font-weight: 600;
            color: #0f172a;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .message-body {
            color: #475569;
            line-height: 1.6;
            background: #f8fafc;
            padding: 1.5rem;
            border-radius: 12px;
            font-style: italic;
        }

        .delete-btn {
            color: #ef4444;
            background: #fef2f2;
            border: 1px solid #fee2e2;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .delete-btn:hover {
            background: #ef4444;
            color: white;
        }
    </style>
</head>
<body class="admin-container">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 p-0 sidebar-admin d-none d-md-block">
                <div class="px-4 mb-4">
                    <h4 class="fw-bold">Admin Panel</h4>
                    <p class="text-slate-400 small">CampusFinder System</p>
                </div>
                
                <a href="/admin/dashboard" class="sidebar-link">
                    <i class="bi bi-speedometer2"></i> Dashboard
                </a>
                <a href="/admin/users" class="sidebar-link">
                    <i class="bi bi-people"></i> Users
                </a>
                <a href="/admin/items" class="sidebar-link">
                    <i class="bi bi-box-seam"></i> Items
                </a>
                <a href="/admin/claims" class="sidebar-link">
                    <i class="bi bi-shield-check"></i> Claims
                </a>
                <a href="/admin/messages" class="sidebar-link active">
                    <i class="bi bi-envelope"></i> Messages
                </a>
                <hr class="my-4 border-slate-700">
                <a href="/logout" class="sidebar-link text-danger">
                    <i class="bi bi-box-arrow-left"></i> Logout
                </a>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 p-0">
                <div class="main-content">
                    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
                        <div>
                            <h1 class="h2 fw-bold text-slate-800">User Messages</h1>
                            <p class="text-slate-500">Inquiries and feedback from the Contact Us page.</p>
                        </div>
                        <div class="admin-profile d-flex align-items-center gap-3">
                            <div class="text-end">
                                <div class="fw-bold text-slate-800">${adminUser.fullName}</div>
                                <div class="small text-slate-500">System Administrator</div>
                            </div>
                            <div class="avatar bg-primary text-white rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 45px; height: 45px;">
                                ${adminUser.fullName.substring(0,1)}
                            </div>
                        </div>
                    </div>

                    <c:if test="${param.success != null}">
                        <div class="alert alert-success alert-dismissible fade show rounded-4 mb-4 border-0 shadow-sm" role="alert">
                            <i class="bi bi-check-circle-fill me-2"></i>
                            ${param.success}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <c:choose>
                        <c:when test="${not empty messages}">
                            <div class="row">
                                <c:forEach var="msg" items="${messages}">
                                    <div class="col-12" data-aos="fade-up">
                                        <div class="message-card">
                                            <div class="message-header">
                                                <div class="sender-info">
                                                    <h5>${msg.name}</h5>
                                                    <div class="sender-email">${msg.email}</div>
                                                </div>
                                                <div class="d-flex flex-column align-items-end gap-2">
                                                    <div class="message-date">
                                                        <i class="bi bi-clock me-1"></i>
                                                        ${msg.createdAt}
                                                    </div>
                                                    <a href="/admin/messages/delete/${msg.id}" class="delete-btn" onclick="return confirm('Are you sure you want to delete this message?')">
                                                        <i class="bi bi-trash"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="message-subject">
                                                <i class="bi bi-info-circle text-primary"></i>
                                                Subject: ${msg.subject}
                                            </div>
                                            <div class="message-body">
                                                "${msg.message}"
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5 bg-white rounded-4 border border-dashed" data-aos="zoom-in">
                                <i class="bi bi-envelope-x display-1 text-slate-200 mb-3"></i>
                                <h3 class="text-slate-400">No messages yet</h3>
                                <p class="text-slate-400">When users contact support, their messages will appear here.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>
