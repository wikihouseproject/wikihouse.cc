Rails.configuration.stripe = {
  :publishable_key => ENV.fetch('stripe_public_key'),
  :secret_key      => ENV.fetch('stripe_secret_key')
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
