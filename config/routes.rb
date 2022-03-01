# frozen_string_literal: true

Rails.application.routes.draw do
  resources :journals do
    resources :dream_logs
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'journals#index'
  get '/about', to: 'about#index'
end
