Rails.application.routes.draw do


  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }

  namespace :item do
   resources :homes
  end

  namespace :item do
   resources :sells
    get 'sells/complete'
  end

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  resources :buy_items, only: [:show, :index]

  resources :orders, only: [:new, :index, :show, :create]
  get 'orders/complete'
  post 'orders/comfirm'

  get 'customers/unsubscribe'
  patch 'customers/withdraw'
  resources :customers, only: [:show, :edit, :update]



  root to: 'homes#top'
  get 'homes/about'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end