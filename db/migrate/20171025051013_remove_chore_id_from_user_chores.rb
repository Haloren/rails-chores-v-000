class RemoveChoreIdFromUserChores < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_chores, :chore_id
  end
end
