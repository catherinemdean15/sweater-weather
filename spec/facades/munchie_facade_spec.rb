require 'rails_helper'

describe MunchieFacade do
  it 'returns a munchie poro', :vcr do
    start = 'Miami,FL'
    destination = 'Hollywood,FL'
    term = 'ceviche'
    trip = MunchieFacade.get_trip_info(start, destination, term)
    expect(trip).to be_a Munchie
    expect(trip.destination_city).to eq('Hollywood,FL')
    expect(trip.travel_time).to be_a(String)
    expect(trip.forecast).to be_a(Hash)
    expect(trip.forecast).to have_key(:summary)
    expect(trip.forecast).to have_key(:temperature)
  end
end
