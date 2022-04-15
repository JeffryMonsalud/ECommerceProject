Rails.application.routes.draw do
  devise_for :users

  resources :products
  resources :categories
  resources :customers

  # Pages routes
  get 'about' => 'pages#about', as: 'about'
  get 'contact' => 'pages#contact', as: 'contact'
  get 'add_product' => 'pages#add_product', as: 'add_product'
  
  # Login Configurations
  get 'login' => 'users#login', as: 'login'
  get 'register' => 'users#register', as: 'register'
  post '/users' => 'users#create'
  
  # Logging In
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "pages#home"
end
