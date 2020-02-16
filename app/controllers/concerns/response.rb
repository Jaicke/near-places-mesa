module Response
  def json_response(object, status = :ok)
    if object.errors.empty?
      render json: object, status: status
    else
      render json: { errors: object.errors.full_messages }, status: status
    end
  end
end