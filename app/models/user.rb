class User < ApplicationRecord

  # t.string "username"
  # t.string "email"
  # t.string "password_digest"
  # t.integer "house_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  has_secure_password

  has_many :cycles
  has_many :chores, through: :cycles

  belongs_to :house


  validates :username, :presence => true
  validates :username, :uniqueness => true

  def house_attributes=(house_attributes)
    self.house = House.where(:name => house_attributes[:name]).first_or_create do |h|
      h.city = house_attributes[:city]
    end
  end


end
