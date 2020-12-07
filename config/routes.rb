Rails.application.routes.draw do
  devise_for :users
  root to: 'baseballs#index'
  post 'comments', to: 'comments#create'
  post 'likes', to: 'likes#create'
  resources :baseballs do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :baseballs do
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :search]
  resources :rooms, only: [:show, :create]
  resources :messages, only: [:create, :destroy]
end
