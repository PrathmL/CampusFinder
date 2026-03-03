<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>About Us | CampusFinder Team</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .about-hero {
            background: linear-gradient(135deg, #f0f9ff 0%, #e6f0fa 100%);
            padding: 120px 0 80px;
            position: relative;
            overflow: hidden;
            text-align: center;
        }

        .hero-shapes .shape {
            position: absolute;
            background: linear-gradient(135deg, rgba(42, 111, 151, 0.1), rgba(0, 166, 180, 0.1));
            border-radius: 50%;
            filter: blur(60px);
            z-index: 1;
        }

        .shape-1 { width: 400px; height: 400px; top: -200px; right: -100px; }
        .shape-2 { width: 300px; height: 300px; bottom: -150px; left: -100px; }

        .section-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 2;
        }

        .section-subtitle {
            color: var(--text-secondary);
            max-width: 700px;
            margin: 0 auto 3rem;
            font-size: 1.1rem;
            position: relative;
            z-index: 2;
        }

        .team-container {
            padding: 80px 0;
            background: var(--bg-white);
        }

        .developer-card {
            background: var(--bg-white);
            border-radius: 30px;
            padding: 2.5rem 2rem;
            text-align: center;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            height: 100%;
            position: relative;
            z-index: 2;
        }

        .developer-card:hover {
            transform: translateY(-15px);
            box-shadow: var(--shadow-lg);
            border-color: var(--primary);
        }

        .img-container {
            width: 150px;
            height: 150px;
            margin: 0 auto 1.5rem;
            border-radius: 50%;
            padding: 8px;
            background: var(--gradient-primary);
            box-shadow: var(--shadow-md);
        }

        .developer-img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid white;
            background: #eee;
        }

        .developer-name {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }

        .developer-position {
            color: var(--primary);
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 1rem;
            display: block;
        }

        .developer-bio {
            color: var(--text-secondary);
            font-size: 0.9rem;
            line-height: 1.6;
        }

        .social-icons {
            margin-top: 1.5rem;
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .social-icons a {
            width: 35px;
            height: 35px;
            border-radius: 10px;
            background: var(--bg-light);
            color: var(--text-secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .social-icons a:hover {
            background: var(--gradient-primary);
            color: white;
            transform: scale(1.1);
        }

        @media (max-width: 768px) {
            .section-title { font-size: 2rem; }
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <section class="about-hero">
        <div class="hero-shapes">
            <div class="shape shape-1"></div>
            <div class="shape shape-2"></div>
        </div>
        <div class="container">
            <h1 class="section-title" data-aos="fade-up">The Minds Behind <span class="gradient-text">CampusFinder</span></h1>
            <p class="section-subtitle" data-aos="fade-up" data-aos-delay="100">
                A dedicated team of interns committed to making campus life easier through smart technology and community-driven solutions.
            </p>
        </div>
    </section>

    <section class="team-container">
        <div class="container">
            <div class="row g-4 justify-content-center">
                <!-- Developer 1 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                    <div class="developer-card">
                        <div class="img-container">
                            <img src="${pageContext.request.contextPath}/uploads/Profile_Pics/Aarti_Gosavi.png" alt="Aarti Gosavi" class="developer-img">
                        </div>
                        <h3 class="developer-name">Aarti Gosavi</h3>
                        <span class="developer-position">Full Stack Web intern at SetTribe</span>
                        <p class="developer-bio">Passionate about building scalable web applications and intuitive user interfaces.</p>
                        <div class="social-icons">
                            <a href="#"><i class="bi bi-linkedin"></i></a>
                            <a href="#"><i class="bi bi-github"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Developer 2 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="developer-card">
                        <div class="img-container">
                            <img src="${pageContext.request.contextPath}/uploads/Profile_Pics/Pratiksha_Pare.jpeg" alt="Pratiksha Pare" class="developer-img">
                        </div>
                        <h3 class="developer-name">Pratiksha Pare</h3>
                        <span class="developer-position">Full Stack Web intern at SetTribe</span>
                        <p class="developer-bio">Focused on creating robust backend systems and optimizing database performance.</p>
                        <div class="social-icons">
                            <a href="#"><i class="bi bi-linkedin"></i></a>
                            <a href="#"><i class="bi bi-github"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Developer 3 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="developer-card">
                        <div class="img-container">
                            <img src="${pageContext.request.contextPath}/uploads/Profile_Pics/Rohini_Kirkdak.jpeg" alt="Rohini Kirdak" class="developer-img">
                        </div>
                        <h3 class="developer-name">Rohini Kirdak</h3>
                        <span class="developer-position">Full Stack Web intern at SetTribe</span>
                        <p class="developer-bio">Specializes in frontend architecture and delivering seamless cross-platform experiences.</p>
                        <div class="social-icons">
                            <a href="#"><i class="bi bi-linkedin"></i></a>
                            <a href="#"><i class="bi bi-github"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Developer 4 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
                    <div class="developer-card">
                        <div class="img-container">
                            <img src="${pageContext.request.contextPath}/uploads/Profile_Pics/Akash_Sharma.jpg" alt="Akash Sharma" class="developer-img">
                        </div>
                        <h3 class="developer-name">Akash Sharma</h3>
                        <span class="developer-position">Full Stack Web intern at SetTribe</span>
                        <p class="developer-bio">Loves solving complex problems and implementing smart algorithms for data matching.</p>
                        <div class="social-icons">
                            <a href="#"><i class="bi bi-linkedin"></i></a>
                            <a href="#"><i class="bi bi-github"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Developer 5 -->
                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
                    <div class="developer-card">
                        <div class="img-container">
                            <img src="${pageContext.request.contextPath}/uploads/Profile_Pics/Prathmesh_Landge.jpg" alt="Prathmesh Landge" class="developer-img">
                        </div>
                        <h3 class="developer-name">Prathmesh Landge</h3>
                        <span class="developer-position">Full Stack Web intern at SetTribe</span>
                        <p class="developer-bio">Committed to engineering excellence and building products that make a real difference.</p>
                        <div class="social-icons">
                            <a href="https://www.linkedin.com/in/prathmesh-landge-69b88b244/"><i class="bi bi-linkedin"></i></a>
                            <a href="#"><i class="bi bi-github"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>
</html>
