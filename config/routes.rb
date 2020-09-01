Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items do
    resources :orders, only: [:index, :create]
  end
  get 'items', to: 'items#checked'
end