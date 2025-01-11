# config/routes.rb
Rails.application.routes.draw do
  resources :users, only: [:create]
  post 'users/:id/update_password', to: 'users#update_password'
  resources :stores, only: [:index, :create]
  resources :ratings, only: [:create, :update]
end
