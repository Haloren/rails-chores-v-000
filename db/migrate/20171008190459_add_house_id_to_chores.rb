class AddHouseIdToChores < ActiveRecord::Migration[5.1]
  def change
    add_column :chores, :house_id, :integer
  end
end
