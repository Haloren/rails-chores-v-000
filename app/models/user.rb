class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   def house_attributes=(house_attributes)
     self.house = House.where(:name => house_attributes[:name]).first_or_create do |h|
       h.city = house_attributes[:city]
     end
   end

   def self.find_or_create_by_omniauth(auth_hash)
     self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
       user.password = SecureRandom.hex
     end
   end
end
