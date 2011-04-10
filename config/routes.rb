Prtfl::Application.routes.draw do
  get "/showcase/:id/about" => "front#about"
  get "/showcase/:id(/:category_id)" => "front#showcase"

  root :to => "home#index"
  
  resources :portfolios do
    post "order_categories", :on => :collection
  end
  
  resources :categories do
    post "order_photos", :on => :member
  end
end
