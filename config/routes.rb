Rails.application.routes.draw do
    devise_for :users
    resources :stores do
      resources :ratings, only: [:new, :create]
    end
  
    root 'stores#index'
  end
  