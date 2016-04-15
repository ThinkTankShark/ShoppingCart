Rails.application.routes.draw do
  get 'orders/show'

  post 'orders/create'

  post 'sessions/shop'

  get '/sessions/view_cart'

  root :to => 'products#index'

  get 'admin' => 'admin#dashboard'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :products
  resources :users
  resources :categories

end
