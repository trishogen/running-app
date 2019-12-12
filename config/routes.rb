Rails.application.routes.draw do
  root to: 'application#index'

  resources :runs
  resources :routes
   resources :users, only: [:show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end