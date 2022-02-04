import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

$(function () {
  setInterval(function () {
    $('.alert').slideUp(500);
  }, 1000);
});

export { application }
