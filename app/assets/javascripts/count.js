window.doCount = function () {
  try {
    $('span.count').each(function (el) {
      var end = parseInt($(this).text(), 0)
      var numAnim = new CountUp($(this).attr('id'), 0, end, 0, 2.5)
      numAnim.start()
    })
  } catch (e) {}
}
