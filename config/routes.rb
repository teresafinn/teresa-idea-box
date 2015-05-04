Rails.application.routes.draw do

  root to: 'sessions#new'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:show]
  resources :ideas, only: [:new, :create, :update, :edit, :destroy]
  resources :images, only: [:index, :new, :create, :destroy]
  resources :categories, only: [:index, :new, :create, :destroy]


end
