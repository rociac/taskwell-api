require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:project_type) }

  it { should belong_to(:user) }
end