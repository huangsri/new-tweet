Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'tweets#index'
  resources :users, only: [:show]
  get 'tags/:tag', to: 'trends#show', as: 'tags'

  resources :tweets, only: [:index, :create, :show, :destroy] do
    # get 'like', to: 'tweets/likes#index'
    post 'like', to: 'tweets/likes#create'
    delete 'like', to: 'tweets/likes#destroy'

    get 'reply', to: 'tweets/replies#new'
    post 'reply', to: 'tweets/replies#create'
    delete 'reply', to: 'tweets/replies#destroy'

    get 'retweet', to: 'tweets/retweets#new'
    post 'retweet', to: 'tweets/retweets#create'
  end

end
