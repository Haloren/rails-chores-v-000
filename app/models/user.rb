class User < ApplicationRecord
  has_secure_password

  belongs_to :house, :optional => true

  has_many :user_chores
  has_many :chores, through: :user_chores

  def house_attributes=(house_attributes)
    self.house = House.where(:name => house_attributes[:name]).first_or_create do |h|
      h.city = house_attributes[:city]
    end
  end
end
