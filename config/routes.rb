GenevaEquestrian::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  match "/construction", :to => "home#construction"
  match "/home", :to => "home#home"


  root :to => "home#home"

  devise_for :users
  resources :users

  match ':action' => 'pages#:action'
end