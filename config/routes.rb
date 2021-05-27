Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :market, only: :index
  resources :portfolios do
    resources :positions, only: [:new, :create, :destroy]
    resources :cards, only: :index
  end
  resources :infos, only: [:index, :show]
end
