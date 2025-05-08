const button = document.getElementById('button1');

button.addEventListener('click', () => {
  document.body.classList.add('fade-out');
  setTimeout(() => {
    window.location.href = 'login.html';
  }, 5);
});