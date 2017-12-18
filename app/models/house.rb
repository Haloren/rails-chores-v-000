class House < ApplicationRecord
  # t.string :name
  # t.string :city

  # validates :name, :presence => true

  has_many :users
  has_many :house_chores
  has_many :chores, through: :house_chores

  def next
  	houses = house_ids_by_name
  	house_index = houses.find_index(id)
  	next_house = house_index + 1

  	if next_house < houses.length
  		houses[next_house]
  	else
  		id
  	end
  end

  def prev
  	houses = house_ids_by_name
  	house_index = houses.find_index(id)
  	prev_house = house_index -1

  	if prev_house >= 0
  		houses[prev_house]
  	else
  		id
  	end
  end

  private

    def house_ids_by_name
    	@house_ids ||= House.order(:name => :asc).pluck(:id)
    end

end
