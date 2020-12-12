Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  get '/signup', to: 'users#new'
  get '/home', to: 'static_pages#home'
  get 'sessions/login' => 'sessions#new'
  post 'sessions/login' => 'sessions#create'
  delete 'sessions/logout' => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: [:create, :show, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :comments, only: [:create, :show, :destroy]


end
