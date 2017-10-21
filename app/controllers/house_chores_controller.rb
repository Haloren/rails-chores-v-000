class HouseChoresController < ApplicationController
  def create
    @house = House.find_by(id: params[:id])
    @chore = Chore.find_by(id: params[:id])
    @house_chore = HouseChore.new(house_chore_params)
    if @house_chore.save

      redirect_to house_path(current_user.house)
    else
      render 'houses/show'
    end
  end

  private

    def house_chore_params
      params.require(:house_chore).permit(:name, :house_id, :chore_id)
    end
end
