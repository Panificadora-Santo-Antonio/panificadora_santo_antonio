Rails.application.routes.draw do
  devise_for :users
  resources :produtos
  resources :estoques
  root 'home#index'
end
