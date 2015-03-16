Rails.application.routes.draw do
  resources :reservations, only: [:index, :create, :destroy]
  get '/restaurants/:restaurant_id/reservations/new' => 'reservations#new', as: :new_reservation_for_restaurant

  devise_for :users
  
  root to: "home#landing_page"
  resources :restaurants
  #root :to => "restaurants#index"
  
   
end
