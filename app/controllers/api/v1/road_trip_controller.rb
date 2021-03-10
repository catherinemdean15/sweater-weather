class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(api_key: params[:api_key])
      data = RoadTripFacade.gather_information(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(data)
    else
      render json: {error: "valid api key is required"}, status: 401
    end
  end
end
