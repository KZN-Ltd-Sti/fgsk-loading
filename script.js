// Event listener for loading screen events
window.addEventListener('message', function(e) {
    if (e.data.eventName === 'loadProgress') {
        const progress = e.data.loadFraction * 100;
        const progressBar = document.getElementById('progressBar');
        const loadingText = document.getElementById('loadingText');

        progressBar.style.width = progress + '%';
        loadingText.textContent = 'Loading... ' + Math.floor(progress) + '%';
    }
});
