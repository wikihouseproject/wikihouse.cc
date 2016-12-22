var subHeadHeight,origHeight,origLogoHeight,doneCount,scrollHeight

// var uniformHeights = function(selector, pjax) {
//   if (pjax) {
//     selector = ".js-Pjax-add" + selector
//   }
//   var el = $(selector);
//   if (el.length < 1) return;
//   // console.log(el)
//   var tallest = 0;
//   el.css('height', 'auto');
//   el.each(function() {
//     // console.log($(this).height())
//     if ($(this).height() > tallest) {
//       tallest = $(this).height();
//     }
//   });
//   el.css('height', tallest);
// }

var setVars = function() {
  $('header#main-header, #logo').attr('style', null);
  subHeadHeight = parseInt($('header#sub-header').css('height'))// - $('header#sub-header').offset().top()
  origHeight = parseInt($('header#main-header').height());
  // origLogoHeight = parseInt($('#logo').height());
  doneCount = false;
}

$(window).resize( _.debounce(function() {
  $('.ink').removeClass('animate')
  setVars()
}, 500));

$(document).on("pjax:success", function() {
  $('#main-menu a').removeClass('active')
  $('#main-menu a[href="' + window.location.pathname + '"]').addClass('active')
});

$(document).on('pjax:success ready', function() {

  var swiper = new Swiper('.main-slider-container', {
    loop: true,
    slidesPerView: 1,
    autoplay: 3500,
    autoplayDisableOnInteraction: true,
    speed: 900
  })

  var swiper = new Swiper('#secondary-slider', {
    pagination: '.sub-slider-pagination',
    paginationClickable: true,
    loop: true,
    slidesPerView: 1,
    speed: 900
  })

  // $('select').niceSelect()

  // if ($('#enquiry-form').length > 0 && $('.enquiry-desc').length > 0) {
    $('.enquiry-form').each(function() {
      $(this).prepend($(this).find('.enquiry-desc'))
    })
  // }

  // uniformHeights('.big-type-link', true);
  // uniformHeights('.type-row', true);

  setVars()
  doScroll()
  // // setTimeout(function() { $('.ink').remove(); $('header .js-Pjax-remove').remove(); }, 1000);
  // // $('.hero, .big-slider').css('height', $(window).innerHeight() - $('header#main-header').height())

  $('header').removeClass('drop-shadow')
  $('header#sub-header').addClass('drop-shadow')

  if ($('.hidden-fields').length > 0) {
    $('.hidden-fields').hide()
    $('.hidden-toggle').on('change', function() {
      $('.hidden-fields').fadeIn()
    });
  }

})

$(document).on('ready', function() {

  $('#main').on('click', '#video-toggle', function (event) {
    event.preventDefault()
    $('body').removeClass('side-nav')
    $('body').addClass('overlay-visible video')
    document.getElementById('sleep-video').currentTime = 0;
  })

  $('#overlay').on('click', 'video', function (event) {
    event.stopPropogation()
  })

  $('#overlay').on('click', 'a', function (event) {
    $('.ink').removeClass('animate')
    $('body').removeClass('overlay-visible video side-nav')
  })

  // $('#overlay').click(function() {
  //   $('body').removeClass('overlay-visible side-nav video')
  // });

  $('#main-toggler').click(function(event) {
    event.preventDefault()
    $('.ink').removeClass('animate')
    $('body').removeClass('video')
    $('body').addClass('side-nav')
    $('body').toggleClass('overlay-visible');
  })

});

var doScroll = function() {
  var scrollPos = $(window).scrollTop()

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

  // console.log( parseInt(Math.max(origLogoHeight-scrollPos, 50)) )
  // $('#logo-link').height( parseInt(Math.max(origLogoHeight-scrollPos, 50)) );
  $('header#main-header').height( parseInt(Math.max(origHeight-scrollPos, 75)) );

  $('body:not(.a-donate) header#sub-header > div').css('opacity', Math.max(0, 1 - (scrollPos-10)/30) )

}

$(window).on('scroll', doScroll)
