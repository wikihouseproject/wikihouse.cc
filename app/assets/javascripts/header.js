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

var subHeadHeight;
var origHeight;
var origLogoHeight;
var doneCount;

var setVars = function() {
  console.log('resize')
  $('header#main-header').css('height', 'auto')
  subHeadHeight = parseInt($('header#sub-header').css('height'))// - $('header#sub-header').offset().top()
  origHeight = $('header#main-header').height();
  origLogoHeight = $('#logo').height();
  doneCount = false;
}

$(document).on("ready pjax:success", setVars);
$(window).resize(setVars);


$(document).ready(function() {
  $('#side-nav').click(function() {
    $('#toggle-menu').removeClass('open')
    $('#side-nav').hide()
  });
  $('#toggler').click(function(event) {
    event.preventDefault();
    $('#toggle-menu').toggleClass('open');
    $('#side-nav').fadeIn('fast')
  });

  $(window).scroll(function() {

    var scrollPos = $(window).scrollTop();

    if ( scrollPos - subHeadHeight >= 0 ) {
      $('header#main-header').addClass('drop-shadow')
      $('header#sub-header').removeClass('drop-shadow')
    } else {
      $('header#main-header').removeClass('drop-shadow')
      $('header#sub-header').addClass('drop-shadow')
    }

    if ($('#counts').length > 0) {
      if (scrollPos > ($('#counts').offset().top - $(window).height()) && !doneCount) {
        doneCount = true;
        window.doCount();
      }
    }


    if ($('header#main-header').hasClass('large')) {
      $('#logo').height( parseInt(Math.max(origLogoHeight-scrollPos, 50)) );
      $('header#main-header').height( parseInt(Math.max(origHeight-scrollPos, 75)) ); // fix this
    } else {
      $('header#main-header').height( parseInt(Math.max(origHeight-scrollPos, origHeight)) );
    }
    $('header#sub-header .container').css('opacity', Math.max(0, 1 - (scrollPos-10)/30) )

  });

});

// $(document).on('pjax:send', function(e) {
//   console.log(e.target.URL)
// })

$(document).on('pjax:success', function() {
  $('#main-menu a').removeClass('active')
  $('#main-menu a[href="' + window.location.pathname + '"]').addClass('active')
});
