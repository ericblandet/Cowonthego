import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Work differently...", "Think CowonTheGo", "C O W O N T H E G O"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };