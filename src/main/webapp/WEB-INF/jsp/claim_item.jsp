<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Claim Item | CampusFinder</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .claim-container {
            min-height: 100vh;
            background: linear-gradient(135deg, #f0f9ff 0%, #e6f0fa 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 100px 20px;
            position: relative;
            overflow: hidden;
        }
        
        .claim-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }
        
        .claim-shape {
            position: absolute;
            background: linear-gradient(135deg, rgba(42, 111, 151, 0.1), rgba(0, 166, 180, 0.1));
            border-radius: 50%;
            filter: blur(60px);
        }
        
        .claim-shape-1 {
            width: 500px;
            height: 500px;
            top: -250px;
            right: -100px;
            background: linear-gradient(135deg, #4a8bb7, #00a6b4);
            opacity: 0.3;
        }
        
        .claim-shape-2 {
            width: 400px;
            height: 400px;
            bottom: -200px;
            left: -100px;
            background: linear-gradient(135deg, #00a6b4, #f39c12);
            opacity: 0.3;
        }
        
        .claim-card {
            background: var(--bg-white);
            border-radius: 30px;
            padding: 3rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-light);
            position: relative;
            z-index: 2;
            max-width: 600px;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .claim-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }
        
        .claim-icon {
            width: 80px;
            height: 80px;
            background: var(--gradient-primary);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            font-size: 2.5rem;
            box-shadow: var(--shadow-md);
            transform: rotate(-5deg);
            transition: all 0.3s ease;
        }
        
        .claim-card:hover .claim-icon {
            transform: rotate(0deg) scale(1.05);
        }
        
        .claim-title {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            text-align: center;
        }
        
        .claim-subtitle {
            color: var(--text-secondary);
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .item-preview {
            background: var(--bg-light);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border: 1px solid var(--border-light);
        }
        
        .item-preview-header {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
            color: var(--primary);
            font-weight: 600;
        }
        
        .item-preview-header i {
            font-size: 1.2rem;
        }
        
        .item-detail {
            display: flex;
            margin-bottom: 0.75rem;
        }
        
        .item-detail-label {
            width: 100px;
            color: var(--text-secondary);
            font-weight: 500;
        }
        
        .item-detail-value {
            color: var(--text-primary);
            font-weight: 600;
            flex: 1;
        }
        
        .item-detail-value i {
            color: var(--primary);
            margin-right: 0.5rem;
        }
        
        .form-section {
            margin-bottom: 2rem;
        }
        
        .form-label {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-label i {
            color: var(--primary);
        }
        
        .form-control {
            border: 2px solid var(--border-light);
            border-radius: 15px;
            padding: 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            width: 100%;
            min-height: 150px;
            resize: vertical;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(42, 111, 151, 0.1);
        }
        
        .help-text {
            color: var(--text-muted);
            font-size: 0.9rem;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .help-text i {
            color: var(--primary);
        }
        
        .btn-submit {
            background: var(--gradient-primary);
            color: white;
            border: none;
            border-radius: 15px;
            padding: 1rem;
            font-weight: 700;
            font-size: 1.1rem;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }
        
        .btn-cancel {
            background: transparent;
            color: var(--text-secondary);
            border: 2px solid var(--border-light);
            border-radius: 15px;
            padding: 1rem;
            font-weight: 600;
            font-size: 1.1rem;
            width: 100%;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-cancel:hover {
            background: var(--bg-light);
            color: var(--text-primary);
            border-color: var(--text-muted);
        }
        
        .warning-box {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            border-radius: 12px;
            padding: 1rem;
            color: #92400e;
            font-size: 0.9rem;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .warning-box i {
            font-size: 1.2rem;
        }
        
        @media (max-width: 768px) {
            .claim-card {
                padding: 2rem;
            }
            
            .claim-title {
                font-size: 1.75rem;
            }
            
            .item-detail {
                flex-direction: column;
                gap: 0.25rem;
            }
            
            .item-detail-label {
                width: auto;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="claim-container">
        <div class="claim-shapes">
            <div class="claim-shape claim-shape-1"></div>
            <div class="claim-shape claim-shape-2"></div>
        </div>
        
        <div class="claim-card" data-aos="fade-up" data-aos-duration="800">
            <div class="claim-icon">
                <i class="bi bi-shield-check"></i>
            </div>
            
            <h2 class="claim-title">Submit Claim</h2>
            <p class="claim-subtitle">Please provide proof that this item belongs to you.</p>

            <!-- Warning Box -->
            <div class="warning-box">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <span>False claims are monitored and may result in account suspension.</span>
            </div>

            <!-- Item Preview -->
            <div class="item-preview">
                <div class="item-preview-header">
                    <i class="bi bi-box-seam"></i>
                    <span>Item Details</span>
                </div>
                
                <div class="item-detail">
                    <span class="item-detail-label">Title:</span>
                    <span class="item-detail-value">${item.title}</span>
                </div>
                
                <div class="item-detail">
                    <span class="item-detail-label">Category:</span>
                    <span class="item-detail-value">
                        <i class="bi bi-tag"></i>
                        ${item.category}
                    </span>
                </div>
                
                <div class="item-detail">
                    <span class="item-detail-label">Location:</span>
                    <span class="item-detail-value">
                        <i class="bi bi-geo-alt"></i>
                        ${item.location}
                    </span>
                </div>
                
                <div class="item-detail">
                    <span class="item-detail-label">Reported:</span>
                    <span class="item-detail-value">
                        <i class="bi bi-calendar"></i>
                        ${item.createdAt}
                    </span>
                </div>
                
                <c:if test="${not empty item.description}">
                    <div class="item-detail">
                        <span class="item-detail-label">Description:</span>
                        <span class="item-detail-value">${item.description}</span>
                    </div>
                </c:if>
            </div>

            <form action="/claim-item" method="POST" id="claimForm">
                <input type="hidden" name="itemId" value="${item.id}">
                
                <div class="form-section">
                    <label class="form-label">
                        <i class="bi bi-pencil-square"></i>
                        Proof of Ownership
                    </label>
                    <textarea name="proofOfOwnership" 
                              class="form-control" 
                              placeholder="Describe unique features, what's inside, when and where you lost it, or any other details that prove ownership..."
                              required></textarea>
                    <div class="help-text">
                        <i class="bi bi-info-circle"></i>
                        This information is sent to administrators for verification and is kept confidential.
                    </div>
                </div>

                <button type="submit" class="btn-submit" id="submitBtn">
                    <i class="bi bi-check-circle"></i>
                    Submit for Approval
                </button>

                <a href="/items" class="btn-cancel">
                    <i class="bi bi-arrow-left"></i>
                    Cancel & Back
                </a>
            </form>
        </div>
    </div>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();

        // Form validation
        document.getElementById('claimForm').addEventListener('submit', function(e) {
            const proof = document.querySelector('textarea[name="proofOfOwnership"]').value;
            
            if (proof.trim().length < 20) {
                e.preventDefault();
                alert('Please provide detailed proof of ownership (at least 20 characters).');
                return;
            }
            
            if (!confirm('Are you sure you want to submit this claim? False claims may result in account suspension.')) {
                e.preventDefault();
            }
        });

        // Character counter
        const textarea = document.querySelector('textarea');
        const helpText = document.querySelector('.help-text');
        
        textarea.addEventListener('input', function() {
            const remaining = 500 - this.value.length;
            if (remaining <= 50) {
                helpText.innerHTML = `<i class="bi bi-exclamation-triangle"></i> ${remaining} characters remaining`;
                helpText.style.color = remaining < 0 ? '#ef4444' : '#f59e0b';
            } else {
                helpText.innerHTML = `<i class="bi bi-info-circle"></i> Minimum 20 characters required`;
                helpText.style.color = 'var(--text-muted)';
            }
        });
    </script>
</body>
</html>