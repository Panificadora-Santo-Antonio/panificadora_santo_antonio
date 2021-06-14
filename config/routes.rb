Rails.application.routes.draw do
  devise_for :users
  resources :produtos
  resources :estoques
  resources :users, :only => %i[show index]
  root 'home#index'
end
