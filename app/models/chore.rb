class Chore < ActiveRecord::Base
  has_many :tasks
  validates :presence => :name
end
