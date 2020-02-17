class API::V1::UsersController < API::V1::ApiController
	before_action :set_user, except: :index

	def update
		if @user.update(user_params)
			render json: @user, include: :profile
		else
			json_response(@user, :unprocessable_entity)
		end
	end

	def index
		render json: current_user, include: :profile
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:id, :name, :city, :country, :street, :state])
	end

	def set_user
		@user = User.find(params[:id])
	end

end