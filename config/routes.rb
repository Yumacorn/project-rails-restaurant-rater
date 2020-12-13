Rails.application.routes.draw do
  root to: 'application#home'

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'

  # get '/login', to: 'sessions#new'

  
  resources :reviews
  resources :restaurants
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
