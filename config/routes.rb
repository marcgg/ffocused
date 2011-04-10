Prtfl::Application.routes.draw do
  get "/showcase/:id/about" => "front#about"
  get "/showcase/:id(/:category_id)" => "front#showcase"
  
  resources :users
  resources :user_sessions
  match "/login" => "user_sessions#new"
  match "/logout" => "user_sessions#destroy"
  
  root :to => "home#index"
  
  resources :portfolios do
    post "order_categories", :on => :collection
  end
  
  resources :categories do
    post "order_photos", :on => :member
  end
end
