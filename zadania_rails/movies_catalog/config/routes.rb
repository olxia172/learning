Rails.application.routes.draw do

  root 'main#index'

  resources :movies do
    resources :opinions, only: [:create, :destroy, :index]
    resources :reviews
  end

  get 'signup' => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :genres, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
