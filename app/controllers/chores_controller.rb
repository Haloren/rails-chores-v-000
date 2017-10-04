class ChoresController < ApplicationController

  def index
    @chore = Chore.new
    @chores = Chore.all
  end


  def show
    @chore = Chore.find(params[:id])
  end

  def create
    @chore = Chore.new
    @chore.name = params[:chore][:name]
    @chore.save

    redirect_to chore_path(@chore)
  end
end
