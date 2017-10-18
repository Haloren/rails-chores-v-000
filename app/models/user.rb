class User < ApplicationRecord

  # t.string "email"
  # t.string "password_digest"
  # t.integer "house_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  has_secure_password

  has_many :user_chores
  has_many :chores, through: :user_chores

  belongs_to :house

  validates :name, presence: { message: "A unique name must be provided please" }
  validates :name, uniqueness: { message: "That name seems to taken..."}

  validates :email, presence: { message: "Email must be provided please" }
  validates :email, uniqueness: { message: "That address seems to taken..."}



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
