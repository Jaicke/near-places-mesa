class API::V1::PlacesController < API::V1::ApiController

  def index
    places_service = PlacesService.new(current_user, params, request)
    @places = places_service.filter

    if @places.any?
      render json: @places, status: :ok
    else
      render json: { errors: "Sorry, nowhere found." }, status: :not_found
    end
  end

  def create
    place = Place.new(places_params)

    if place.save
      json_response(place, :created)
    else
      json_response(place, :unprocessable_entity)
    end
  end


  private

  def places_params
    params.require(:place).permit(:name, :city, :country, :street, :state)
  end

end