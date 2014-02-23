class CollaborationsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @collaborator = Collaboration.new
  end

  def create
    # raise
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaboration.new(user_id: params[:collaboration][:user_id], wiki_id: @wiki.id)
    if @collaborator.save
      flash[:notice] = "Collaborator was added."
      redirect_to wiki_collaborations_path(@wiki)
    else
      flash[:error] = "There was an error adding a collaborator. Please try again."
      render :new
    end
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.new
    @collaborations = @wiki.collaborations
    @collaborators = @wiki.collaborators
  end

  def destroy
    #raise
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.find(params[:id])

    if @collaboration.destroy
      #flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to wiki_collaborations_path(@wiki)
    else
      flash[:error] = "There was an error deleting the topic."
      render :index
    end
  end
end
