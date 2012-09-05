Imageshare::Application.routes.draw do

  resources :images
  resources :collections
  resources :sites

  match '', to: 'sites#show', constraints: {subdomain: /.+/}
  devise_for :users
  resources :users, :only => [:index, :show]
  root :to => "home#index"



end
