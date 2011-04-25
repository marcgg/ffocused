Prtfl::Application.routes.draw do
  match "/admin" => "admin#index"

  get "/p/:slug/about" => "front#about", :as => :about
  get "/p/:slug(/:category_slug)" => "front#showcase", :as => :showcase
  
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
    post "reset", :on => :member
    post "refresh", :on => :member
  end
  
  resources :photos
  
  match "/faq" => "faq#index", :as => :faq
end
