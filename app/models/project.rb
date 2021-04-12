class Project < ApplicationRecord
  validates_presence_of :name, :project_type
  belongs_to :user
end
