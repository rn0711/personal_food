Rails.application.routes.draw do
  devise_for :users

  root to: "tops#index"

  resources :posts
  resources :users, only: :show
  resources :posts do
    resources :comments, only: :create
  end
end
