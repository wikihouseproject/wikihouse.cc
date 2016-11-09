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
var scrollHeight;

var uniformHeights = function(selector, pjax) {
// needs fixing!!
  if (pjax) {
    selector = ".js-Pjax-add" + selector
  }
  var el = $(selector);
  if (el.length < 1) return;
  // console.log(el)
  var tallest = 0;
  el.css('height', 'auto');
  el.each(function() {
    // console.log($(this).height())
    if ($(this).height() > tallest) {
      tallest = $(this).height();
    }
  });
  el.css('height', tallest);
}

var setVars = function() {
  $('header#main-header, #logo').attr('style', null)
  subHeadHeight = parseInt($('header#sub-header').css('height'))// - $('header#sub-header').offset().top()
  origHeight = parseInt($('header#main-header').height());
  origLogoHeight = parseInt($('#logo').height());
  doneCount = false;

}

$(window).resize(setVars);
// $(window).load(setVars);

$(document).on("pjax:success", function() {
  uniformHeights('.big-type-link', true);
  uniformHeights('.type-row', true);

  if (window.location.pathname === "/") {
    $('body').addClass('large')
  } else {
    $('body').removeClass('large')
  }
});

$(document).on('pjax:success ready', function() {

  $('.hidden-fields').hide()
  // setTimeout(function() { $('.ink').remove(); $('header .js-Pjax-remove').remove(); }, 1000);
  setVars();
  // $('.hero, .big-slider').css('height', $(window).innerHeight() - $('header#main-header').height())
  $('header').removeClass('drop-shadow')
  $('header#sub-header').addClass('drop-shadow')

  $('.hidden-toggle').on('change', function() {
    $('.hidden-fields').fadeIn()
  })
})

$(document).ready(function() {


  uniformHeights('.big-type-link', false);
  uniformHeights('.type-row', false);

  $('#side-nav').click(function() {
    $('body').removeClass('open-menu')
    // $('#toggle-menu').removeClass('open')
    // $('#side-nav').hide()
  });
  $('#main-toggler').click(function(event) {
    $('.ink').remove();
    event.preventDefault();
    $('body').toggleClass('open-menu');
    // $('#toggle-menu').toggleClass('open');
    // $('#side-nav').fadeIn('fast')
  });


});

var doScroll = function() {
  var scrollPos = $(window).scrollTop();

  var h = -75;
  if (subHeadHeight === 75) {
    h = -75;
  }

  // if (!$('body').hasClass('large')) {

    if ( scrollPos - subHeadHeight >= h ) {
      $('header#main-header').addClass('drop-shadow')
      $('header#sub-header').removeClass('drop-shadow')
    } else {
      $('header#main-header').removeClass('drop-shadow')
      $('header#sub-header').addClass('drop-shadow')
    }
  // }

  if ($('#counts').length > 0) {
    if (scrollPos > ($('#counts').offset().top - $(window).height()) && !doneCount) {
      doneCount = true;
      window.doCount();
    }
  }


  $('#logo').height( parseInt(Math.max(origLogoHeight-scrollPos, 50)) );
  $('header#main-header').height( parseInt(Math.max(origHeight-scrollPos, 75)) ); // fix this

  // } else {
  //   $('header#main-header').height( parseInt(Math.max(origHeight-scrollPos, origHeight)) );
  // }

  $('header#sub-header .container').css('opacity', Math.max(0, 1 - (scrollPos-10)/30) )

}

$(document).on('ready pjax:success', doScroll)
$(window).on('scroll', _.debounce(doScroll, 10))

// $(document).on('pjax:send', function(e) {
//   console.log(e.target.URL)
// })

$(document).on('pjax:success', function() {
  $('#main-menu a').removeClass('active')
  $('#main-menu a[href="' + window.location.pathname + '"]').addClass('active')
});
