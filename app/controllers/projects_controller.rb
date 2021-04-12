class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
    json_response(@projects)
  end

  def create
    @project = current_user.projects.create!(project_params)
    json_response(@project, :created)
  end
end
