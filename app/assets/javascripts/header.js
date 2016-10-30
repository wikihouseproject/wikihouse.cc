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

// document.addEventListener("turbolinks:load", function() {
$(document).ready(function() {
  var subHeadHeight = $('header#sub-header').height() + $('header#main-header').height()

  var origHeight = $('header#main-header').height();
  var origLogoHeight = $('#logo').height();
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

    $('header#main-header').height( parseInt(Math.max(origHeight-scrollPos, 75)) );
    $('#logo').height( parseInt(Math.max(origLogoHeight-scrollPos, 50)) );

    $('header#sub-header .container').css('opacity', Math.max(0, 1 - (scrollPos-10)/30) )
  })

  $('#toggleMenu').click(function(event) {
    event.preventDefault();
    $('#side-nav').fadeIn('fast')
  })

})

$(document).on('pjax:success', function() {
  $('#main-menu a').removeClass('active')
  $('#main-menu a[href="' + window.location.pathname + '"]').addClass('active')
});
