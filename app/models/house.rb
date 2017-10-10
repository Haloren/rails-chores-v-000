class House < ApplicationRecord
  # t.string :name
  # t.string :city

  has_many :users
end
