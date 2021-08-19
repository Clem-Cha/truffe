const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const button = document.querySelector('.nav-link')
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 10 && document.location.pathname === "/") {
        navbar.classList.add('navbar-truffe-transparent');
        button.style.color = "white";
      } else {
        navbar.classList.remove('navbar-truffe-transparent');
        button.style.color = "lightgray";
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
