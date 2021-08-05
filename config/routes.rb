Rails.application.routes.draw do

  root "products#index"
  devise_for :users
  resources :products, only: [:new,:index,:create,:show, :edit, :update, :destroy]

end
