class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id

      redirect_to user_chores_path

    else

      @user = User.find_by(:email => params[:user][:email])
      #raise params.inspect
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id

        redirect_to user_chores_path
      else

        render :'sessions/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
