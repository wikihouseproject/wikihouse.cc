class DonationsController < ApplicationController

  def create
    @donation = Donation.new(donation_params)
    if @donation.save_with_payment
      # redirect_to @subscription, :notice => "Thank you for &crarr; subscribing!"
      render text: "DONE"
    else
      # render :new
      render text: "FAIL"
    end
  end

  # def create
  #   # Amount in cents
  #   @amount = 500

  #   customer = Stripe::Customer.create(
  #     :email => params[:stripeEmail],
  #     :source  => params[:stripeToken]
  #   )

  #   charge = Stripe::Charge.create(
  #     :customer    => customer.id,
  #     :amount      => @amount,
  #     :description => 'Rails Stripe customer',
  #     :currency    => 'gbp'
  #   )

  # rescue Stripe::CardError => e
  #   render text: e.message
  #   # flash[:error] = e.message
  #   # redirect_to :back
  # end

  private

    def donation_params
      params.require(:donation).permit!
    end

end
