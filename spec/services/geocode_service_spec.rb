require 'rails_helper'

describe GeocodeService do
  it 'returns geocode location', :vcr do
    location = 'GrandRapids,MI'
    data = GeocodeService.search_geocode(location)

    expect(data[:results]).to be_an(Array)
    expect(data[:results].first[:locations]).to be_an(Array)
    expect(data[:results].first[:locations].first[:displayLatLng]).to be_a(Hash)
  end
end
