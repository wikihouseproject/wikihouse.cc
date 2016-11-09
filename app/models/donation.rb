class Donation < ApplicationRecord
  attr_accessor :stripe_card_token

  def save_with_payment
    frequency == "one_off" ? one_time_payment : setup_subscription
  end

  def one_time_payment
    if valid?
      customer = Stripe::Customer.create(
        card: stripe_card_token,
        description: display_name
      )
      charge = Stripe::Charge.create(
        amount: amount_in_cents * 100,
        currency: "gbp",
        customer: customer.id
      )
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while one time payment: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end

  def setup_subscription
    if valid?
      customer = Stripe::Customer.create(
        card: stripe_card_token,
        plan: frequency,
        description: display_name,
        quantity: amount_in_cents
      )
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating subscription: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end

end
