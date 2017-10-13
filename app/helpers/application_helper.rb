module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    user = User.find(session[:user_id])
  end

  def current_user_has_chore?
    user = User.find(session[:user_id])
    user.chores.count > 0
  end
end
