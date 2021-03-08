class Munchie
  attr_reader :destination_city, :travel_time, :forecast, :restaurant, :id

  def initialize(destination, destination_temperature, restaurant, directions)
    @id = nil
    @destination_city = destination
    @travel_time = directions.travel_time
    @forecast = { summary: destination_temperature.summary,
                  temperature: destination_temperature.temperature }
    @restaurant = { name: restaurant.name,
                    address: restaurant.address }
  end
end
