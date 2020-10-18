Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes, only: [:index, :show]
  resources :authors, only: [:show]
  resources :tags, only: [:show]
end
