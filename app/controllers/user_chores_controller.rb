class UserChoresController < ApplicationController

  def new
    @user_chore = UserChore.new
  end

  def create
    @users = User.all
    @user_chore = UserChore.new(user_chore_params)
    if @user_chore.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
    def user_chore_params
      params.require(:user_chore).permit(:chore_id, :user_id)
    end

end
