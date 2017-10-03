class ChoresController < ApplicationController

  def index
  end

  def show
    #raise params.inspect
    @chore = Chore.find(params[:id])
  end
end
