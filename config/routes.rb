Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  resources :users,         only: [:new, :create]
  resources :sessions,      only: [:new, :create, :destroy]
  resources :responses,     only: [:create, :destroy, :update]
  resources :relationships, only: [:create, :destroy]  
  resources :feedbacks,     only: [:new, :create]
  resources :info
  resources :students do
    member do
      get :responses, :companies
      match '/following', to: 'students#companies', via: 'get'
    end
  end
  resources :companies, :vacancies do
    member do
      get :responses
    end
  end
  root 'static_pages#index'
  match '/signup',   to: 'users#new',             via: 'get'
  match '/signin',   to: 'sessions#new',          via: 'get'
  match '/signout',  to: 'sessions#destroy',      via: [:get, :delete]
  match '/about',    to: 'static_pages#about',    via: 'get'
  match '/contact',  to: 'static_pages#contact',  via: 'get'
  match '/feedback', to: 'feedbacks#new',         via: 'get'

  match '/vacancies/:id/responses/unreviewed', to: 'vacancies#unreviewed', via: 'get'
  match '/vacancies/:id/responses/accepted',   to: 'vacancies#accepted',   via: 'get'
  match '/vacancies/:id/responses/rejected',   to: 'vacancies#rejected',   via: 'get'

  get '/auth/vk/company', to: 'omniauth_callbacks#vkontakte_company'
  get '/auth/vk/student', to: 'omniauth_callbacks#vkontakte_student'
  get '/auth/tw/company', to: 'omniauth_callbacks#twitter_company'
  get '/auth/tw/student', to: 'omniauth_callbacks#twitter_student'
end
