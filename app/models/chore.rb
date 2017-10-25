class Chore < ApplicationRecord

  # t.string "name"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  belongs_to :house, :optional => true

  validates :name, :presence => true
  validates_length_of :name, :minimum => 3


end
