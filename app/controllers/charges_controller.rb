class ChargesController < ApplicationController

  before_filter :authenticate_user!

  def new
  end

  def create
    # Amount in cents
    #current_user = User.first
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:email],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    current_user.update_attribute(:stripe_token, customer.id)
    current_user.role = "premium"
    current_user.save!

    rescue Stripe::CardError => e
      flash[:error] = e.message

    redirect_to charges_path
  end
end
