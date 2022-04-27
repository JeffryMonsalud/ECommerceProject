Rails.application.routes.draw do
  get 'cart/show'
  devise_for :users, controllers: { registrations: 'users/register' }

  resources :products
  resources :categories
  resources :customers

  # Pages routes
  get 'about' => 'pages#about', as: 'about'
  get 'contact' => 'pages#contact', as: 'contact'
  get 'add_product' => 'pages#add_product', as: 'add_product'
  get 'return_product' => 'categories#show', as: 'return_product'
  get 'newest' => 'products#newest', as: 'newest'
  get 'cart' => 'cart#show', as: 'cart'
  get 'invoice' => 'cart#invoice', as: 'invoice'

  # Login Configurations
  get 'login' => 'users#login', as: 'login'
  get 'register' => 'users#register', as: 'register'
  post '/users' => 'users#create'

  # Logging In
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  # Search Bar
  get '/search' => 'products#search'
  get 'products' => 'products#index'

  # Shopping Cart
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  post "checkout/create", to: "checkout#create"
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"
  post 'webhook', to: "stripe#webhook"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "pages#home"
end
