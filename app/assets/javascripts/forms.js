var EU_COUNTRIES = [
  'AT', 'BE', 'BG', 'HR', 'CY', 'CZ', 'DE', 'DK', 'EE', 'ES', 'FI', 'FR', 'GB', 'GR',
  'HU', 'HR', 'IE', 'IT', 'LT', 'LU', 'LV', 'MT', 'NL', 'PO', 'PT', 'RO', 'SE', 'SK']

var countryChange = function () {
  if ($('select.country').length > 0
    && $('#country-notification').length > 0) {
    $('select.country').change(function (event) {
      var country = event.currentTarget.value
      if (country === '' || $.inArray(country, EU_COUNTRIES) >= 0) {
        $('#country-notification').hide()
      } else {
        $('#country-notification').fadeIn()
      }
    }).trigger('change')
  }
}

$(document).on('ready', countryChange)
$(document).on('pjax:success', countryChange)
