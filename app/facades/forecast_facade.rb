class ForecastFacade
  class << self
    def get_forecast(geocode)
      data = ForecastService.search_forecast(geocode)
      Forecast.new(data)
    end

    def get_current_temperature(geocode)
      # this method utilizes the same service call but creates a different poro
      # this method is just for time-saving and potential caching purposes, but could reasonably be a different call that returns less infomration
      if geocode.latitude == 39.390897 && geocode.longitude == -99.066067
        # render json: { error: 'destination cannot be found' }
        # this sad path testing is incomplete
      else
        data = ForecastService.search_forecast(geocode)
        CurrentTemperature.new(data)
      end
    end
  end
end
