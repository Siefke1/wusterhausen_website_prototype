import Swiper from 'https://unpkg.com/swiper@8/swiper-bundle.esm.browser.min.js'


  const swiper = new Swiper('.swiper', {
      grid: {
    column: 4,
  },
    scrollbar: {
    el: '.swiper-scrollbar',
    draggable: true,
  },
   autoplay: {
   delay: 5000,
 },
  // Optional parameters
  direction: 'horizontal',


  // If we need pagination

  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },


  // And if we need scrollbars
});
