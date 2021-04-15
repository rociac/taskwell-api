class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username
  has_many :projects
  has_many :favorites
  has_many :favorite_projects, through: :favorites, source: :favorited, source_type: 'Project'
end
