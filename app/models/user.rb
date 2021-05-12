class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  include Rails.application.routes.url_helpers
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  after_commit :add_default_avatar, on: [:create, :update]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username
  validates_uniqueness_of :email, format: { with: VALID_EMAIL_REGEX }

  has_many :projects
  has_many :favorites
  has_many :favorite_projects, through: :favorites, source: :favorited, source_type: 'Project'

  has_one_attached :avatar

  def get_avatar_url
    url_for(self.avatar)
  end

  private

  def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar_default.png')), filename: 'avatar_default.png', content_type: 'image/png')
    end
  end
end
