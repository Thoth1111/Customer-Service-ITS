Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  root 'home#index'

  resources :views
  resources :updates
  resources :worksheets
  resources :projects
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
