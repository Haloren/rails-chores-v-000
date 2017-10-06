class CreateCycles < ActiveRecord::Migration[5.1]
  def change
    create_table :cycles do |t|
      t.integer :user_id
      t.integer :chore_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
