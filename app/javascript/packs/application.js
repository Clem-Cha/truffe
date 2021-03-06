// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initUpdateSearchbarOnScroll } from '../components/searchbar-index';
import { initUpdateSearchbarShowOnScroll } from '../components/searchbar-show';
import { showSearchbarSmall } from '../components/searchbar-dogs-bookings';
import { initReviewOnHover } from '../components/review';
import { loadDynamicBannerText } from "../components/banner";
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFlatpickr } from "../plugins/flatpickr";
import { initCalendar } from "../components/calendar";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initUpdateNavbarOnScroll();
  loadDynamicBannerText();
  initReviewOnHover();
  initUpdateSearchbarOnScroll();
  initUpdateSearchbarShowOnScroll();
  initAutocomplete();
  initFlatpickr();
  showSearchbarSmall();
  initCalendar();
});
