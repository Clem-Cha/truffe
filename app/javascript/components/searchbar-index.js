const initUpdateSearchbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const searchbarIndex = document.querySelector('.search-bar');
  const searchbarSmall = document.querySelector('.searchbar-small');

  if (navbar) {
    if (searchbarIndex)  {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= 10 && document.location.pathname === "/dogs/") {
          searchbarIndex.classList.add('d-none');
          searchbarSmall.classList.remove('d-none');
        } else {
          searchbarIndex.classList.remove('d-none');
          searchbarSmall.classList.add('d-none');
        }
      });
    }
  }
}

export { initUpdateSearchbarOnScroll };
// Import in the end to application.js
