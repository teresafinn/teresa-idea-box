class ImagesController < ApplicationController

  before_filter :logged_in

  def new
    @image = Image.new
    authorize! :new, @image
  end

  def create
    @image = Image.create(image_params)
    redirect_to images_path
  end

  def index
    @images = Image.all
    authorize! :index, @images
  end

  def destroy
    @image = Image.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted"
    redirect_to images_path
  end


  private

  def image_params
    params.require(:image).permit(:name, :url)
  end


end
