Rails.application.routes.draw do
  root to: 'application#home'
  get '/home', to: 'application#home'

  resources :reviews
  resources :restaurants
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
