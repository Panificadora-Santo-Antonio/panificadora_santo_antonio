Rails.application.routes.draw do

  resources :search
  resources :customers

  get 'home',to:'sale#new'

  
  devise_for :users, :path_prefix => 'my',
    controllers: {:registrations => "registrations"}
  
  resources :produtos
  resources :customers

  resources :sales do
    resources :product_sales
    member do
      get :finalizeSale
    end
  end

  
  resources :users, :only => %i[show index destroy]
  as :user do 
    get "/register", to: "registrations#new", as: "register"
  end

  root 'home#index'
end
