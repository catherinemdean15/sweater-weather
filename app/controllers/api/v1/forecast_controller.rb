class Api::V1::ForecastController < ApplicationController
  def index
    if !params[:location].empty? && params[:location]
      @location = params[:location]
      @geocode = GeocodeFacade.get_geocode(@location)
      @forecast_data = ForecastFacade.get_forecast(@geocode, (params[:units] || 'imperial'))
      render json: ForecastSerializer.new(@forecast_data)
    else
      render json: {error: 'location must be included'}, status: 404
    end
  end
end
