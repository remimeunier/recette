Rails.application.routes.draw do
  get 'author/show'
  root 'recipes#index'
  resources :recipes, only: [:index, :show]
  resources :authors, only: [:show]
end
