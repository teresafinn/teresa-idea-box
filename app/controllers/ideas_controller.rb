class IdeasController < ApplicationController

  before_filter :logged_in

  def new
    @idea = Idea.new
    authorize! :new, @idea
  end

  def create
    @idea = current_user.ideas.create(idea_params)
    redirect_to current_user
  end

  def edit
    @idea = Idea.find(params[:id])
    authorize! :edit, @idea
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(idea_params)
      flash[:notice] = "Successfully updated"
      redirect_to current_user
    else
      flash[:notice] = "Not updated"
      redirect_to current_user
    end
  end

  def destroy
    @idea = Idea.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted"
    redirect_to current_user
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :image_id)
  end
end
