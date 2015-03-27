class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index,]

  def rate_it
    Rating.create(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      value: params[:value])

    render text: "Thanks for your rating!"
  end

  def index
    if current_user && current_user.owner?
      @restaurants = current_user.restaurants.all
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    if current_user
      @has_rating = Rating.where(restaurant_id: @restaurant.id, user_id: current_user.id).exists?
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path, :notice => "Restaurant saved!"
    else
      render "new"
    end
  end

  def edit
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def update
    @restaurant = current_user.restaurants.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurants_path, :notice => "The restaurant's info has been actualized"
    else
      render "edit"
    end
  end

  def destroy
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, :notice => "Your restaurant has been deleted"

  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address, :phone)
    end
end
