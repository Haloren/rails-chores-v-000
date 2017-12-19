class HouseChoreSerializer < ActiveModel::Serializer
  attributes :id, :chore_id, :house_id
  belongs_to :house, serializer: HouseChoreHouseSerializer
  belongs_to :chore, serializer: HouseChoreChoreSerializer
end
