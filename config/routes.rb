Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create]
  resources :locations, only: [:index, :show, :create, :update]
  resources :reviews, only: [:index, :show, :create]
  resources :boroughs, only: [:index, :show]
end
