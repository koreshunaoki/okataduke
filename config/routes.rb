Rails.application.routes.draw do

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }


  namespace :item do
   resources :buys do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end
  end

  namespace :item do
   get 'sells/:id/complete',to: 'sells#complete',as: 'sells_complete'
   resources :sells do
   #  resource :favorites, only: [:create, :destroy]
   #  resources :comments, only: [:create, :destroy]
    end
  end


  namespace :item do
   resources :homes
  end

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]


  get 'orders/complete'
  post 'orders/confirm'
  resources :orders, only: [:new, :index, :show, :create]

  put "/customers/:id/withdraw" => "customers#withdraw", as: 'customers_withdraw'
  get 'customers/unsubscribe'
  resources :customers, only: [:show, :edit, :update]


  get "search" => "searches#search"
  root to: 'item/buys#index'
  get 'homes/about'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end