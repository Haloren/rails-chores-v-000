class UserChoresController < ApplicationController
  include ApplicationHelper
  # before_action :authorize
  load_and_authorize_resource

  def index
    @user_chores = UserChore.all

  end

  def show
    @overdue_chores = UserChore.overdue
  end

  def new
    @user_chore = UserChore.new
  end

  def create
    @user = User.find_by(params[:id])
    @house_chore = HouseChore.find_by(params[:id])
    @user_chore = UserChore.new(user_chore_params)
    #raise params.inspect
    if @user_chore.save

      redirect_to user_chores_path
    else

      render :'house_chores/show'
    end
  end

  def update
    @user_chore = UserChore.find(params[:id])
    @user_chore.update(user_chore_params)

    redirect_to user_chores_path
  end

  def destroy
    @user_chore = UserChore.find(params[:id])
    @user_chore.destroy

    redirect_to user_chores_path
  end

  private
    def user_chore_params
      params.require(:user_chore).permit(:house_chore_id, :user_id, :due_date, :status)
    end

end
