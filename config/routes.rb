Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  root 'products#index'

  resources :payment_cards, only: [:new, :create, :index, :destroy]
  resources :items do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resources :purchases do
      collection do
        get :buy
        post :pay
      end
    end
  end

  resources :categories, only: [:index, :show] do
    collection do
      get "children_category"
      get "grandchildren_category"
    end
  end

  resources :mypages, only: [:show] do
    collection do
      get 'logout'
    end
  end

  resources :buyers, only: [:new, :create]

  resources :products do

    resources :product_images

    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
end
