class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :delete, :index]
  before_action :set_project, only: [:show, :update, :destroy]
  
  def index
    @projects = current_user.projects.all
    json_response(@projects)
  end

  def create
    @project = current_user.projects.create!(project_params)
    json_response(@project, :created)
  end

  def show
    json_response(@project)
  end

  def update
    @project.update(project_params)
    head :no_content
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.permit(:name, :project_type, :description, :live_link)
  end
end
