// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


//Flash message timeout

// SWIPER
import Swiper from 'https://unpkg.com/swiper@8/swiper-bundle.esm.browser.min.js'


  const swiper = new Swiper('.swiper', {
    scrollbar: {
    el: '.swiper-scrollbar',
    draggable: true,
  },
    slidesPerView: 3,
    spaceBetween: 5,
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
