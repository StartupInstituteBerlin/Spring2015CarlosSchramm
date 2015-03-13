class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  validates :last_name, :date, :number_of_people, presence: true
end
