Rails.application.routes.draw do
  get 'budgets/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  get "/orders/:id/confirmed", to: "orders#show_confirmed", as: "order_confirmed"
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
    resources :budgets, only: [:index, :show, :new, :create, :edit, :update]
  end
end
