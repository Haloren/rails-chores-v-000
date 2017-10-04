class Task < ApplicationRecord
  belongs_to :chore
  validates :presence => :description
end
