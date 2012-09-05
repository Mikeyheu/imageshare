Imageshare::Application.routes.draw do

  resources :sites

  devise_for :users
  resources :users, :only => [:index, :show]
  root :to => "home#index"

end