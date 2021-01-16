Rails.application.routes.draw do
  get '/profile/:id', to: 'users#profile', as: 'profile'
  get '/profile/:id/liked_tweets', to: 'users#profile_liked_tweets', as: 'profile_liked_tweets'
  root 'tweets#index'
  devise_for :users
  resources :tweets
  post '/tweets/:id/likes', to: 'tweets#create', as: 'create_like'
  delete '/tweets/:id/likes', to: 'tweets#create', as: 'destroy_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
