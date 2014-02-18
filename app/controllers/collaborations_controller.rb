class CollaborationsController < ApplicationController

  before_filter :authenticate_user!

  def new
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
    @collaborators = @wiki.collaborations
    @wiki = Wiki.find(params[:wiki])

    @collaborator.pluck(:user_id)
  end
end
