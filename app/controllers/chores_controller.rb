class ChoresController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @chore = Chore.new
      @chores = Chore.all
    else
      redirect_to '/login'
  end

  def show
    if logged_in?
      @users = User.all
      @chore = Chore.find(params[:id])
      @user_chore = @chore.user_chores.build
      @task = @chore.tasks.build
    else
      redirect_to '/login'
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
