const initUpdateSearchbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const searchbarIndex = document.querySelector('.search-bar');
  const searchbarSmall = document.querySelector('.searchbar-small');
  const index = document.querySelector('.index-js');
  console.log(navbar);
  console.log(searchbarIndex);
  console.log(searchbarSmall);
  console.log(index);

  if (index) {
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= 10) {
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
