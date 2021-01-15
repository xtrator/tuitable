Rails.application.routes.draw do
  get '/profile/:id', to: 'users#profile', as: 'profile'
  root 'tweets#index'
  devise_for :users
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
