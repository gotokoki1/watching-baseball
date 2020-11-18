Rails.application.routes.draw do
  devise_for :users
  root to: 'baseballs#index'
  post 'comments', to: 'comments#create'
  resources :baseballs, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :rooms, only: [:show, :create]
  resources :messages, only: :create
end
