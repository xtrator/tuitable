Rails.application.routes.draw do
  get '/profile/:id', to: 'users#profile', as: 'profile'
  get '/profile/:id/likes', to: 'users#profile_likes', as: 'profile_likes'
  root 'tweets#index'
  devise_for :users
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
