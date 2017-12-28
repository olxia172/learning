Rails.application.routes.draw do
  root 'movies#index'

  resources :movies

  get 'signup'  => 'users#new'
  resources :users

  get 'login' => 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
