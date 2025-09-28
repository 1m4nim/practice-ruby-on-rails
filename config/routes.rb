Rails.application.routes.draw do
  devise_for :users
    devise_for :users, skip: [:registrations] 
  
  resources :posts
  root 'posts#index'
end