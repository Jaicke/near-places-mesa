class API::V1::UsersController < API::V1::ApiController

  def update
    if current_user.update(user_params)
      render json: current_user, include: :profile
    else
      json_response(current_user, :unprocessable_entity)
    end
  end

  def show
    render json: current_user, include: :profile
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:id, :name, :city, :country, :street, :state])
  end

end