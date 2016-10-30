$(document).ready(function() {
$(window)
var i = 1;
$('.count').each(function(el) {
  console.log(i)
  var numAnim = new CountUp( ("c"+i), 0, parseInt($(this).html()));
  numAnim.start();
  i++;
})
// var numAnim = new CountUp("SomeElementYouWantToAnimate", 24.02, 99.99);
// numAnim.start();
})
