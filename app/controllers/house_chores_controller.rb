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

  def show
    @house_chore = HouseChore.find(params[:id])
    @task = @house_chore.tasks.build
    @user_chore = UserChore.new
    @users = User.all

  end

  private

    def house_chore_params
      params.require(:house_chore).permit(:house_id, :chore_id)
    end
end
