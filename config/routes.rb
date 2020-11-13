Rails.application.routes.draw do
  devise_for :users
  root to: 'baseballs#index'
  resources :baseballs, only: [:new, :create]
end
