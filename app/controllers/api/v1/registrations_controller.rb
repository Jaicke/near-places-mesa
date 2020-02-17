class API::V1::RegistrationsController < API::V1::ApiController
  skip_before_action :authorize_request

  def create
    user = User.new(user_params)
    user.build_profile(user_params[:profile_attributes])
    if user.save
      json_response(user, :created)
    else
      json_response(user, :unprocessable_entity)
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:name, :city, :country, :street, :state])
  end

end