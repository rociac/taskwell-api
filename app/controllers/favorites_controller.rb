class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:create, :favorited, :destroy]

  def index
    @favorite_projects = current_user.favorite_projects
    render json: ProjectBlueprint.render(@favorite_projects)
  end

  def create
    unless current_user.favorites.exists?(favorited: @project, user: current_user)
      @favorite = Favorite.create!(favorited: @project, user: current_user)
      json_response(@favorite, :created)
    else
      render json: {
        status: {message: "Already favorited"}
      }, status: :unprocessable_entity
    end
  end

  def destroy
    Favorite.where(favorited_id: @project.id, user_id: current_user.id).first.destroy
  end

  private

  def set_project
    @project = Project.find(params[:project_id] || params[id])
  end
end