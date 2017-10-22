class RemoveTaskFromHouseChores < ActiveRecord::Migration[5.1]
  def change
    remove_column :house_chores, :task
  end
end
