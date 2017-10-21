class HousesController < ApplicationController
  include ApplicationHelper

  def new

  end

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @users = User.housemate(current_user)
    @chore = Chore.new
    @house_chores = @house.chores
  end


end
