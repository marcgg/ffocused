Prtfl::Application.routes.draw do
  get "remote_accounts/index"

  # ADMIN
  match "/admin" => "admin#index"
  resources :beta_codes

  # USERS & SESSIONS
  resources :users
  resources :user_sessions
  match "/login"  => "user_sessions#new",     :as => :login
  match "/logout" => "user_sessions#destroy", :as => :logout

  # HOME
  root :to => "home#index"

  # PORTFOLIO
  resources :portfolios do
    post "order_categories",  :on => :collection
    get  "not_setup",         :on => :member
  end

  resources :categories do
    post "order_photos",  :on => :member
    post "reset",         :on => :member
    post "refresh",       :on => :member
    get  "fetch_form",    :on => :collection
  end

  resources :remote_accounts

  resources :oauth do
    get "instagram_connect",  :on => :collection
    get "instagram_callback", :on => :collection
    get "facebook_callback",  :on => :collection
  end

  resources :future_users do
    get "handle", :on => :member
  end

  resources :photos

  # ADDITIONAL PAGES
  match "/faq"      => "faq#index",     :as => :faq
  match "/terms"    => "home#terms",    :as => :terms
  match "/contact"  => "home#contact",  :as => :contact

  # FRONT
  get "/:slug/about"            => "front#about",     :as => :about
  get "/:slug(/:category_slug)" => "front#showcase",  :as => :showcase
end
