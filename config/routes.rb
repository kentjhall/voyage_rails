Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Piggybak::Engine => '/checkout', as: 'piggybak'

  devise_for :users

  root 'pages#home'

  get 'home', :to => 'pages#home'
  get 'store', :to => 'clothing_lines#index'
  get 'art', :to => 'pages#art'
  get 'about_us', :to => 'pages#about_us'
  get 'journal', :to => 'pages#journal'
  get 'contact', :to => 'pages#contact'

  get 'pages/home'
  get 'pages/art'
  get 'pages/about_us'
  get 'pages/journal'
  get 'pages/contact'

  resources :clothing_lines
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
