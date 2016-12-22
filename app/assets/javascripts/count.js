window.doCount = function() {
  var i = 1;
  try {
    $('.count').each(function(el) {
      var numAnim = new CountUp( ("c"+i), 0, parseInt($(this).html()));
      numAnim.start();
      i++;
    });
  } catch(e) {}
}
