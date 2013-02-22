GenevaEquestrian::Application.routes.draw do
  resources :contacts


  resources :events
  resources :galleries

  ActiveAdmin.routes(self)

  #devise_for :users, ActiveAdmin::Devise.config

  match "/construction", :to => "home#construction"
  match "/home", :to => "home#home"
  match "/facility", :to => "galleries#index", :page=>"facility"
  match "/x_country", :to => "galleries#index", :page=>"x_country"
  match "/clinics", :to => "events#index", :event_type=>"clinic"
  match "/schooling", :to => "events#index", :event_type=>"schooling"
  match "/outside", :to => "events#index", :event_type=>"outside"
  match "/calendar", :to => "events#index", :event_type=>"all"

  root :to => "home#home"

  devise_for :users
  resources :users

  match ':action' => 'pages#:action'
end