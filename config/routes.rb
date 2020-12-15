Rails.application.routes.draw do
  root to: 'application#home'

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' 

  resources :users, only: [:new, :create, :index, :show, :edit, :update]

  resources :reviews
  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
