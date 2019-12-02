Rails.application.routes.draw do
  resources :stories
  resources :user_experiences
  resources :category_activities
  resources :categories
  resources :activities
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
