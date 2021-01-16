Rails.application.routes.draw do
  get '/profile/:id', to: 'users#profile', as: 'profile'
  get '/profile/:id/liked_tweets', to: 'users#profile_liked_tweets', as: 'profile_liked_tweets'
  root 'tweets#index'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :tweets
  post '/tweets/:id/likes', to: 'likes#create', as: 'create_like'
  delete '/tweets/:id/likes', to: 'likes#destroy', as: 'destroy_like'

  namespace :api do
    resources :tweets, only: %i[index show create]
    resources :users, only: %i[create]
    resources :sessions, only: %i[create destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
