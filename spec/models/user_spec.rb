require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  it { should have_many(:projects) }
  it { should have_many(:favorites) }
  it { should have_many(:favorite_projects) }

  it { should have_one_attached(:avatar) }

end
