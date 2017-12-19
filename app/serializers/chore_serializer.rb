class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :house, serializer: ChoreHouseSerializer
end
