const endDate = new Date();
endDate.setDate(endDate.getDate() + 3);
endDate.setHours(23, 59, 59, 999);

function updateCountdown() {
    const now = new Date();
    const timeLeft = endDate - now;

    const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
    const hours = Math.floor((timeLeft / (1000 * 60 * 60)) % 24);
    const minutes = Math.floor((timeLeft / (1000 * 60)) % 60);
    const seconds = Math.floor((timeLeft / 1000) % 60);

    document.getElementById("days").textContent = String(days).padStart(2, '0');
    document.getElementById("hours").textContent = String(hours).padStart(2, '0');
    document.getElementById("minutes").textContent = String(minutes).padStart(2, '0');
    document.getElementById("seconds").textContent = String(seconds).padStart(2, '0');
}

setInterval(updateCountdown, 1000);
updateCountdown();

function scrollLeftSlider() {
    document.getElementById('productSlider').scrollBy({ left: -400, behavior: 'smooth' });
}
function scrollRightSlider() {
    document.getElementById('productSlider').scrollBy({ left: 400, behavior: 'smooth' });
}