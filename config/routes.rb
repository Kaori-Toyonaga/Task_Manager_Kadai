Rails.application.routes.draw do
  root to: 'sessions#new'
  # root to: 'admin/users#new'

  resources :tasks
  resources :sessions
  resources :users

  namespace :admin do
    resources :users
  end

end
