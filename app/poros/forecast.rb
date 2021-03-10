class Forecast
  attr_reader :current_weather, :hourly_weather, :daily_weather, :id

  def initialize(data)
    @id = nil
    @current_weather = CurrentWeather.new(data[:current])
    @hourly_weather = data[:hourly].first(8).map { |hour| HourlyWeather.new(hour) }
    @daily_weather = data[:daily].first(5).map { |day| DailyWeather.new(day) }
  end

  def find_weather(travel_time)
    if travel_time != "impossible"
      arrival_time = arrival_hour(travel_time)
      arrival_temp = hourly_weather.find do |hour|
        hour.time.split(":")[0] == arrival_time
      end
      {temperature: arrival_temp.temperature, conditions: arrival_temp.conditions}
    end
  end

  def arrival_hour(travel_time)
    split_time = travel_time.split(":")
    departure_time = Time.now
    departure_time += (split_time[0].to_i * 60 * 60)
    departure_time += (split_time[1].to_i * 60)
    departure_time.strftime('%I')
  end
end
