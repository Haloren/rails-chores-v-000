class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  include ApplicationHelper

  def index
  end

  def show
    if logged_in?
      render :show
    else
      redirect_to action: 'index'
    end
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user)
   else
     render :new
   end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :house_id, :house_attributes => [:name, :city])
    end

    def set_user
      @user = User.find(params[:id])
    end
end
