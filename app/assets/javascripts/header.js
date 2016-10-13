document.addEventListener("turbolinks:load", function() {

  $('header#main-header').css('height', 'auto')

  var headerHeight = $('header#main-header').height()

  $('body').css('padding-top', headerHeight )


  $(window).scroll(function() {
    var newHeight = Math.max(headerHeight - $(window).scrollTop() + 20, 50)
    $('header#main-header').css('height', newHeight )
  })
})
