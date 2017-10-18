class ChoresController < ApplicationController
  include ApplicationHelper


  def index
      @chore = Chore.new
      @chores = Chore.all
  end

  def show
      @users = User.all
      @chore = Chore.find(params[:id])
      #byebug
      @user_chore = @chore.user_chores.build
      @task = @chore.tasks.build
  end

  def create

    @chore = Chore.new(chore_params)
    if @chore.save

      redirect_to chore_url(@chore)
    else
      # @chores = Chore.all
      render :index
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy

    redirect_to chore_url(@chore)
  end

  private

  def chore_params
    params.require(:chore).permit(:name)
  end

end
