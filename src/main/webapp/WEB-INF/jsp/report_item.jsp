<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Report ${type} Item | CampusFinder</title>
    <jsp:include page="components/header.jsp" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
    <style>
        .report-container {
            min-height: 100vh;
            background: linear-gradient(135deg, #f0f9ff 0%, #e6f0fa 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 100px 20px;
            position: relative;
            overflow: hidden;
        }
        
        .report-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }
        
        .report-shape {
            position: absolute;
            background: linear-gradient(135deg, rgba(42, 111, 151, 0.1), rgba(0, 166, 180, 0.1));
            border-radius: 50%;
            filter: blur(60px);
        }
        
        .report-shape-1 {
            width: 500px;
            height: 500px;
            top: -250px;
            right: -100px;
            background: linear-gradient(135deg, #4a8bb7, #00a6b4);
            opacity: 0.3;
        }
        
        .report-shape-2 {
            width: 400px;
            height: 400px;
            bottom: -200px;
            left: -100px;
            background: linear-gradient(135deg, #00a6b4, #f39c12);
            opacity: 0.3;
        }
        
        .report-shape-3 {
            width: 300px;
            height: 300px;
            top: 50%;
            right: 20%;
            background: linear-gradient(135deg, #f39c12, #4a8bb7);
            opacity: 0.2;
        }
        
        .report-card {
            background: var(--bg-white);
            border-radius: 30px;
            padding: 3rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-light);
            position: relative;
            z-index: 2;
            max-width: 700px;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .report-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }
        
        .type-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 2rem;
            border-radius: 50px;
            font-weight: 700;
            font-size: 1rem;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .type-badge.lost {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #991b1b;
        }
        
        .type-badge.found {
            background: linear-gradient(135deg, #dcfce7, #bbf7d0);
            color: #166534;
        }
        
        .report-title {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            text-align: center;
        }
        
        .report-subtitle {
            color: var(--text-secondary);
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .form-section {
            margin-bottom: 2rem;
        }
        
        .form-label {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            display: block;
        }
        
        .form-control, .form-select {
            border: 2px solid var(--border-light);
            border-radius: 15px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            width: 100%;
        }
        
        .form-control:focus, .form-select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(42, 111, 151, 0.1);
        }
        
        .form-control.is-invalid {
            border-color: #ef4444;
        }
        
        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }
        
        .file-upload {
            border: 2px dashed var(--border-light);
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            background: var(--bg-light);
        }
        
        .file-upload:hover {
            border-color: var(--primary);
            background: var(--primary-soft);
        }
        
        .file-upload i {
            font-size: 2rem;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        
        .file-upload p {
            color: var(--text-secondary);
            margin: 0;
        }
        
        .file-upload small {
            color: var(--text-muted);
            display: block;
            margin-top: 0.5rem;
        }
        
        .file-upload.has-file {
            border-color: #10b981;
            background: #dcfce7;
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
        
        @media (max-width: 768px) {
            .report-card {
                padding: 2rem;
            }
            
            .report-title {
                font-size: 1.75rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="components/navbar.jsp" />

    <div class="report-container">
        <div class="report-shapes">
            <div class="report-shape report-shape-1"></div>
            <div class="report-shape report-shape-2"></div>
            <div class="report-shape report-shape-3"></div>
        </div>
        
        <div class="report-card" data-aos="fade-up" data-aos-duration="800">
            <div class="text-center">
                <span class="type-badge ${type == 'LOST' ? 'lost' : 'found'}">
                    <i class="bi ${type == 'LOST' ? 'bi-flag-fill' : 'bi-gift-fill'} me-2"></i>
                    REPORTING ${type} ITEM
                </span>
            </div>
            
            <h2 class="report-title">Tell us what's happened</h2>
            <p class="report-subtitle">Provide as much detail as possible to help others identify your item.</p>

            <form action="/report-item" method="POST" enctype="multipart/form-data" id="reportForm">
                <input type="hidden" name="status" value="${type}">
                
                <div class="form-section">
                    <label class="form-label">
                        <i class="bi bi-tag text-primary me-1"></i>
                        Item Title
                    </label>
                    <input type="text" 
                           name="title" 
                           class="form-control" 
                           placeholder="e.g., Blue Backpack, iPhone 13, Student ID Card"
                           required
                           maxlength="100">
                    <div class="help-text">
                        <i class="bi bi-info-circle"></i>
                        Be specific - this helps with search results
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="bi bi-grid text-primary me-1"></i>
                                Category
                            </label>
                            <select name="category" class="form-select" required>
                                <option value="">Select a category</option>
                                <option value="Electronics">📱 Electronics</option>
                                <option value="Personal Items">👕 Personal Items</option>
                                <option value="Documents">📄 Documents</option>
                                <option value="Bags & Wallets">🎒 Bags & Wallets</option>
                                <option value="Accessories">⌚ Accessories</option>
                                <option value="Books">📚 Books</option>
                                <option value="Others">❓ Others</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-section">
                            <label class="form-label">
                                <i class="bi bi-geo-alt text-primary me-1"></i>
                                Location
                            </label>
                            <input type="text" 
                                   name="location" 
                                   class="form-control" 
                                   placeholder="e.g., Library, Student Union, Cafeteria"
                                   required>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <label class="form-label">
                        <i class="bi bi-card-text text-primary me-1"></i>
                        Description
                    </label>
                    <textarea name="description" 
                              class="form-control" 
                              placeholder="Describe the item in detail - color, brand, unique features, what's inside, etc."
                              required></textarea>
                    <div class="help-text">
                        <i class="bi bi-lightbulb"></i>
                        The more details you provide, the easier it is to identify
                    </div>
                </div>

                <div class="form-section">
                    <label class="form-label">
                        <i class="bi bi-image text-primary me-1"></i>
                        Upload Image
                    </label>
                    <div class="file-upload" id="fileUpload" onclick="document.getElementById('imageInput').click()">
                        <i class="bi bi-cloud-upload"></i>
                        <p>Click to upload or drag and drop</p>
                        <small>PNG, JPG, JPEG up to 5MB</small>
                    </div>
                    <input type="file" 
                           id="imageInput"
                           name="image" 
                           class="d-none" 
                           accept="image/*"
                           onchange="handleFileSelect(this)">
                    <div class="help-text">
                        <i class="bi bi-camera"></i>
                        Clear photos help in faster identification and return
                    </div>
                </div>

                <!-- Matching Items Section (Initially Hidden) -->
                <div id="matchingItemsSection" class="mt-4 d-none">
                    <h5 class="fw-bold mb-3">
                        <i class="bi bi-stars text-warning me-2"></i>
                        Potential Matches Found!
                    </h5>
                    <p class="text-muted small mb-3">One of these items might be yours. You can claim it instead of submitting a new report.</p>
                    <div id="matchesContainer" class="row g-3">
                        <!-- Matches will be injected here -->
                    </div>
                    <hr class="my-4">
                </div>

                <button type="submit" class="btn-submit" id="submitBtn">
                    <i class="bi bi-send"></i>
                    Submit Report
                </button>

                <a href="/dashboard" class="btn-cancel">
                    <i class="bi bi-x-circle"></i>
                    Cancel & Back
                </a>
            </form>
        </div>
    </div>

    <jsp:include page="components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init();

        // Matching items logic
        const categorySelect = document.querySelector('select[name="category"]');
        const matchingSection = document.getElementById('matchingItemsSection');
        const matchesContainer = document.getElementById('matchesContainer');
        const reportStatus = "${type}";

        categorySelect.addEventListener('change', function() {
            const category = this.value;
            if (category) {
                fetch(`/api/items/match?category=\${encodeURIComponent(category)}&status=\${reportStatus}`)
                    .then(response => response.json())
                    .then(items => {
                        if (items.length > 0) {
                            displayMatches(items);
                        } else {
                            matchingSection.classList.add('d-none');
                        }
                    })
                    .catch(err => console.error('Error fetching matches:', err));
            } else {
                matchingSection.classList.add('d-none');
            }
        });

        function displayMatches(items) {
            matchesContainer.innerHTML = '';
            items.forEach(item => {
                const col = document.createElement('div');
                col.className = 'col-md-6';
                col.innerHTML = `
                    <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden">
                        <div class="row g-0">
                            <div class="col-4">
                                \${item.imagePath ? 
                                    `<img src="/uploads/\${item.imagePath}" class="img-fluid h-100 object-fit-cover" alt="Item">` :
                                    `<div class="bg-light h-100 d-flex align-items-center justify-content-center text-primary">
                                        <i class="bi bi-image fs-4"></i>
                                    </div>`
                                }
                            </div>
                            <div class="col-8">
                                <div class="card-body p-3">
                                    <h6 class="card-title fw-bold mb-1 text-truncate">\${item.title}</h6>
                                    <p class="card-text small text-muted mb-2">
                                        <i class="bi bi-geo-alt me-1"></i>\${item.location}
                                    </p>
                                    <a href="/claim-item/\${item.id}" class="btn btn-sm btn-primary rounded-pill px-3">
                                        <i class="bi bi-shield-check me-1"></i>Claim This
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                matchesContainer.appendChild(col);
            });
            matchingSection.classList.remove('d-none');
            AOS.refresh();
        }

        // File upload handling
        function handleFileSelect(input) {
            const fileUpload = document.getElementById('fileUpload');
            const fileName = input.files[0]?.name;
            
            if (fileName) {
                fileUpload.classList.add('has-file');
                fileUpload.innerHTML = `
                    <i class="bi bi-check-circle-fill" style="color: #10b981;"></i>
                    <p style="color: #10b981;">Selected: \${fileName}</p>
                    <small>Click to change</small>
                `;
            } else {
                fileUpload.classList.remove('has-file');
                fileUpload.innerHTML = `
                    <i class="bi bi-cloud-upload"></i>
                    <p>Click to upload or drag and drop</p>
                    <small>PNG, JPG, JPEG up to 5MB</small>
                `;
            }
        }

        // Form validation
        document.getElementById('reportForm').addEventListener('submit', function(e) {
            // ... (rest of validation)
        });

        // Pre-fill and trigger match on load if parameters exist
        window.addEventListener('load', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const prefillCategory = urlParams.get('category');
            const prefillTitle = urlParams.get('title');

            if (prefillCategory) {
                categorySelect.value = prefillCategory;
                // Trigger change event to fetch matches
                categorySelect.dispatchEvent(new Event('change'));
            }
            if (prefillTitle) {
                document.querySelector('input[name="title"]').value = prefillTitle;
            }
        });
    </script>
</body>
</html>