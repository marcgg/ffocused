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
  match "/signup" => "users#new"

  resources :forgotten_passwords, :only => [:create, :edit, :update]
  match "/forgotten_passwords" => "forgotten_passwords#new", :as => :reset_password

  # HOME
  root :to => "home#index"

  # PORTFOLIO
  resources :portfolios do
    post "order_categories",        :on => :collection
    get  "not_setup",               :on => :member
  end

  match "/stats" => "stats#index", :as => :stats

  resources :categories do
    post "order_photos",  :on => :member
    post "reset",         :on => :member
    post "refresh",       :on => :member
    get  "fetch_form",    :on => :collection
  end

  resources :remote_accounts do
    get "expired", :on => :member
  end

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
  match "/faq"      => "faq#index",       :as => :faq
  match "/terms"    => "home#terms",      :as => :terms
  match "/contact"  => "home#contact",    :as => :contact
  match "/how_to/themes" => "faq#themes", :as => :themes_tutorial

  # FRONT
  get "/:slug/about"            => "front#about",       :as => :about
  get "/:slug/most_recent"      => "front#most_recent", :as => :most_recent
  get "/:slug(/:category_slug)" => "front#showcase",    :as => :showcase
  get "/:slug/:category_slug/:photo_id" => "front#single_photo", :as => :single_photo
end
