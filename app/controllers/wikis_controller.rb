class WikisController < ApplicationController

  def index
    if current_user
      @wikis = Wiki.public
      @wikis += current_user.wikis
    else
      @wikis = Wiki.public
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize! :create, Wiki, message: "You need to be a member to create a new wiki."
  end

  def create
     # raise
    @wiki = current_user.wikis.build(params[:wiki])
    authorize! :create, @wiki, message: "You need to be signed up to do that."
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :update, Wiki, message: "You need to be the owner or a collaborator to edit the wiki."
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You need to be the owner or a collaborator to edit the wiki."
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the Wiki. Please try again."
      render :edit
    end
  end
end
