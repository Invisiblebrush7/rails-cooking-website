Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # New is GET, create is POST

  # resources :recipes, only: [:index, :show, :create, :new]
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
