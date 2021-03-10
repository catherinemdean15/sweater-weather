class ForecastFacade
  class << self
    def get_forecast(geocode, units)
      data = ForecastService.search_forecast(geocode, units)
      Forecast.new(data)
    end
  end
end
