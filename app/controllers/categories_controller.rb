class CategoriesController < ApplicationController

  before_filter :logged_in

  def new
    @category = Category.new
    authorize! :new, @category
  end

  def create
    @category = Category.create(category_params)
    redirect_to categories_path
  end

  def index
    @categories = Category.all
    authorize! :index, @categories
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted"
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:group)
  end



end
