class RoadTripFacade
  class << self
    def gather_information(origin, destination, units)
      geocode = GeocodeFacade.get_geocode(destination)
      travel_time = DirectionsFacade.get_directions(origin, destination)
      weather_at_eta = ForecastFacade.get_forecast(geocode, units)
      RoadTrip.new(origin, destination, travel_time, weather_at_eta)
    end
  end
end
