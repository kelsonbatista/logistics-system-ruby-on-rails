Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  resources :modes, only: [:index, :show, :new, :create, :edit, :update]
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
