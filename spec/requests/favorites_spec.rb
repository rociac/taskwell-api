require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'Favorites API', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:project) { create(:project, user_id: user_id) }
  let!(:new_user) { create(:user) }
  let(:new_user_id) { new_user.id }
  let(:header) { {'Accept' => 'application/json', 'Content-Type' => 'application/json' } }

  describe 'GET /api/user_favorites' do
    let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(header, user) }
    let(:favorite) { create(:favorite, favorited: project, user: user) }
    before(:each) do
      user.favorites.push(favorite)
      get '/api/user_favorites', headers: auth_headers
    end

    it 'returns the user favorite projects' do
      expect(json.size).to eq(1)
    end

    it 'returns status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/favorite_projects' do
    let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(header, user) }
    let!(:new_project) { create(:project, user_id: user_id) }
    before do
      @valid_attributes = { project_id: new_project.id }
      @valid_attributes = @valid_attributes.to_json
      post '/api/favorite_projects', headers: auth_headers, params: @valid_attributes
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'DELETE api/favorite_projects' do
    let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(header, user) }
    let(:favorite) { create(:favorite, favorited: project, user: user) }
    before(:each) do
      user.favorites.push(favorite)
      @valid_attributes = { project_id: project.id }
      @valid_attributes = @valid_attributes.to_json
      delete '/api/favorite_projects', headers: auth_headers, params: @valid_attributes
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end