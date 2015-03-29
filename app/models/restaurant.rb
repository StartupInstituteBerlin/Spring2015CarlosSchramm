class Restaurant < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many   :reservations
  has_many  :ratings


  validates :description, :address, :phone, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true


  scope :open_ones, ->  {where(status_open: true)}
  scope :closed_ones, -> {where(status_open: false)}


end
