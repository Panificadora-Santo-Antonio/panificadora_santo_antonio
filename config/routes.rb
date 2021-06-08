Rails.application.routes.draw do

  resources :produtos
  devise_for :users
  root 'home#index'
end
