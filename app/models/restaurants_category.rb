class RestaurantsCategory < ActiveRecord::Base
  has_many :restaurants
  
end
