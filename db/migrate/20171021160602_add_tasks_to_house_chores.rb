class AddTasksToHouseChores < ActiveRecord::Migration[5.1]
  def change
    add_column :house_chores, :task, :string
  end
end
