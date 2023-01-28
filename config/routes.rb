Rails.application.routes.draw do
  get 'order_products/new'
  get 'addresses/new'
  get 'order_addresses/new'
  get 'products/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  authenticate :user do
    resources :users, only: [:show, :edit, :update]
    resources :modes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :vehicles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :prices, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :deadlines, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:destroy]
  end
  resources :orders, only: [:index, :show, :new, :create, :edit, :update] do
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :addresses, only: [:index, :show, :new, :create, :edit, :update]
    resources :order_products, only: [:index, :show, :new, :create, :edit, :update]
    resources :order_addresses, only: [:index, :show, :new, :create, :edit, :update]
  end
end
