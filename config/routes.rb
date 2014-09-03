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


  # профиль если компания
  constraints(RouteConstraints::CompanyRequiredConstraint.new) do
    scope module: "profile" do
      get '/profile', to: 'company#responses'
      get '/profile/edit', to: 'company#edit'
    end
  end

  # профиль если студент
  constraints(RouteConstraints::StudentRequiredConstraint.new) do
    #resources :student, module: "profile", path: "/profile" // пример в случае чего
    scope module: "profile" do
      get '/profile', to: 'student#index'
      get '/profile/edit', to: 'student#edit'
      get '/profile/responses', to: 'student#responses'
      get '/profile/subs', to: 'student#subs'
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

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
end
