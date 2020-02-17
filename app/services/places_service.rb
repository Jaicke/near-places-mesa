class PlacesService
  def initialize(current_user, params)
    @current_user = current_user
    @params = params
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
    current_user_location = geolocation_search_by(params_coordinates)
    current_user_location = geolocation_search_by(@current_user.coordinates) if current_user_location.nil?

    @places = Place.near(current_user_location.coordinates)
  end

  def params_coordinates
    [@params[:lat], @params[:long]]
  end

  def geolocation_search_by(search_param)
    Geocoder.search(search_param).first
  end

end
