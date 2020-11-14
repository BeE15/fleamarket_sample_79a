Rails.application.routes.draw do

   root 'products#index'

  devise_for :users
  root 'products#index'
  resources :mypages, only: [:show] do
    collection do
      get 'logout'
    end
  end
  resources :cards, only: [:index]

  resources :buyers, only: [:new, :create]
  resources :products, only: [:index, :new, :show]
end