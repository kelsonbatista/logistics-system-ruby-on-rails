Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  resources :modes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :prices, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :deadlines, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
