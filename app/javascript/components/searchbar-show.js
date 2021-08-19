const initUpdateSearchbarShowOnScroll = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const searchbar = document.querySelector('.search-bar');
  const searchbarSmall = document.querySelector('.searchbar-small');
  const show = document.querySelector('.show-js');

  if (navbar) {
    console.log("hello");
    console.log(show);
    if (show) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= 15) {
          console.log("hello");
          searchbar.classList.add('d-none');
          searchbarSmall.classList.remove('d-none');
        } else {
          console.log("ciao");
          searchbar.classList.remove('d-none');
          searchbarSmall.classList.add('d-none');
        }
      });
    }
  }
}

export { initUpdateSearchbarShowOnScroll };
