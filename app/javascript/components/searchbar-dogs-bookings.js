const showSearchbarSmall = () => {
  const navbar = document.querySelector('.navbar-truffe');
  const searchbarSmall = document.querySelector('.searchbar-small');
  const myDogs = document.querySelector('.js-dashboard');
  const myBookings = document.querySelector('.js-bookings');

  if (myDogs || myBookings) {
    if (navbar) {
      searchbarSmall.classList.remove('d-none');
    }
  }
}
export { showSearchbarSmall };
