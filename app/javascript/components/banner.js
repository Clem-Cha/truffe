import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById('banner-typed-text')) {
    new Typed('#banner-typed-text', {
      strings: ["Find the right dog to enlighten any moment of your life 🐶"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
