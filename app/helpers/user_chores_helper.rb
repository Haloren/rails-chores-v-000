module UserChoresHelper
  def li_class_for_user_chore(user_chore)
    "completed" if user_chore.complete?
  end

  def li_for_user_chore(user_chore)
    content_tag_for :li, user_chore, :class => li_class_for_user_chore(user_chore) do
      yield
    end
  end
end
