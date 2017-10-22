class AddHouseChoreIdToUserChores < ActiveRecord::Migration[5.1]
  def change
    add_column :user_chores, :house_chore_id, :integer
  end
end
