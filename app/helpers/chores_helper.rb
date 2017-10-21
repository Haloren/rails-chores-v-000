module ChoresHelper
  def house_user
    User.where("house_id = ?", @user.house_id)
  end
end
