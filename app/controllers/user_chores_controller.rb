class UserChoresController < ApplicationController

  def index
    @user_chores = UserChore.all
  end

  def new
    @user_chore = UserChore.new
  end

  def create
    @users = User.all

    @user_chore = UserChore.new(user_chore_params)
    if @user_chore.save
      redirect_to user_chores_path(@user_chore)
    else
      render :'chores/show'
    end
  end

  private
    def user_chore_params
      params.require(:user_chore).permit(:chore_id, :user_id)
    end

end
