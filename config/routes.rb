Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  resources :users,    only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :info
  resources :students, :companies, :vacancies do
    member do
      get :responses
    end
  end
  root 'static_pages#index'
  match '/signup',   to: 'users#new',             via: 'get'
  match '/signin',   to: 'sessions#new',          via: 'get'
  match '/signout',  to: 'sessions#destroy',      via: 'delete'
  match '/about',    to: 'static_pages#about',    via: 'get'
  match '/contact',  to: 'static_pages#contact',  via: 'get'
  match '/feedback', to: 'static_pages#feedback', via: 'get'
end
