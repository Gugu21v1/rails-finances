Rails.application.routes.draw do
  resources :transitions
  resources :goals, only: %i[index show new create edit update destroy]
  resources :renda_fixas, only: %i[new create edit update destroy]
  resources :gastos_fixos, only: %i[new create edit update destroy]
  devise_for :users

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
