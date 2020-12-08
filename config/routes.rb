Rails.application.routes.draw do
  # root 'items#index'
  # root 'buyers#new'
  root 'mypages#show'
  resources :mypages, only: [:show] do
    collection do
      get 'logout'
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'      
    end
  end
  resources :buyers, only: [:index, :new, :create] do
    collection do
      get 'index', to: 'buyers#index'
      post 'pay', to: 'buyers#pay'
    end
  end
end
