Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'tweets#index'

  resources :tweets, only: [:index, :create, :show, :destroy] do
    post '/like' , to: 'tweets/like#create'
    delete '/like' , to: 'tweets/like#destroy'
  end
end
