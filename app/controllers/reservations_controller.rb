class ReservationsController < ApplicationController
  
  def index
  end
  
  def new
    @reservation = Reservation.new(restaurant_id: params[:restaurant_id])
  end
  
  def create
    @reservation = Reservation.create(reservation_params)
    
    puts @reservation.inspect # this is how you can debug nicely
    
    if @reservation.valid?
      ReservationsMailer.send_reservation_confirmation(@reservation).deliver
      redirect_to restaurant_path(@reservation.restaurant_id), :notice => "Reservation saved!"
    else
      render "new", restaurant_id: @reservation.restaurant
    end
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:email, :last_name, :restaurant_id, :number_of_people, :date)
    end
  
end
