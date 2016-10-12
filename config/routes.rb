Rails.application.routes.draw do
  root 'home#index'

  get '/auth/reddit', as: :reddit_login
  get '/auth/reddit/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'

  resources :subreddits, only: [:index]

  get 'r/:subreddit', to: 'subreddits#show'
  get 'r/:subreddit/comments/:post', to: 'comments#index'
end
