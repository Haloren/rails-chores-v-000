class CreateHouseChores < ActiveRecord::Migration[5.1]
  def change
    create_table :house_chores do |t|
      t.string :name
      t.integer :house_id
      t.integer :chore_id

      t.timestamps
    end
  end
end
