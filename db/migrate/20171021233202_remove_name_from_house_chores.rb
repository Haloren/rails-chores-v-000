class RemoveNameFromHouseChores < ActiveRecord::Migration[5.1]
  def change
    remove_column :house_chores, :name
  end
end
