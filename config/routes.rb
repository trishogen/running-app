Rails.application.routes.draw do
  root to: 'application#index'

  #log in and log out
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #log in with google omniauth
  get '/auth/google_oauth2/callback' => 'sessions#create'


  resources :users, only: [:show, :new, :create] do
    resources :runs
  end

  resources :routes

  get '/runs/total_run_time', to: 'runs#total_run_time'

  get 'stats', to: 'application#stats'

end
