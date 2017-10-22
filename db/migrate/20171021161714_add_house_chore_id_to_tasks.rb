class AddHouseChoreIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :house_chore_id, :integer
  end
end
