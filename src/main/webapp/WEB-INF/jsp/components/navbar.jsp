<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg glass-nav sticky-top" id="mainNavbar">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
            <div class="brand-icon">
                <i class="bi bi-mortarboard-fill"></i>
            </div>
            <span class="brand-text">CAMPUS<span class="brand-highlight">FINDER</span></span>
        </a>
        
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link mx-2 ${pageContext.request.servletPath == '/index.jsp' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/">
                        <i class="bi bi-house-door me-1"></i>
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mx-2 ${pageContext.request.servletPath == '/items.jsp' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/items">
                        <i class="bi bi-grid me-1"></i>
                        Directory
                    </a>
                </li>
                
                <c:choose>
                    <c:when test="${empty loggedInUser}">
                        <li class="nav-item">
                            <a class="nav-link mx-2" href="${pageContext.request.contextPath}/login">
                                <i class="bi bi-box-arrow-in-right me-1"></i>
                                Login
                            </a>
                        </li>
                        <li class="nav-item ms-lg-3">
                            <a class="btn-navbar-register" href="${pageContext.request.contextPath}/register">
                                <i class="bi bi-person-plus me-2"></i>
                                Register
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item dropdown ms-lg-3">
                            <a class="nav-link dropdown-toggle user-dropdown" href="#" id="userDropdown" 
                               role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="user-avatar">
                                    <span>${loggedInUser.fullName.substring(0,1)}</span>
                                </div>
                                <span class="user-name">${loggedInUser.fullName}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end border-0 shadow-lg mt-3 p-2 rounded-4" 
                                aria-labelledby="userDropdown">
                                <li>
                                    <a class="dropdown-item rounded-3 py-3" href="${pageContext.request.contextPath}/dashboard">
                                        <i class="bi bi-grid-1x2-fill me-2"></i>
                                        <div class="d-flex flex-column">
                                            <span>Dashboard</span>
                                            <small class="text-secondary">View your activity</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item rounded-3 py-3" href="${pageContext.request.contextPath}/profile">
                                        <i class="bi bi-person-circle me-2"></i>
                                        <div class="d-flex flex-column">
                                            <span>Profile</span>
                                            <small class="text-secondary">Manage your account</small>
                                        </div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <a class="dropdown-item rounded-3 py-3 text-danger" href="${pageContext.request.contextPath}/logout">
                                        <i class="bi bi-box-arrow-left me-2"></i>
                                        <div class="d-flex flex-column">
                                            <span>Logout</span>
                                            <small class="text-secondary">End your session</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<style>
/* Navbar Custom Styles */
.glass-nav {
    background: rgba(255, 255, 255, 0.95) !important;
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border-bottom: 1px solid var(--border-light);
    padding: 1rem 0;
    transition: all 0.3s ease;
}

.glass-nav.scrolled {
    padding: 0.5rem 0;
    background: rgba(255, 255, 255, 0.98) !important;
    box-shadow: var(--shadow-md);
}

/* Brand Styles */
.navbar-brand {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    position: relative;
}

.brand-icon {
    width: 40px;
    height: 40px;
    background: var(--gradient-primary);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.5rem;
    transform: rotate(-5deg);
    transition: all 0.3s ease;
}

.navbar-brand:hover .brand-icon {
    transform: rotate(0deg) scale(1.1);
}

.brand-text {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--text-primary);
    letter-spacing: -0.5px;
}

.brand-highlight {
    color: var(--primary);
    font-weight: 800;
}

/* Navigation Links */
.nav-link {
    color: var(--text-secondary) !important;
    font-weight: 500;
    padding: 0.5rem 1rem !important;
    transition: all 0.3s ease;
    position: relative;
    border-radius: 50px;
    display: flex;
    align-items: center;
    gap: 0.25rem;
}

.nav-link i {
    font-size: 1.1rem;
}

.nav-link::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 2px;
    background: var(--gradient-primary);
    transition: width 0.3s ease;
}

.nav-link:hover::before,
.nav-link.active::before {
    width: 80%;
}

.nav-link:hover,
.nav-link.active {
    color: var(--primary) !important;
    background: var(--primary-soft);
}

/* Register Button */
.btn-navbar-register {
    display: inline-flex;
    align-items: center;
    padding: 0.5rem 1.5rem;
    background: var(--gradient-primary);
    color: white !important;
    border-radius: 50px;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: var(--shadow-sm);
}

.btn-navbar-register:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-lg);
}

/* User Dropdown */
.user-dropdown {
    display: flex !important;
    align-items: center;
    gap: 0.5rem;
    padding: 0.25rem 1rem 0.25rem 0.25rem !important;
    background: var(--bg-light) !important;
    border-radius: 50px !important;
}

.user-avatar {
    width: 35px;
    height: 35px;
    background: var(--gradient-primary);
    border-radius: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 700;
    font-size: 1rem;
}

.user-name {
    color: var(--text-primary);
    font-weight: 600;
    font-size: 0.9rem;
}

.dropdown-menu {
    min-width: 280px;
    padding: 1rem !important;
    border: 1px solid var(--border-light) !important;
    box-shadow: var(--shadow-lg) !important;
    animation: dropdownFade 0.3s ease;
}

@keyframes dropdownFade {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.dropdown-item {
    padding: 0.75rem 1rem !important;
    border-radius: 12px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.dropdown-item i {
    font-size: 1.2rem;
    width: 24px;
    color: var(--primary);
}

.dropdown-item:hover {
    background: var(--bg-light);
    transform: translateX(5px);
}

.dropdown-item.text-danger i {
    color: #ef4444;
}

.dropdown-divider {
    margin: 0.5rem 0;
    border-color: var(--border-light);
}

/* Mobile Responsive */
@media (max-width: 992px) {
    .navbar-collapse {
        background: var(--bg-white);
        border-radius: 20px;
        padding: 1rem;
        margin-top: 1rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--border-light);
    }
    
    .nav-link {
        padding: 0.75rem 1rem !important;
    }
    
    .btn-navbar-register {
        display: block;
        text-align: center;
        margin-top: 0.5rem;
    }
    
    .user-dropdown {
        justify-content: space-between;
        width: 100%;
    }
}
</style>

<script>
// Navbar scroll effect
window.addEventListener('scroll', function() {
    const navbar = document.getElementById('mainNavbar');
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});
</script>