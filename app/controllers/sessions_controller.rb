class SessionsController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id

      redirect_to user_chores_path

    else

      @user = User.find_by(:name => params[:user][:name])
      #raise params.inspect
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id

        redirect_to root_url, notice: 'Logged in!'
      else
        flash.now.alert = 'Email or password is invalid'
        render :new
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
