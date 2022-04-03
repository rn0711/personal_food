Rails.application.routes.draw do
  devise_for :users

  root to: "tops#index"

  resources :users, only: :show
  
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :messages
  resources :rooms, only: [:new, :create]
end
