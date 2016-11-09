$(document).on 'ready pjax:success', ->
  Stripe.setPublishableKey $('meta[name="stripe-key"]').attr('content')
  subscription.setupForm()
  # if $('.label.amount').length > 0
  #   $('label.amount').each (e) ->
  #     radio = $(this).find('input[type=radio]').first()
  #     # console.log(radio)
  #     if radio.checked
  #       $(this).addClass 'selected'
  #     else
  #       $(this).removeClass 'selected'
  #     # radio.hide()

subscription =
  setupForm: ->
    $('#new_donation').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        subscription.processCard()
        false
      else
        true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, subscription.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#donation_stripe_card_token').val(response.id)
      $('#new_donation')[0].submit()
    else
      # $('#stripe_error').text(response.error.message)
      alert(response.error.message)
      $('input[type=submit]').attr('disabled', false)
