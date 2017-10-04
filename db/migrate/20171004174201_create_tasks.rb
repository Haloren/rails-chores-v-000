class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :chore_id

      t.timestamps null: false
    end
  end
end
