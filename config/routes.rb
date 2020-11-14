Rails.application.routes.draw do
  devise_for :users
  root to: 'baseballs#index'
  resources :baseballs, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
  
end
