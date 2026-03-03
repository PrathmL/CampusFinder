<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit User | Admin Panel</title>
    <jsp:include page="components/header.jsp" />
    <style>
        .admin-edit-container { margin-top: 120px; margin-bottom: 50px; display: flex; justify-content: center; align-items: center; }
    </style>
</head>
<body class="bg-white">
    <jsp:include page="components/navbar.jsp" />

    <div class="container admin-edit-container">
        <div class="glass-card w-100 shadow-lg" style="max-width: 500px; border-radius: 20px;">
            <div class="text-center mb-4">
                <div class="bg-primary bg-opacity-10 p-3 rounded-circle d-inline-block mb-3">
                    <i class="bi bi-person-gear fs-1 text-primary"></i>
                </div>
                <h2 class="mt-3 fw-bold">Update User Account</h2>
                <p class="text-secondary">Security management for ID #${user.id}</p>
            </div>

            <form action="/admin/users/update" method="POST">
                <input type="hidden" name="id" value="${user.id}">
                
                <div class="mb-4">
                    <label class="form-label small fw-bold text-secondary text-uppercase">Full Name</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-person"></i></span>
                        <input type="text" name="fullName" class="form-control border-start-0 py-3" value="${user.fullName}" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label small fw-bold text-secondary text-uppercase">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-envelope"></i></span>
                        <input type="email" name="email" class="form-control border-start-0 py-3" value="${user.email}" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label small fw-bold text-secondary text-uppercase">New Password</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-shield-lock"></i></span>
                        <input type="password" name="password" class="form-control border-start-0 py-3" 
                               placeholder="Enter new password to reset" required>
                    </div>
                    <small class="text-muted">Password will be securely encrypted before saving.</small>
                </div>

                <button type="submit" class="btn btn-academic w-100 py-3 mb-3 shadow-sm">
                    <i class="bi bi-check-circle me-2"></i> Save Account Changes
                </button>

                <a href="/admin/users" class="btn btn-outline-secondary w-100 py-3 rounded-3">
                    Cancel & Return
                </a>
            </form>
        </div>
    </div>

    <jsp:include page="components/footer.jsp" />
</body>
</html>
