Rails.application.routes.draw do
  devise_for :travellers
  
  resources :journey, only: [:index, :create, :show, :new]
  resources :waypoints, only: [:create, :destroy]
  resources :trip, only: [:index]
  resources :flights, only: [:index]

  root to: "welcome#index"
end
