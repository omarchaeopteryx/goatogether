Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessions/logout', to: 'sessions#logout'
  get '/journeys/random', to:'journeys#random'
  get '/journeys/search', to:'journeys#search'
  get 'journeys/:journey_id', to: 'journeys#show'
  resources :users
  get '/posts/show', to: 'posts#show'
  resources :locations
  resources :journeys
  resources :invites
  root 'locations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
