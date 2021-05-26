Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :market, only: :index
  resources :portfolios, only: [:index, :show, :create, :update, :destroy] do
    resources :positions, only: [:new, :create, :destroy]
  end
  resources :infos, only: [:index, :show]
end
