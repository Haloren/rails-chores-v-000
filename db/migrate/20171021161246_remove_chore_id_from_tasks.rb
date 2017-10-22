class RemoveChoreIdFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :chore_id
  end
end
