class House < ApplicationRecord

  # t.string "name"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  has_many :users
  has_many :chores

  validates :name, :presence => true
  validates :name, :uniqueness => true
end
