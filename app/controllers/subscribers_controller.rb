class SubscribersController < ApplicationController

  def new
  end

  def update
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
      card: token,
      plan: 1,
      email: current_user.email
      )

      current_user.role = "premium"
      current_user.stripeid = customer.id
      current_user.save!

      redirect_to subscriber_path
  end

end
