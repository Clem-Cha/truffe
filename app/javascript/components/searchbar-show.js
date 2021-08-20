const initUpdateSearchbarShowOnScroll = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const searchbar = document.querySelector('.search-bar');
  const searchbarSmall = document.querySelector('.searchbar-small');
  const show = document.querySelector('.show-js');

  if (navbar) {
    if (show) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= 15) {
          searchbar.classList.add('d-none');
          searchbarSmall.classList.remove('d-none');
        } else {
          searchbar.classList.remove('d-none');
          searchbarSmall.classList.add('d-none');
        }
      });
    }
  }
}

export { initUpdateSearchbarShowOnScroll };
