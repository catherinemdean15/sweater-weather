require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists' do
    data = { dt: 1_615_143_600,
             sunrise: 1_615_123_418,
             sunset: 1_615_165_104,
             temp: { day: 60.48, min: 43.23, max: 64.69, night: 49.35, eve: 58.55, morn: 43.29 },
             feels_like: { day: 54.52, night: 42.76, eve: 52, morn: 35.13 },
             pressure: 1017,
             humidity: 29,
             dew_point: 28.56,
             wind_speed: 3.29,
             wind_deg: 165,
             weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04d' }],
             clouds: 100,
             pop: 0,
             uvi: 4.25 }

    daily_weather = DailyWeather.new(data)
    expect(daily_weather).to be_a(DailyWeather)
    expect(daily_weather).to have_attributes(conditions: 'overcast clouds',
                                             date: 'Sun, 07 Mar 2021 12:00:00 -0700'.to_datetime,
                                             icon: '04d',
                                             max_temp: 64.69,
                                             min_temp: 43.23,
                                             sunrise: 'Sun, 07 Mar 2021 06:23:38 -0700'.to_datetime,
                                             sunset: 'Sun, 07 Mar 2021 17:58:24 -0700'.to_datetime)
  end
end
