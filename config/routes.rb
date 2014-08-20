Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'

  resources :users,    only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :companies, :vacancies, :info
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
