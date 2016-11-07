// document.addEventListener("ready", function() {
$(document).on("ready pjax:success", function() {
  if ( $('.slider').length > 0) {
    $('.slider li').fadeIn('slow')
    $('.slider').unslider({
      // arrows: false,
      animation: 'fade'
    })
  }
})
