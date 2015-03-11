class Restaurant < ActiveRecord::Base
  belongs_to :user
  

  validates :description, :address, :phone, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  

  scope :open_ones, ->  {where(status_open: true)}
  scope :closed_ones, -> {where(status_open: false)}


end
