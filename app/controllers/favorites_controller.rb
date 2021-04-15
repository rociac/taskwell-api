class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def index
    @favorite_projects = current_user.favorite_projects
    json_response(@favorite_projects)
  end

  def create
    unless current_user.favorites.exists?(favorited: @project, user: current_user)
      current_user.favorites.create!(favorited: @project, user: current_user)
      json_response(current_user.favorite_projects, :created)
    else
      puts "Already favorited"
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
