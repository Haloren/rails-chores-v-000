class ChoresController < ApplicationController
  include ApplicationHelper

  def index
    @chore = Chore.new
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
    @task = @chore.tasks.build
    @user_chore = UserChore.new
    @users = User.housemate(current_user)
  end

  def create
    @chore = Chore.new
    @chore.name = params[:chore][:name]
    @chore.save

    redirect_to chore_path(@chore)

  end

  # def destroy
  #   @chore = Chore.find(params[:id])
  #   @chore.destroy
  #
  #   redirect_to chore_url(@chore)
  # end

  # private
  #
  # def chore_params
  #   params.require(:chore).permit(:name)
  # end

end
