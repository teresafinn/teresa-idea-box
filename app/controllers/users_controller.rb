class UsersController < ApplicationController

  before_filter :logged_in

  def show
    @user = User.find(params[:id])
    authorize! :show, @user
  end

end
