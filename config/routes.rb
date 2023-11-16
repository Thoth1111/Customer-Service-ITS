Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/auth/google_oauth2', to: 'users/omniauth_callbacks#passthru'
    get '/users/auth/google_oauth2/callback', to: 'users/omniauth_callbacks#google_oauth2'
  end  

  root 'home#index'

  resources :views
  resources :updates
  resources :worksheets
  resources :projects
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
