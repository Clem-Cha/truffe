const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const buttons = document.querySelectorAll('.nav-link')
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 10 && document.location.pathname === "/") {
        navbar.classList.add('navbar-truffe-transparent');
        buttons.forEach((button) => {
          button.style.color = "white";
        });
      } else {
        navbar.classList.remove('navbar-truffe-transparent');
        buttons.forEach((button) => {
          button.style.color = "rgba(0, 0, 0, 0.55)";
        });
      }
    }); 
  }
}

export { initUpdateNavbarOnScroll };