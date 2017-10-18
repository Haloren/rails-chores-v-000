class HouseChore < ApplicationRecord

  # t.string "name"
  # t.integer "house_id"
  # t.integer "chore_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false


  belongs_to :house
  belongs_to :chore
  
end
