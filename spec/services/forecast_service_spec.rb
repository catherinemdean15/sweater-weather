require 'rails_helper'

describe ForecastService do
  it 'returns forecast information', :vcr do
    geocode = Geocode.new({ lat: 39.738453, lng: -104.984853 })
    units = "imperial"
    data = ForecastService.search_forecast(geocode, units)

    expect(data).to have_key(:current)
    expect(data[:current]).to be_an(Hash)
    expect(data).to have_key(:daily)
    expect(data[:daily]).to be_a(Array)
    expect(data).to have_key(:hourly)
    expect(data[:hourly]).to be_an(Array)
  end
end
