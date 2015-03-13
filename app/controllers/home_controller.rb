class HomeController < ApplicationController
 def landing_page
   redirect_to restaurants_path 
 end
end