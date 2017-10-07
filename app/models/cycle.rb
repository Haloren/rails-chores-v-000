class Cycle < ApplicationRecord

  # t.integer "user_id"
  # t.integer "chore_id"
  # t.integer "status", default: 0
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  belongs_to :chore
  belongs_to :user

end
