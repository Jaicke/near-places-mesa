class API::V1::SessionsController < API::V1::ApiController
	skip_before_action :authorize_request, only: :create

	def create
		user = User.find_by_email(user_params[:email])
		
		if user&.valid_password?(user_params[:password])
			render json: {email: user.email, authentication_token: user.authentication_token }, status: :ok
		else
			render json: { error: "Invalid Credentials" }, status: :unauthorized
		end
	end

	def destroy
		begin
			current_user.update_column(:authentication_token, nil)
			current_user.save # At saving, a new token is generated
			head :no_content
		rescue ActiveRecord::RecordNotFound => e
			render json: { errors: e.message }, status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end

end