Rails.application.routes.draw do
  devise_for :travellers
  
  resources :journey, only: [:index, :create, :show]
  resources :waypoints, only: [:create, :destroy]

  root to: "welcome#index"
end
