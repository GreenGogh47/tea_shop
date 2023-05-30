# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: %i[create destroy]
      resources :customers, only: [] do
        resources :subscriptions, only: [:index]
      end
    end
  end
end
