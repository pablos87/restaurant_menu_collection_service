Rails.application.routes.draw do
  devise_for :users

  resources :imports, only: [:new, :create]
  resources :places, only: [:index]
  resources :menus, only: [:show]

  root to: 'places#index'
end
