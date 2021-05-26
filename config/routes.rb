Rails.application.routes.draw do
  get 'portfolio/index'
  get 'portfolio/show'
  get 'portfolio/edit'
  get 'portfolio/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :market, only: :index
  resources :portfolio
end
