Rails.application.routes.draw do
  root :to => 'welcome#index'
  resources :users
  get "logout" => "users#destroy_login", :as => "logout"
  match "login" => "users#verify_login", :as => "login", :via => [:get,:post]
  match "password" => "users#password", :as => "password", :via => [:get,:post]
  match "reset" => "users#reset", :as => "reset", :via => [:get,:post]
  match "reset_link/:id" => "users#reset_link", :as => "reset_link", :via => [:get,:post]
  match "success_link" => "users#success_link", :as => "success_link", :via => [:get,:post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
