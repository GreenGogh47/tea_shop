# frozen_string_literal: true

module Api
  module V1
    class SubscriptionsController < ApplicationController
      def index
        customer = Customer.find(params[:customer_id])
        render json: SubscriptionSerializer.new(customer.subscriptions)
      end

      def create
        render json: SubscriptionSerializer.new(Subscription.create(subscription_params))
      end

      def destroy
        render json: SubscriptionSerializer.new(Subscription.destroy(params[:id]))
      end

      def update
        render json: SubscriptionSerializer.new(Subscription.update(params[:id], subscription_params))
      end

      private

      def subscription_params
        params.permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
      end
    end
  end
end
