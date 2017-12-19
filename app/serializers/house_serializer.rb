class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :city
  has_many :house_chores
  has_many :chores, through: :house_chores
end
