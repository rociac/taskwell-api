class ProjectBlueprint < Blueprinter::Base
  identifier :id
  field :image_url do |project|
    project.get_image_url
  end

  fields :name, :project_type, :description, :live_link, :user_id
end