document.addEventListener("turbolinks:load", function() {
  if ( $('#slider').length > 0) {
    $('#slider').unslider({
      arrows: false,
      animation: 'fade'
    })
  }
})
