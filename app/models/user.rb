class User < ActiveRecord::Base
  has_many :restaurants
  has_many :ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def owner?
    self.role == "owner"
  end

  def patron?
    self.role == "patron"
  end
end
