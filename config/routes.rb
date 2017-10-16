Rails.application.routes.draw do

  get 'team_members/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root 'pages#home'

  get 'flash_exec', :to => 'application#flash_exec'

  get 'home', :to => 'pages#home'
  get 'art', :to => 'pages#art'

  get 'cart', :to => 'charges#cart'
  get 'checkout', :to => 'charges#new'
  post 'payment_success', :to => 'charges#create'

  get 'add_order_item', :to => 'order_items#add'
  get 'remove_order_item', :to => 'order_items#remove'
  get 'remove_all_order_items', :to => 'order_items#remove_all'
  get 'update_order_item_quantity', :to => 'order_items#update_quantity'

  get 'set_ma_student', :to => 'application#set_ma_student'

  resources :clothing_lines, :only => [:show]
  resources :items, :only => [:show]
  resources :team_members, :only => [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
