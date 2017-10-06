class Task < ActiveRecord::Base
  belongs_to :chore
  validates :description, :presence => true
end
