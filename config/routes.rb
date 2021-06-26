Rails.application.routes.draw do

  resources :sales
  resources :customers

  root 'home#index'
  devise_for :users, :path_prefix => 'my',
    controllers: {:registrations => "registrations"}
  resources :produtos
  resources :customers

  resources :users, :only => %i[show index]
  as :user do 
    get "/register", to: "registrations#new", as: "register"
  end
end
