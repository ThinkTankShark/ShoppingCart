Rails.application.routes.draw do
  root :to => 'products#index'

  get 'admin' => 'admin#dashboard'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'cart' => 'purchases#cart'
  post 'checkout' => 'purchases#create'

  resources :products
  resources :users
  resources :categories
  resources :purchases
end
