require 'rails_helper'

describe ForecastFacade do
  it 'returns a forecast poro', :vcr do
    geocode = Geocode.new({ lat: 39.738453, lng: -104.984853 })
    data = ForecastFacade.get_forecast(geocode)

    expect(data).to be_a(Forecast)
    expect(data.id).to eq(nil)
    expect(data.current_weather).to be_a(CurrentWeather)
    expect(data.hourly_weather).to be_an(Array)
    expect(data.hourly_weather.first).to be_a(HourlyWeather)
    expect(data.daily_weather).to be_an(Array)
    expect(data.daily_weather.first).to be_a(DailyWeather)
  end

  it 'returns a current temperature poro', :vcr do
    geocode = Geocode.new({ lat: 39.738453, lng: -104.984853 })
    data = ForecastFacade.get_current_temperature(geocode)
    expect(data).to be_a(CurrentTemperature)
    expect(data.temperature).to eq(51.49)
    expect(data.summary).to eq('overcast clouds')
  end
end
