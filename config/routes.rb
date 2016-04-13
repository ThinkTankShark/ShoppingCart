Rails.application.routes.draw do
  root :to => 'products#index'

  get 'admin' => 'admin#dashboard'

  resources :products

end
