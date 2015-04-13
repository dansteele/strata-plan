Rails.application.routes.draw do
  devise_for :travellers
  
  resources :journey, only: [:index, :create]

  root to: "welcome#index"
end
