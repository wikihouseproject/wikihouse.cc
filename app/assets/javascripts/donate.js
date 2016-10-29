document.addEventListener("turbolinks:load", function() {
  $('label.amount').each(function(e) {
    var radio = $(this).find('input[type=radio]').first()
    // console.log(radio)
    if (radio.checked) {
      $(this).addClass('selected')
    } else {
      $(this).removeClass('selected')
    }
    // radio.hide()
  })
})
