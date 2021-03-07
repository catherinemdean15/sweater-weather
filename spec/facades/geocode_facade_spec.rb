require 'rails_helper'

describe GeocodeFacade do
  it 'returns a geocode poro', :vcr do
    location = 'Miami,FL'
    geocode = GeocodeFacade.get_geocode(location)
    expect(geocode).to be_a Geocode
    expect(geocode.latitude).to be_a(Float)
    expect(geocode.latitude).to eq(25.775084)
    expect(geocode.longitude).to be_a(Float)
    expect(geocode.longitude).to eq(-80.194702)
  end
end
