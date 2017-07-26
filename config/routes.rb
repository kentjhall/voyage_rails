Rails.application.routes.draw do

  get 'team_members/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root 'pages#myst'

  get 'home', :to => 'pages#home'
  get 'art', :to => 'pages#art'
  get 'about_us', :to => 'pages#about_us'
  get 'journal', :to => 'pages#journal'
  get 'contact', :to => 'pages#contact'

  get 'pages/home'
  get 'pages/art'
  get 'pages/about_us'
  get 'pages/journal'
  get 'pages/contact'
  get 'pages/myst'

  get 'cart', :to => 'order_items#index'
  get 'checkout', :to => 'charges#new'

  resources :clothing_lines, :except => [:index]
  resources :items
  resources :charges, :only => [:new, :create]
  resources :order_items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
