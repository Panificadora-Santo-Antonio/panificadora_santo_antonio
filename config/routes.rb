Rails.application.routes.draw do
  root 'home#index'
  get 'home',to:'sale#new'
  
  resources :search
  resources :customers
  resources :produtos
  resources :customers

  devise_for :users, :path_prefix => 'my',
    controllers: {:registrations => "registrations"}

  resources :users, :only => %i[show index destroy]
  as :user do 
    get "/register", to: "registrations#new", as: "register"
  end
    
  resources :sales do
    resources :product_sales
    member do
      get :finalizeSale
    end
  end
end
