require 'rails_helper'

RSpec.describe CurrentTemperature do
  it 'exists' do
    data = { lat: 39.7385,
             lon: -104.9849,
             timezone: 'America/Denver',
             timezone_offset: -25_200,
             current: { dt: 1_615_225_245,
                        sunrise: 1_615_209_724,
                        sunset: 1_615_251_567,
                        temp: 51.49,
                        feels_like: 45.7,
                        pressure: 1027,
                        humidity: 34,
                        dew_point: 25,
                        uvi: 3.26,
                        clouds: 100,
                        visibility: 10_000,
                        wind_speed: 2.15,
                        wind_deg: 177,
                        weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04d' }] } }

    current_temperature = CurrentTemperature.new(data)
    expect(current_temperature).to be_a(CurrentTemperature)
    expect(current_temperature).to have_attributes(temperature: 51.49,
                                                   summary: 'overcast clouds')
  end
end
