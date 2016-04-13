Rails.application.routes.draw do
  get 'categories/index'

  get 'users/index'

  root :to => 'products#index'

  get 'admin' => 'admin#dashboard'

  resources :products
  resources :users
  resources :categories


end
