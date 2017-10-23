class Task < ApplicationRecord

  # t.string "description"
  # t.integer "chore_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  belongs_to :house_chore
  
  validates :description, :presence => true
  validates_length_of :description, :minimum => 3
end
