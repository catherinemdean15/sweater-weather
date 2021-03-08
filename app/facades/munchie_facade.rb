class MunchieFacade
  class << self
    def get_trip_info(start, destination, term)
      destination_geocode = GeocodeFacade.get_geocode(destination)
      destination_temperature = ForecastFacade.get_current_temperature(destination_geocode)
      restaurant = RestaurantFacade.get_restaurant(destination, term)
      directions = DirectionsFacade.get_directions(start, destination)
      Munchie.new(destination, destination_temperature, restaurant, directions)
    end
  end
end
