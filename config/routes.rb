Rails.application.routes.draw do
  resources :stories
  resources :user_experiences
  resources :categories, only: [:index, :create, :new, :show]
  resources :activities, except: :destroy
  resources :users, except: :destroy
end
