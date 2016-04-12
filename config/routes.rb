Rails.application.routes.draw do
  root :to => 'welcome#index'

  get 'products/index'

  get 'products/index'

  get 'welcome/index'

  get 'admin' => 'admin#dashboard'

  resources :products

end
