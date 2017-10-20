class User < ApplicationRecord

  belongs_to :house
  has_many :user_chores
  has_many :chores, through: :user_chores

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


   def house_attributes=(house_attributes)
     self.house = House.where(:name => house_attributes[:name]).first_or_create
   end


end
