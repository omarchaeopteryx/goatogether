Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  resource :user
  resources :locations
  resources :journeys
  root 'locations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
