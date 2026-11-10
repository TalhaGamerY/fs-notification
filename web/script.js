const container = document.getElementById('notification-container');

const themes = {
    info: { color: '#3498db', icon: 'fa-info-circle' },
    success: { color: '#2ecc71', icon: 'fa-check-circle' },
    warning: { color: '#f1c40f', icon: 'fa-exclamation-triangle' },
    error: { color: '#e74c3c', icon: 'fa-times-circle' }
};

window.addEventListener('message', (event) => {
    if (event.data.action === 'notify') {
        createNotification(event.data);
    }
});

function createNotification(data) {
    const theme = themes[data.type] || themes.info;
    
    // Set position class on container
    container.className = data.position;

    // Create Element
    const notif = document.createElement('div');
    notif.className = 'notification';
    notif.style.borderLeftColor = theme.color;

    notif.innerHTML = `
        <div class="notif-content">
            <div class="notif-icon" style="color: ${theme.color}">
                <i class="fas ${theme.icon}"></i>
            </div>
            <div class="notif-text-container">
                <div class="notif-title">${data.title}</div>
                <div class="notif-msg">${data.message}</div>
            </div>
        </div>
        <div class="progress-bar">
            <div class="progress-fill" style="background: ${theme.color}"></div>
        </div>
    `;

    container.appendChild(notif);

    // --- UPDATED SOUND LOGIC ---
    if (data.useSound) {
        // Since script.js is in /web/, we point to sounds/notify.mp3
        const audio = new Audio('sounds/notify.mp3'); 
        audio.volume = data.volume || 0.5;
        
        // We use .catch to prevent the "NotSupportedError" from crashing the script
        audio.play().catch((err) => {
            console.warn("F-Notification: Audio play was blocked or file is missing.", err);
        });
    }

    // Progress Bar Animation
    const progressFill = notif.querySelector('.progress-fill');
    progressFill.animate([
        { width: '100%' },
        { width: '0%' }
    ], {
        duration: data.duration,
        easing: 'linear'
    });

    // Auto-remove
    setTimeout(() => {
        notif.classList.add('fade-out');
        setTimeout(() => {
            notif.remove();
        }, 400);
    }, data.duration);
}