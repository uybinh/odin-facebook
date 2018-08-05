Rails.application.routes.draw do
  root "timelines#show"
  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      get :friends
      get :timeline, to: "timelines#show"
    end
  end
  resources :friend_requests, only: [:update, :destroy]
  # get :timeline, to: "timelines#show"
  resources :posts, except: :new
  resources :comments, except: :new
end
