Rails.application.routes.draw do
  # get 'tasks/new'
  post 'create_task', to: 'tasks#create'
  # get 'tasks/update'
  # get 'tasks/destroy'
  # get 'tasks/show'
  # get 'tasks/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#destroy'
  delete 'logout',  to: 'sessions#destroy'

  # get 'categories/index'
  # get 'categories/new'
  # post 'categories/create'
  # get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :categories do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
  resources :sessions
  # resources :tasks
  # root "users#login"
  root "sessions#welcome"
end
