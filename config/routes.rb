Rails.application.routes.draw do
  get 'positions/new'
  get 'positions/create'
  get 'positions/destroy'
  get 'portfolios/index'
  get 'portfolios/show'
  get 'portfolios/create'
  get 'portfolios/update'
  get 'portfolios/destroy'
  get 'infos/index'
  get 'infos/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :market, only: :index
end
