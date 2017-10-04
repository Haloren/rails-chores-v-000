class Task < ApplicationRecord
  belongs_to :chore
  validates :description, :presence => true
end
