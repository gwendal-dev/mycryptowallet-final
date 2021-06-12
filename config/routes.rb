Rails.application.routes.draw do
  root to: 'pages#home'
  resources :market, only: [:index, :create]
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
  resources :dark_mode, only: [:new, :create]
  resources :hide, only: [:new, :create]
  resources :stat, only: :index
  resources :alerts
  resources :actualiser_coins, only: :index
  devise_for :users, controllers: { registrations: 'registrations' }
  post '/search', to: 'market#research'
  get '/search', to: 'market#search'
  get '/page2', to: 'market#page2'
  post '/page2', to: 'market#post_page2'
  get '/page3', to: 'market#page3'
  post '/page3', to: 'market#post_page3'
end
