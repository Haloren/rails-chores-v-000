class ChoresController < ApplicationController

  def index
    @chore = Chore.new
    @chores = Chore.all
  end


  def show
    @chore = Chore.find(params[:id])
    @task = @chore.tasks.build
  end

  def create
    @chore = Chore.new(chore_params)
    @chore.save

    redirect_to chore_url(@chore)
  end

  private

    def chore_params
      params.require(:chore).permit(:name)
    end
end
