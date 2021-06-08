# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  namespace :admin do
    root to: 'books#index'
    resources :authors
    resources :books
  end
end
