class UserChoresController < ApplicationController
  include ApplicationHelper

  def index
    @user_chores = UserChore.all
  end

  def show
    @user_chore = UserChore.find_by(params[:id])
  end

  def new
    @user_chore = UserChore.new
  end

  def create
    @user = User.find_by(params[:id])
    @chore = Chore.find_by(params[:id])
    @user_chore = UserChore.new(user_chore_params)
    #raise params.inspect
    if @user_chore.save
      redirect_to user_chores_path
    else

      render :'chores/show'
    end
  end

  private
    def user_chore_params
      params.require(:user_chore).permit(:chore_id, :user_id)
    end

end
