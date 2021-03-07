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
end
