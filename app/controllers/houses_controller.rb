class HousesController < ApplicationController
  include ApplicationHelper
  before_action :authorize

  def new

  end

  def index
    @houses = House.all
    @user = current_user
  end

  def show
    @house = House.find(params[:id])
    @users = User.housemate(current_user)
    @house_chore = HouseChore.new
    @house_chores = HouseChore.all
  end


end
