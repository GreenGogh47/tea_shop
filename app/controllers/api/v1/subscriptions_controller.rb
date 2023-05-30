class Api::V1::SubscriptionsController < ApplicationController
  def create
    render json: SubscriptionSerializer.new(Subscription.create(subscription_params))
  end

  def destroy
    render json: SubscriptionSerializer.new(Subscription.destroy(params[:id]))
  end

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end
end