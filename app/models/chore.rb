class Chore < ApplicationRecord

  # t.string "name"
  # t.integer "house_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  belongs_to :house, :optional => true

  validates :name, :presence => true


end
