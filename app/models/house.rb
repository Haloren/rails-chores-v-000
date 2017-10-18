class House < ApplicationRecord
  # t.string :name
  # t.string :city

  has_many :users
  has_many :house_chores
  has_many :chores, through: :house_chores


end
