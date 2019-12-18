Rails.application.routes.draw do
  root to: 'application#index'

  #log in and log out
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create] do
    resources :runs, only: [:index, :show, :new, :create, :edit, :update]
  end

  resources :runs

  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
