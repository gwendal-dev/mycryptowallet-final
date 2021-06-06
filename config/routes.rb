Rails.application.routes.draw do
  devise_for :users
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
  resources :hide, only: [:new, :create]
  resources :stat, only: :index
  resources :fallowed, only: :index
  post '/search', to: 'market#research'
  get '/search', to: 'market#search'
  get '/page2', to: 'market#page2'
  post '/page2', to: 'market#post_page2'
  get '/page3', to: 'market#page3'
  post '/page3', to: 'market#post_page3'
  get '/page4', to: 'market#page4'
  post '/page4', to: 'market#post_page4'
  get '/page5', to: 'market#page5'
  post '/page5', to: 'market#post_page5'
  get '/page6', to: 'market#page6'
  post '/page6', to: 'market#post_page6'
  get '/page7', to: 'market#page7'
  post '/page7', to: 'market#post_page7'
  get '/page8', to: 'market#page8'
  post '/page8', to: 'market#post_page8'
  get '/page9', to: 'market#page9'
  post '/page9', to: 'market#post_page9'
  get '/page10', to: 'market#page10'
  get '/page11', to: 'market#page11'
  get '/page12', to: 'market#page12'
  get '/page13', to: 'market#page13'
  get '/page14', to: 'market#page14'
  get '/page15', to: 'market#page15'
  get '/page16', to: 'market#page16'
  get '/page17', to: 'market#page17'
  get '/page18', to: 'market#page18'
  get '/page19', to: 'market#page19'
  get '/page20', to: 'market#page20'
end
