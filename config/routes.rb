Rails.application.routes.draw do
  devise_for :users #, :controllers => { :reigstrations => "user/reigstrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'

  get 'search_stocks', to: "stocks#search"

  get 'my_friends', to: "users#my_friends"

  get 'search_friends', to: "users#search"

  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships

end
