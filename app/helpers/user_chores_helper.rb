module UserChoresHelper
  def li_class_for_user_chore(user_chore)
    "completed" if user_chore.complete?
  end
end
