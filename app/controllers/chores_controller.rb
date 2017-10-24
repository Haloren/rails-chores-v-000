class ChoresController < ApplicationController
  include ApplicationHelper
  before_action :authorize

  def index
    @chore = Chore.new
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def create
    @chore = Chore.new(chore_params)
    if @chore.save

      redirect_to chores_path
    else
      render :new
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy

    redirect_to chores_path
  end

  private

  def chore_params
    params.require(:chore).permit(:name, :house_id)
  end

end
