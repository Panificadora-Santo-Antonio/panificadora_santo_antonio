Rails.application.routes.draw do

  resources :produtos
  root 'home#index'
end
