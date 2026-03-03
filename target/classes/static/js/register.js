document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form[action="/register"]');
    if (form) {
        form.addEventListener('submit', function(event) {
            const password = form.querySelector('input[name="password"]').value;
            const confirmPassword = form.querySelector('input[name="confirmPassword"]').value;

            if (password !== confirmPassword) {
                event.preventDefault();
                alert('Passwords do not match!');
            }
        });
    }
});
