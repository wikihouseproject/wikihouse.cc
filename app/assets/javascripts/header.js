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

  $('#side-nav').click(function() {
    $('#side-nav').hide()
  })

  var subHeadHeight = parseInt($('header#sub-header').css('height'))// - $('header#sub-header').offset().top()


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
    // console.log( $('#counts').offset().top - $(window).height(), scrollPos)

    if ( scrollPos - subHeadHeight >= 0 ) {
      $('header#main-header').addClass('drop-shadow')
      $('header#sub-header').removeClass('drop-shadow')
    } else {
      $('header#main-header').removeClass('drop-shadow')
      $('header#sub-header').addClass('drop-shadow')
    }

    $('header#main-header').height( parseInt(Math.max(origHeight-scrollPos, 75)) );
    if ($('header#main-header').hasClass('large')) {
      $('#logo').height( parseInt(Math.max(origLogoHeight-scrollPos, 50)) );
    }
    $('header#sub-header .container').css('opacity', Math.max(0, 1 - (scrollPos-10)/30) )

  })

  $('#toggleMenu').click(function(event) {
    event.preventDefault();
    $('#side-nav').fadeIn('fast')
  })

  // if (window.location.pathname === "/") {
  //   $('header#main-header').addClass('large')
  // } else {
  //   $('header#main-header').removeClass('large')
  // }

})

$(document).on('pjax:send', function(e) {
  console.log(e.target.URL)
})

$(document).on('pjax:success', function() {
  $('#main-menu a').removeClass('active')
  $('#main-menu a[href="' + window.location.pathname + '"]').addClass('active')
});
