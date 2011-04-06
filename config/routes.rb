Prtfl::Application.routes.draw do
  get "/showcase/:id(/:category_id)" => "front#showcase"

  root :to => "home#index"
  
  resources :portfolios
  
  resources :categories
end
