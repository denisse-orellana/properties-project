Rails.application.routes.draw do
  devise_for :users
  resources :properties
  get '/profile', to: 'properties#profile'
  root 'properties#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
