Rails.application.routes.draw do

  root "products#index"
  post 'products/new'
  devise_for :users
  resources :products, only: [:edit,:new,:index,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles, only: [:new,:index,:create]
  

end
