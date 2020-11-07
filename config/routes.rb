Rails.application.routes.draw do

  get 'top/index'
  root 'top#index'

  resources :mypages, only: [:show] do
    collection do
      get 'logout'
    end
  end
  resources :cards, only: [:index]

  resources :buyers, only: [:new, :create]
  resources :products, only: [:show]
end