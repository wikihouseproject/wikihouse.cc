$(function(){
  if ($('.typed').length > 0) {
    $(".typed").typed({
      strings: ["The future of homes.^500<br/>By everyone,^500 for<br/>everyone.", "Simple,^300 sustainable,^300<br/> open building<br/> technologies."],
      backDelay: 2000,
      startDelay: 1000,
      typeSpeed: 15,
      loop: true
    });
  }
});
