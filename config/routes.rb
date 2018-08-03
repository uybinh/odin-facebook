Rails.application.routes.draw do
  root "singlepages#home"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:update, :destroy]
end
