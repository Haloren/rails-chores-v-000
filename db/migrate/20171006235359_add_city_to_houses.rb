class AddCityToHouses < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :city, :string
  end
end
