Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :users, only: [:index, :show]
  resources :teams, only: [:index, :new, :create]
  resources :teams, only: [:show] do
    get 'entry', to: 'teams#team_entry'
    post 'entry', to: 'teams#member_add'
  end
  resources :cards, only:[:new,:create] do
    resources :tasks, only:[:index,:create]
    resources :comments, only:[:index, :create]
  end

end
