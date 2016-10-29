// document.addEventListener("ready", function() {
$(document).ready(function() {
  $('#slider').delay(100).fadeIn()
  if ( $('#slider').length > 0) {
    $('#slider').unslider({
      arrows: false,
      animation: 'fade'
    })
  }
})
