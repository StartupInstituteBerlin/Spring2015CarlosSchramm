class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end

  def show
     @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurants])
 
      if @restaurant.save
        redirect_to restaurants_path, :notice => "Restaurant saved!"
      else
        render "new"
      end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
	
    	if @restaurant.update_attributes(params[:restaurant]) 
    		redirect_to restaurants_path, :notice => "The restaurant's info has been actualized"
    	else
    		render "edit"
    	end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    	@restaurant.destroy
    	redirect_to restaurants_path, :notice => "Your restaurant has been deleted"
     
  end
end
