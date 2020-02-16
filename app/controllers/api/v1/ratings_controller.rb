class API::V1::RatingsController < API::V1::ApiController
	before_action :set_place

	def index
		@ratings = @place.ratings
		render json: @ratings.to_json(include: :user), status: :ok
	end
	
	def create
		@rating = @place.ratings.new(rating_params)
		@rating.user_id = current_user.id

		if @rating.save
			json_response(@rating, :created)
		else
			json_response(@rating, :unprocessable_entity)
		end
	end

	private

	def set_place
		@place = Place.find(params[:place_id])
	end

	def rating_params
		params.require(:rating).permit(:note, :comment)
	end
end