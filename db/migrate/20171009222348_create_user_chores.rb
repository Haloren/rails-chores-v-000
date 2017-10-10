class CreateUserChores < ActiveRecord::Migration[5.1]
  def change
    create_table :user_chores do |t|
      t.references :user
      t.references :chore
      t.integer :status, default: 0
    end
  end
end
