class Project < ApplicationRecord
  include Rails.application.routes.url_helpers
  after_commit :add_default_image, on: [:create, :update]
  
  validates_presence_of :name, :project_type
  belongs_to :user

  has_one_attached :image

  def get_image_url
    url_for(self.image)
  end

  private
  
    def add_default_image
      unless image.attached?
        self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'project_default.jpg')), filename: 'project_default.jpg', content_type: 'image/jpg')
      end
    end
end
