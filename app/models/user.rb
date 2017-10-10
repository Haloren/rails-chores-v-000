class User < ApplicationRecord

  # t.string "username"
  # t.string "email"
  # t.string "password_digest"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  has_secure_password

  has_many :user_chores
  has_many :chores, through: :user_chores



  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :email, :presence => true

  def house_attributes=(house_attributes)
    self.house = House.where(:name => house_attributes[:name]).first_or_create do |h|
      h.city = house_attributes[:city]
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["username"]
    end
  end
end

end
