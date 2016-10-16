// document.addEventListener("turbolinks:load", function() {

//   $('header#main-header').css('height', 'auto') // 'auto'

//   var headerHeight = $('header#main-header').height()

//   if (headerHeight < 50) {
//     $('header#main-header').css('height', 50) // 'auto'
//   }

//   $('body').css('padding-top', headerHeight )

//   $(window).scroll(function() {
//     var newHeight = Math.max(headerHeight - $(window).scrollTop(), 50)
//     $('header#main-header').css('height', newHeight )
//   })
// })

document.addEventListener("turbolinks:load", function() {
  var subHeadHeight = $('header#sub-header').height()
  $(window).scroll(function() {
    // if ($(window).scrollTop() > 0) {
    //   $('header#main-header').addClass('drop-shadow')
    // } else {
    //   $('header#main-header').removeClass('scrolled')
    // }
    // var newHeight = Math.max(headerHeight - $(window).scrollTop(), 50)
    // $('header#main-header').css('height', newHeight )

    var scrollPos = $(window).scrollTop()
    if ( scrollPos - subHeadHeight > 0 ) {
      $('header#sub-header').removeClass('drop-shadow')
      $('header#main-header').addClass('drop-shadow')
    } else {
      $('header#sub-header').addClass('drop-shadow')
      $('header#main-header').removeClass('drop-shadow')
    }
  })

  $('#toggleMenu').click(function(event) {
    event.preventDefault();
    $('#side-nav').fadeIn('fast')
  })
})
