Rails.application.routes.draw do
  devise_for :users

  root :to => 'products#index'

  get 'admin' => 'admin#dashboard'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :products
  resources :users
  resources :categories

end
