Rails.application.routes.draw do
  get 'orders/show'

  post 'orders/create'

  post 'sessions/shop'

  root :to => 'products#index'

  get 'admin' => 'admin#dashboard'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :products
  resources :users
  resources :categories

end
