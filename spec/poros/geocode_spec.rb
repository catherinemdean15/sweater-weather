require 'rails_helper'

RSpec.describe Geocode do
  it 'exists' do
    data = { lat: 39.738453, lng: -104.984853 }

    geocode = Geocode.new(data)
    expect(geocode).to be_a(Geocode)
    expect(geocode).to have_attributes(latitude: 39.738453,
                                       longitude: -104.984853)
  end
end
