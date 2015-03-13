class ReservationsMailer < ApplicationMailer
  
  def send_reservation_confirmation(reservation)
    @last_name = reservation.last_name
    @date      = reservation.date
    @restaurant_name = reservation.restaurant.name
    
    mail(to: reservation.email, subject: "Reservation Confirmation")
  end
  
  
end
