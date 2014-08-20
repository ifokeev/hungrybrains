Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :auth do
    root 'auth#index'

    get "sign_up"   => "auth#sign_up",        :as => "sign_up"
    get "login"   => "sessions#new",        :as => "login"
    post "create" => "sessions#create"
    get "logout"  => "sessions#destroy",    :as => "logout"
  end

  root 'welcome#index'

  resources :companies, :info, :vacancies
  resources :users
end
