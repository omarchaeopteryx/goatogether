Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessions/logout', to: 'sessions#logout'
  get '/journeys/search', to:'journeys#search'
  get '/journeys/random', to:'journeys#random'
  resources :users
  resource :post
  get '/inst/tags', to: 'posts#index'
  resources :locations
  resources :journeys
  root 'locations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
