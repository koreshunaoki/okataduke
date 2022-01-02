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
   #get 'sells/:id/complete',to: 'sells#complete',as: 'sells_complete'
   get "sells/complete"
   resources :sells do
    resource :favorites, only: [:create, :destroy]  
    resources :comments, only: [:create, :destroy]
   end
  end


  namespace :item do
   resources :homes
  end

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]


  get 'orders/complete'
  post 'orders/confirm'
  resources :orders, only: [:new, :index, :show, :create]

  get 'customers/unsubscribe'
  patch 'customers/withdraw'
  resources :customers, only: [:show, :edit, :update]



  root to: 'homes#top'
  get 'homes/about'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end