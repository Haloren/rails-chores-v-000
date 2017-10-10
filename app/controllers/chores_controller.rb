class ChoresController < ApplicationController

  def index
    @chore = Chore.new
    @chores = Chore.all
  end


  def show
    @chore = Chore.find(params[:id])
    @user_chore = UserChore.new
    @task = @chore.tasks.build
  end

  def create
    @chore = Chore.new(chore_params)
    if @chore.save
      redirect_to chore_url(@chore)
    else
      @chores = Chore.all
      render :index
    end
  end

  private

    def chore_params
      params.require(:chore).permit(:name)
    end
end
