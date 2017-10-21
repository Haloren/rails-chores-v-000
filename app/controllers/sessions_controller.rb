class SessionsController < ApplicationController

  def new

  end

  def create
    session[:current_user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session reset
    redirect_to root_path
  end
end
