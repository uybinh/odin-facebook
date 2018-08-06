Rails.application.routes.draw do
  root "singlepages#home"
  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      get :friends
      get :requesters
      post :send_request, to: "friend_requests#create"
      delete :delete_request, to: "friend_requests#destroy"
      delete :unaccept_request, to: "friend_requests#unaccept"
    end
  end
  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:update, :destroy]
  resources :posts, except: :new
  resources :comments, except: :new
end
