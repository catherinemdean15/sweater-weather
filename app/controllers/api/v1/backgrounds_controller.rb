class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].nil? || params[:location].empty? 
      render json: {error: 'location must be included'}
    else
    geocode = GeocodeFacade.get_geocode(params[:location])
    weather = ForecastFacade.get_forecast(geocode, (params[:units] if params[:units])).current_weather.conditions
    background= UnsplashFacade.get_background(params[:location], weather)
    render json: BackgroundSerializer.new(background)
    end
  end
end
