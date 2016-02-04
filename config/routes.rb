Verivore::Application.routes.draw do
  resources :posts do
    resources :comments
  end
  
  resources :sessions
  resources :comments
  resources :canned_foods
  resources :tags
  
  #loggin in and out for admin
  get 'admin', :to => 'sessions#new', :as => 'admin'
  delete 'logout', :to => 'sessions#destroy', :as => 'logout'
  
  #static pages
  get 'about', :to => 'static#about', :as => 'about'
  get 'gallery', :to => 'static#gallery', :as => 'gallery'
  
  root :to => 'posts#index'
end 
