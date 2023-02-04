Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  get "/orders/:id/confirmed", to: "orders#show_confirmed", as: "order_confirmed"
  authenticate :user do
    resources :users, only: [:show, :edit, :update]
    resources :modes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :vehicles, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      get 'search_vehicles', on: :collection, as: 'search_vehicles'
    end
    resources :prices, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :deadlines, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :new, :create, :edit, :update, :destroy] do
      get 'search_orders', on: :collection, as: 'search_all'
      resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :addresses, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :order_products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :order_addresses, only: [:index, :show, :new, :create, :edit, :update, :destroy]
      resources :budgets, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end

  resources :orders, only: [:show, :show_confirmed] do
    resources :products, only: [:index, :show]
    resources :addresses, only: [:index, :show]
    resources :order_products, only: [:index, :show]
    resources :order_addresses, only: [:index, :show]
    resources :budgets, only: [:index, :show]
    get 'search', on: :collection
    post 'delivered', on: :member
    post 'canceled', on: :member
    post 'returned', on: :member
  end
end
