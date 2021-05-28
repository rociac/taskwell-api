class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: CurrentUserBlueprint.render(current_user)
  end
end
