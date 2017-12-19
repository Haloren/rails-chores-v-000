class HouseChoreSerializer < ActiveModel::Serializer
  attributes :id, :house_id, :chore_id
  belongs_to [:house, :chore]
end
