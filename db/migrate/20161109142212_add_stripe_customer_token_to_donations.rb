class AddStripeCustomerTokenToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :stripe_customer_token, :string
  end
end
