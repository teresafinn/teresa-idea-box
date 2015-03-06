class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:arbitrary_session][:username])
    redirect_to user
  end

end
