Rails.application.routes.draw do
  root "timelines#show"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friend_requests, only: [:update, :destroy]
  get :timeline, to: "timelines#show"
  resources :posts, except: :new
end
