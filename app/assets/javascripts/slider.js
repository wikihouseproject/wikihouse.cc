// document.addEventListener("ready", function() {
$(document).on("ready pjax:success", function() {
  if ( $('.slider').length > 0) {
    $('.slider li').fadeIn('slow')
    var slider = $('.slider').unslider({
      // arrows: false,
      animation: 'fade'
    })
    slider.on('unslider.change', function(event, index, slide) {
      $('.slider .hidden').removeClass('hidden')
    })
  }
  
})
