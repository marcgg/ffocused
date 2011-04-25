Prtfl::Application.routes.draw do
  match "/admin" => "admin#index"

  get "/photos/:slug/about" => "front#about", :as => :about
  get "/photos/:slug(/:category_slug)" => "front#showcase", :as => :showcase
  
  resources :users
  resources :user_sessions
  match "/login" => "user_sessions#new", :as => :login
  match "/logout" => "user_sessions#destroy", :as => :logout
  
  root :to => "home#index"
  
  resources :portfolios do
    post "order_categories", :on => :collection
  end
  
  resources :categories do
    post "order_photos", :on => :member
    post "reset_category", :on => :member
  end
  
  resources :photos
end
