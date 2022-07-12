import Swiper from 'https://unpkg.com/swiper@8/swiper-bundle.esm.browser.min.js'


  const swiper = new Swiper('.swiper', {
    scrollbar: {
    el: '.swiper-scrollbar',
    draggable: true,
  },
    slidesPerView: 3,
    spaceBetween: 5,
    breakpoints: {
    // when window width is >= 320px
    320: {
      slidesPerView: 1,
      spaceBetween: 20
    },
    // when window width is >= 480px
    480: {
      slidesPerView: 2,
      spaceBetween: 30
    },
    // when window width is >= 640px
    640: {
      slidesPerView: 3,
      spaceBetween: 40
    }
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
