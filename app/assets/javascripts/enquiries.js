$(document).on('change', 'select.enquiry-select', function(event){
  var link = document.getElementById('change-link');
  // doing it this way because of PJAX
  link.href = event.target.value;
  link.click();
})
