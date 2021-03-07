class Api::V1::ForecastController < ApplicationController
  def index
    @location = params[:location]
    @geocode = GeocodeFacade.get_geocode(@location)
    @forecast_data = ForecastFacade.get_forecast(@geocode)
    render json: ForecastSerializer.new(@forecast_data)
  end
end
