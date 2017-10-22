class AddChoreIdToUserChores < ActiveRecord::Migration[5.1]
  def change
    add_column :user_chores, :chore_id, :integer
  end
end
