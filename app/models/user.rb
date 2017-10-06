class User < ApplicationRecord
  has_secure_password

  has_many :cycles
  has_many :chores
  has_many :tasks, through: :chores

  belongs_to :house

  validates :username, :uniqueness => true
  validates :username, :presemce => true
  validates :email, :presence => true
  
end
