Rails.application.routes.draw do
  root "singlepages#home"
  devise_for :users
end
