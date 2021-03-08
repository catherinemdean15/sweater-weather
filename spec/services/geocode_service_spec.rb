require 'rails_helper'

describe GeocodeService do
  it 'returns geocode location', :vcr do
    location = 'GrandRapids,MI'
    data = GeocodeService.search_geocode(location)

    expect(data[:results]).to be_an(Array)
    expect(data[:results].first[:locations]).to be_an(Array)
    expect(data[:results].first[:locations].first[:displayLatLng]).to be_a(Hash)
  end

  it 'returns directions', :vcr do
    start = 'GrandRapids,MI'
    destination = 'Holland,MI'
    data = GeocodeService.search_directions(start, destination)

    expect(data).to have_key(:route)
    expect(data[:route]).to have_key(:legs)
    expect(data[:route]).to have_key(:formattedTime)
    expect(data[:route][:formattedTime]).to eq('00:29:32')
    expect(data[:route][:legs].first).to have_key(:maneuvers)
    expect(data[:route][:legs].first[:maneuvers]).to be_an(Array)
    expect(data[:route][:legs].first[:maneuvers].count).to eq(8)
  end
end
