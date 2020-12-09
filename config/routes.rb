Rails.application.routes.draw do
  root to: 'application#home'
  # get '/home', to: 'application#home', as: "home"

  get '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  # preparing to use OmniAuth Google strategy
  # post '/auth/:google/callback', to: 'sessions#create'


  delete '/logout', to: 'sessions#destroy'
  
  resources :reviews
  resources :restaurants
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
