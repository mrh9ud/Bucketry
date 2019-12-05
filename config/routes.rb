Rails.application.routes.draw do
  root 'pages#index'
  resources :stories
  resources :user_experiences, only: [:new, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :new, :show]
  resources :activities, except: :destroy
  resources :users, except: :destroy
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#logout'
  get '/about', to: 'pages#about', as: 'about'
end
