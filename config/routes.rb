Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'tweets#index'

  resources :tweets, only: [:index, :create, :show, :destroy] do
    # get 'like', to: 'tweets/likes#index'
    post 'like' , to: 'tweets/likes#create'
    delete 'like' , to: 'tweets/likes#destroy'
  end
end
