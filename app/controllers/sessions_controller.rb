class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:arbitrary_session][:username])
    if user && user.authenticate(params[:arbitrary_session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:notice] = "Invalid login."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
