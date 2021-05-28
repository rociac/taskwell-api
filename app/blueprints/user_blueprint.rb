class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :email, :created_at
  
  field :avatar_url do |user|
    user.get_avatar_url
  end

  field :created_date do |user|
    user.created_at && user.created_at.strftime('%d/%m/%Y')
  end
end