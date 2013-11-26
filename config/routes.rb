Authentication::Application.routes.draw do

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sing_up" => "users#new", :as => "sing_up"

  root 'sessions#new'

  resources :roles

  resources :users

  resources :sessions
end
