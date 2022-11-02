Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/create'
  get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users

  root "users#index"
end
