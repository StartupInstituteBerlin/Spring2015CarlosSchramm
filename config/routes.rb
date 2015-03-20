Rails.application.routes.draw do
  resources :reservations, only: [:index, :create, :destroy]
  get '/restaurants/:restaurant_id/reservations/new' => 'reservations#new', as: :new_reservation_for_restaurant
  put '/reservations/:id' => 'reservations#accept', as: :accept_reservation
  get '/restaurants/:restaurant_id/rate_it/:value' => 'restaurants#rate_it', as: :rate_restaurant
  devise_for :users

  root to: "home#landing_page"
  resources :restaurants
  #root :to => "restaurants#index"


end
