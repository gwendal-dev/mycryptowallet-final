Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :market, only: :index
  resources :portfolios do
    resources :cards, only: :index
    resources :positions, only: [:new, :create, :destroy]
    resources :api
  end
  resources :infos, only: [:index, :show]
  resources :coin, only: :index
end
