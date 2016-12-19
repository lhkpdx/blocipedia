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

  def downgrade_to_standard
    current_user.role = "standard"
    current_user.save!

    redirect_to subscriber_path(1)
  end

end
