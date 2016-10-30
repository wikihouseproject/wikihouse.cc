// $(function() {

//     var $counts = $('#counts');

//     console.log($('#counts').offset() - $('#counts').height())

//     console.log($counts.offset().top)

//     $('body').scrollspy({
//         min: $counts.offset().top,
//         onEnter: function(element, position) {
//           console.log("A")
//           var i = 1;
//           $('.count').each(function(el) {
//             console.log(i)
//             var numAnim = new CountUp( ("c"+i), 0, parseInt($(this).html()));
//             numAnim.start();
//             i++;
//           })
//         },
//         onLeave: function(element, position) {
//           console.log("b")
//           // $counts.removeClass('fixed');
//         }
//     });

// });

// $(document).ready(function() {
// var i = 1;
// $('.count').each(function(el) {
//   console.log(i)
//   var numAnim = new CountUp( ("c"+i), 0, parseInt($(this).html()));
//   numAnim.start();
//   i++;
// })
// // var numAnim = new CountUp("SomeElementYouWantToAnimate", 24.02, 99.99);
// // numAnim.start();
// })
