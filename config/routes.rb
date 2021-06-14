Rails.application.routes.draw do
  root 'home#index'
  devise_for :users,
    controllers: {:registrations => "registrations"}
  resources :produtos
  resources :estoques
  resources :users, :only => %i[show index]
  as :user do 
    get "/register", to: "registrations#new", as: "register"
  end
end
