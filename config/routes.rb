Rails.application.routes.draw do
  devise_for :customers

  resources :home_items

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  resources :buy_items, only: [:show, :index]

  resources :orders, only: [:new, :index, :show, :create]
  get 'orders/complete'
  post 'orders/comfirm'

  resources :sell_items
  get 'sell_items/complete'

  resources :customers, only: [:show, :edit, :update]
  get 'customers/unsubscribe'
  patch 'customers/withdraw'
  
  

  root to: 'homes#top'
  get 'homes/about'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end