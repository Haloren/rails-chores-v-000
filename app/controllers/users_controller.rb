class UsersController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @users = User.all
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
    @user.build_house
  end

  def show
    @user = User.find(params[:id])
    @user_chore = UserChore.find_by(params[:user_id])

  end

  def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to root_url, notice: 'Thank you for signing up!'
   else
     render :new
   end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :house_id, :house_attributes => [:name, :city])
    end

end
