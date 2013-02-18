GenevaEquestrian::Application.routes.draw do
  get "galleries/index"

  get "galleries/show"

  get "galleries/edit"

  get "galleries/update"

  get "galleries/new"

  get "galleries/create"

  get "galleries/destroy"

  get "events/index"

  get "events/show"

  get "events/edit"

  get "events/update"

  get "events/new"

  get "events/create"

  get "events/destroy"

  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  match "/construction", :to => "home#construction"
  match "/home", :to => "home#home"


  root :to => "home#home"

  devise_for :users
  resources :users

  match ':action' => 'pages#:action'
end