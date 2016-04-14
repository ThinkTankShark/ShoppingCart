Rails.application.routes.draw do
  resources :purchases
  root :to => 'products#index'

  get 'admin' => 'admin#dashboard'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :products
  resources :users
  resources :categories

end
