// document.addEventListener("ready", function() {
$(document).ready(function() {
  if ( $('#slider').length > 0) {
    $('#slider').delay(100).fadeIn()
    $('#slider').unslider({
      arrows: false,
      animation: 'fade'
    })
  }
})
