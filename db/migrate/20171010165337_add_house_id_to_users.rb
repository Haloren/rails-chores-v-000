class AddHouseIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :house_id, :integer
  end
end
