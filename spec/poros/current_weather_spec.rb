require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists' do
    data = { dt: 1_615_135_825,
             sunrise: 1_615_123_418,
             sunset: 1_615_165_104,
             temp: 57.33,
             feels_like: 51.94,
             pressure: 1019,
             humidity: 25,
             dew_point: 22.98,
             uvi: 2.92,
             clouds: 100,
             visibility: 10_000,
             wind_speed: 1.01,
             wind_deg: 138,
             wind_gust: 3,
             weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04d' }] }

    current_weather = CurrentWeather.new(data)
    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather).to have_attributes(conditions: 'overcast clouds',
                                               datetime: 'Sun, 07 Mar 2021 09:50:25 -0700'.to_datetime,
                                               feels_like: 51.94,
                                               humidity: 25,
                                               icon: '04d',
                                               sunrise: 'Sun, 07 Mar 2021 06:23:38 -0700'.to_datetime,
                                               sunset: 'Sun, 07 Mar 2021 17:58:24 -0700'.to_datetime,
                                               temperature: 57.33,
                                               uvi: 2.92,
                                               visibility: 10_000)
  end
end
