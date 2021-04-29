class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :delete, :user_projects]
  before_action :set_project, only: [:show, :update, :destroy]
  
  def index
    @projects = Project.all
    render json: ProjectBlueprint.render(@projects)
  end

  def create
    @project = current_user.projects.create!(project_params)
    render json: ProjectBlueprint.render(@project)
  end

  def show
    render json: ProjectBlueprint.render(@project)
  end

  def update
    @project.update(project_params)
    head :no_content
  end

  def destroy
    @project.destroy
    head :no_content
  end

  def user_projects
    @user_projects = current_user.projects.all
    render json: ProjectBlueprint.render(@user_projects)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.permit(:name, :project_type, :description, :live_link, :image)
  end
end
