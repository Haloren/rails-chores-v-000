class Chore < ApplicationRecord

  # t.string "name"
  # t.integer "house_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false

  belongs_to :house
  has_many :tasks
  has_many :user_chores
  has_many :users, through: :user_chores

  validates :name, :presence => true


end
