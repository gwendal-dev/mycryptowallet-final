Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :market, only: :index
  resources :portfolios do
    resources :cards, only: :index
    resources :positions, only: [:new, :create, :destroy]
  end
  resources :room_messages
  resources :rooms
  resources :infos, only: [:index, :show]

  resources :coin, only: :index
  resources :api do
    resources :positions_api, only: [:new, :create, :destroy]
    resources :cards_api, only: :index

  end
end
