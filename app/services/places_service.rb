class PlacesService
  def initialize(current_user, params, request)
    @current_user = current_user
    @params = params
    @request = request
  end

  def filter
    case @params[:format]
    when "list"
      places = Place.order(:name)
    when "map"
      places = filter_map
    else
      places = Place.all
    end
  end

  private

  def filter_map
    current_user_location = geolocation_search_by(@request.location.data["ip"])
    current_user_location = geolocation_search_by(@current_user.full_address) if current_user_location.latitude.nil?

    @places = Place.near(current_user_location.coordinates)
  end

  def geolocation_search_by(search_param)
    Geocoder.search(search_param).first
  end

end
