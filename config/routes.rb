Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :customers

  get 'about' => 'pages#about', as: 'about'
  get 'contact' => 'pages#contact', as: 'contact'
  get 'add_product' => 'pages#add_product', as: 'add_product'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "pages#home"
end
