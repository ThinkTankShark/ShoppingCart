Rails.application.routes.draw do
  get 'products/index'

  get 'products/index'

  get 'welcome/index'

  resources :products

  root 'welcome#index'
end
