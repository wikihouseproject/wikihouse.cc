var EU_COUNTRIES = [
  'AL', 'AD', 'AM', 'AT', 'BY', 'BE', 'BA', 'BG', 'CH', 'CY', 'CZ', 'DE',
  'DK', 'EE', 'ES', 'FO', 'FI', 'FR', 'GB', 'GE', 'GI', 'GR', 'HU', 'HR',
  'IE', 'IS', 'IT', 'LT', 'LU', 'LV', 'MC', 'MK', 'MT', 'NO', 'NL', 'PO',
  'PT', 'RO', 'RU', 'SE', 'SI', 'SK', 'SM', 'TR', 'UA', 'VA']

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
