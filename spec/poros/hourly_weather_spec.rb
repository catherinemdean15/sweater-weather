require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists' do
    data = { dt: 1_615_132_800,
             temp: 57.33,
             feels_like: 50.25,
             pressure: 1019,
             humidity: 25,
             dew_point: 22.98,
             uvi: 1.71,
             clouds: 100,
             visibility: 10_000,
             wind_speed: 4,
             wind_deg: 192,
             weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04d' }],
             pop: 0 }

    hourly_weather = HourlyWeather.new(data)
    expect(hourly_weather).to be_a(HourlyWeather)
    expect(hourly_weather).to have_attributes(conditions: 'overcast clouds',
                                              icon: '04d',
                                              temperature: 57.33,
                                              time: '04:00:00')
  end
end
