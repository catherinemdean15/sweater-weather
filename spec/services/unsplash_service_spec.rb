require 'rails_helper'

describe UnsplashService do
  it 'returns image', :vcr do
    location = 'GrandRapids,MI'
    weather = 'snow flurries'
    data = UnsplashService.find_image(location, weather)

    expect(data[:results]).to be_an(Array)
    expect(data[:results].count).to eq(1)
    expect(data[:results].first[:urls][:full]).to be_a(String)
  end
end
