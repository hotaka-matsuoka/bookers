Rails.application.routes.draw do
  devise_for :users
  resources :top, only: :index 
  resources :books
end
