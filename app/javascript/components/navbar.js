const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const buttons = document.querySelectorAll('.nav-link')
  const bells = document.querySelectorAll('.fa-bell')

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 660 && document.location.pathname === "/") {
        navbar.classList.remove('navbar-truffe-transparent');
        buttons.forEach((button) => {
          button.style.color = "rgba(0, 0, 0, 0.55)";
        });
        bells.forEach((bell) => {
          bell.style.color = "rgba(0, 0, 0, 0.55)";
        });
      } else if (window.scrollY >= 470 && document.location.pathname === "/") {
        navbar.classList.add('navbar-truffe-transparent');
        buttons.forEach((button) => {
          button.style.color = "white";
        });
        bells.forEach((bell) => {
          bell.style.color = "white";
        });
      } else if (window.scrollY >= 360 && document.location.pathname === "/") {
        navbar.classList.remove('navbar-truffe-transparent');
        buttons.forEach((button) => {
          button.style.color = "rgba(0, 0, 0, 0.55)";
        });
        bells.forEach((bell) => {
          bell.style.color = "rgba(0, 0, 0, 0.55)";
        });
      } else if (window.scrollY >= 15 && document.location.pathname === "/") {
        navbar.classList.add('navbar-truffe-transparent');
        buttons.forEach((button) => {
          button.style.color = "white";
        });
        bells.forEach((bell) => {
          bell.style.color = "white";
        });
      } else {
        navbar.classList.remove('navbar-truffe-transparent');
        buttons.forEach((button) => {
          button.style.color = "rgba(0, 0, 0, 0.55)";
        });
        bells.forEach((bell) => {
          bell.style.color = "rgba(0, 0, 0, 0.55)";
        });
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
