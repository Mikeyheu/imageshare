Imageshare::Application.routes.draw do

  # match '', to: 'sites#show', constraints: {subdomain: /.+/}
  devise_for :users
  resources :users, :only => [:index, :show]
  root :to => "home#index"
  
  resources :collections do  #nest images under collections

  	resources :images do
      post :sort, on: :collection
  end
  end

  resources :sites do
  	  resources :collections 

  end



end
