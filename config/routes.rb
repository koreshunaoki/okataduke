Rails.application.routes.draw do


  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }


  namespace :item do
   get 'sells/:id/complete',to: 'sells#complete',as: 'sells_complete'
   resources :sells
  end

  namespace :item do
   resources :homes
  end
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  resources :buy_items, only: [:show, :index]

  get 'orders/complete'
  post 'orders/comfirm'
  resources :orders, only: [:new, :index, :show, :create]


  get 'customers/unsubscribe'
  patch 'customers/withdraw'
  resources :customers, only: [:show, :edit, :update]



  root to: 'homes#top'
  get 'homes/about'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end