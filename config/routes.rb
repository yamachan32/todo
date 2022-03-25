Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :users, only: [:index]
  resources :teams, only: [:index]

end
