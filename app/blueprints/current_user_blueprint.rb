class CurrentUserBlueprint < Blueprinter::Base
  identifier :id
  field :avatar_url do |user|
    user.get_avatar_url
  end

  fields :email, :first_name, :last_name, :site_url, :username
end