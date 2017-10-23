class User < ApplicationRecord
  has_secure_password

  belongs_to :house, :optional => true

  has_many :user_chores
  has_many :chores, through: :user_chores

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def house_attributes=(house_attributes)
    self.house = House.where(:name => house_attributes[:name]).first_or_create do |h|
      h.city = house_attributes[:city]
    end
  end

  scope :housemate, -> (house_id){ where house_id: house_id }

end
