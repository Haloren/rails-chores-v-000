class UserChore < ApplicationRecord

  # t.integer "user_id"
  # t.integer "chore_id"
  # t.integer "status", default: 0
  # t.index ["chore_id"], name: "index_user_chores_on_chore_id"
  # t.index ["user_id"], name: "index_user_chores_on_user_id"

  belongs_to :chore
  belongs_to :user


  STATUS = {
    :incomplete => 0,
    :complete => 1
  }

  def complete?
    self.status == STATUS[:complete]
  end

  def incomplete?
    self.status == STATUS[:incomplete]
  end
  
end
