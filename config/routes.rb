Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#landing_page"
  resources :restaurants
  #root :to => "restaurants#index"
   
end
