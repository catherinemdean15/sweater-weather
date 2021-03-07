class ForecastFacade
  class << self
    def get_forecast(geocode)
      data = ForecastService.search_forecast(geocode)
      Forecast.new(data)
    end
  end
end
