Prtfl::Application.routes.draw do
  # ADMIN
  match "/admin" => "admin#index"
  resources :beta_codes
  
  # FRONT
  get "/p/:slug/about" => "front#about", :as => :about
  get "/p/:slug(/:category_slug)" => "front#showcase", :as => :showcase
  
  # USERS & SESSIONS
  resources :users
  resources :user_sessions
  match "/login" => "user_sessions#new", :as => :login
  match "/logout" => "user_sessions#destroy", :as => :logout
  
  # HOME
  root :to => "home#index"
  
  # PORTFOLIO
  resources :portfolios do
    post "order_categories", :on => :collection
  end

  resources :categories do
    post "order_photos", :on => :member
    post "reset", :on => :member
    post "refresh", :on => :member
  end
  
  resources :photos
  
  # ADDITIONAL PAGES
  match "/faq" => "faq#index", :as => :faq
  match "/terms" => "home#terms", :as => :terms
  match "/contact" => "home#contact", :as => :contact
end
