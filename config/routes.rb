Rails.application.routes.draw do
  get 'transitions/index'
  get 'transitions/new'
  get 'transitions/create'
  get 'transitions/edit'
  get 'transitions/update'
  get 'transitions/destroy'
  get 'goals/index'
  get 'goals/show'
  get 'goals/new'
  get 'goals/create'
  get 'goals/edit'
  get 'goals/update'
  get 'goals/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
