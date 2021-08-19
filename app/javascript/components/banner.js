import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  console.log('hello');
  new Typed('#banner-typed-text', {
    strings: ["Find the right dog to enlighten any moment of your life 🐶"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
