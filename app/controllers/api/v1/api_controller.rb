class API::V1::ApiController < ApplicationController
  include Response
  before_action :authorize_request

  def authorize_request
    token = request.headers['Authorization']
    begin
      @current_user = User.find_by!(authentication_token: token)
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Unauthorized, please authenticate." }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end