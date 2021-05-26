Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :market, only: :index
  resources :portfolios do
    resources :positions, only: [:new, :create, :destroy]
  end
  resources :infos, only: [:index, :show]
end
