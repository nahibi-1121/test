Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  get 'spots/index_japan', to: 'spots#index_japan'
  get 'spots/index_abroad', to: 'spots#index_abroad'
  post 'spots/:id' => 'spots#create'
  post 'spots' => 'spots#create'
  post 'users/:id' => 'spots#create'
  post 'users' => 'spots#create'
  resources :users, only: [:index, :show, :edit, :update]
  resources :spots, only: [:new, :create, :show, :edit, :update, :destroy]
end
