class HomeController < ApplicationController
 def landing_page
   redirect_to restaurants_path if current_user
 end
end