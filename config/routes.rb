Rails.application.routes.draw do
  devise_for :users
  resources :produtos
  root 'home#index'
end
