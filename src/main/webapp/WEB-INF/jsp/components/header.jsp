<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap 5.3 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<!-- Google Fonts (Inter) -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<!-- AOS Animation Library -->
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
<!-- Education Theme CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/education-theme.css">
<!-- Favicon (optional - you can add your own) -->
<link rel="icon" type="image/x-icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%232a6f97'%3E%3Cpath d='M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5'/%3E%3C/svg%3E">

<script>
    // Global Content Protection Script
    document.addEventListener('contextmenu', function(e) {
        e.preventDefault();
    }, false);

    document.addEventListener('keydown', function(e) {
        // Disable F12 (123)
        // Ctrl+Shift+I (73), Ctrl+Shift+J (74), Ctrl+Shift+S (83)
        // Ctrl+U (85), Ctrl+S (83)
        // PrintScreen (44)
        if (e.keyCode == 123 || 
            (e.ctrlKey && e.shiftKey && (e.keyCode == 73 || e.keyCode == 74 || e.keyCode == 83)) || 
            (e.ctrlKey && e.keyCode == 85) ||
            (e.ctrlKey && e.keyCode == 83) ||
            (e.keyCode == 44)) {
            
            if (e.keyCode == 44) {
                // Try to clear clipboard if PrintScreen is pressed
                navigator.clipboard.writeText("");
                alert("Screenshots are disabled on this portal.");
            }
            
            e.preventDefault();
            return false;	
        }
    }, false);

    // Disable dragging of images
    document.addEventListener('dragstart', function(e) {
        if (e.target.nodeName === 'IMG') {
            e.preventDefault();
        }
    }, false);
</script>