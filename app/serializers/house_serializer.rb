class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :city
  has_many :chores, serializer: HouseChoreSerializer
end
