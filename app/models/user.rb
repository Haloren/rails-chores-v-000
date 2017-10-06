class User < ActiveRecord::Base
  has_secure_password

  has_many :cycles
  has_many :chores, through: :cycles

  belongs_to :house

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :email, :presence => true

end
