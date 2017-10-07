class UsersController < ApplicationController

  def new
    @user = User.new
    @user.build_house
  end

  def create
   @user = User.new(user_params)
   if @user.save
     redirect_to @user
   else
     render :new
   end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :house_id, :house_attributes => [:name, :city])
    end
end
