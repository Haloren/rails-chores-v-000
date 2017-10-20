class HousesController < ApplicationController
  include ApplicationHelper

  def new

  end

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @house_chores = @house.chores
  end


end
