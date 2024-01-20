Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :tasks, only: [:index, :show, :create, :update, :destroy]
    resources :task_groups, only: [:index, :show, :create, :update, :destroy]
    resources :task_types, only: [:index, :show, :create, :update, :destroy]
    resources :notifications, only: [:index, :show, :destroy]
    resources :teams, only: [:index, :show, :create, :update, :destroy] do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
      resources :task_groups, only: [:index, :show, :create, :update, :destroy]
      resources :task_types, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # Defines the root path route ("/")
  root "landings#index"
end
