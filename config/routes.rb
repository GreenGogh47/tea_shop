# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:destroy]
      resources :customers, only: [] do
        resources :subscriptions, only: [:index, :create]
      end
    end
  end
end
