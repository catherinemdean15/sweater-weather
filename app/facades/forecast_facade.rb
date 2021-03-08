class ForecastFacade
  class << self
    def get_forecast(geocode)
      data = ForecastService.search_forecast(geocode)
      Forecast.new(data)
    end

    def get_current_temperature(geocode)
      # this utilizes the same service call but creates a different poro
      # this is just for time-saving and potential caching purposes, but could reasonably be a different call that returns less infomration
      data = ForecastService.search_forecast(geocode)
      CurrentTemperature.new(data)
    end
  end
end
