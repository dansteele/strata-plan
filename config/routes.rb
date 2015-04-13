Rails.application.routes.draw do
  devise_for :travellers
  root to: "welcome#index"
end
