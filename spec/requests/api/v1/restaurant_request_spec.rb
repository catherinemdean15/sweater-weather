require 'rails_helper'

describe 'Restaurant API' do
  it 'returns trip information', :vcr do
    get api_v1_restaurant_index_path({ start: 'Denver,CO', destination: 'Breckenridge,CO', food: 'donut' })
    expect(response).to be_successful

    trip_info = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(trip_info[:id]).to eq(nil)
    expect(trip_info[:type]).to eq('munchie')

    expect(trip_info[:attributes]).to have_key(:destination_city)
    expect(trip_info[:attributes][:destination_city]).to be_a(String)

    expect(trip_info[:attributes]).to have_key(:travel_time)
    expect(trip_info[:attributes][:travel_time]).to be_a(String)

    expect(trip_info[:attributes]).to have_key(:forecast)
    expect(trip_info[:attributes][:forecast]).to be_a(Hash)

    expect(trip_info[:attributes][:forecast]).to have_key(:summary)
    expect(trip_info[:attributes][:forecast][:summary]).to be_a(String)
    expect(trip_info[:attributes][:forecast]).to have_key(:temperature)
    expect(trip_info[:attributes][:forecast][:temperature]).to be_a(Float)

    expect(trip_info[:attributes]).to have_key(:restaurant)
    expect(trip_info[:attributes][:restaurant]).to be_a(Hash)

    expect(trip_info[:attributes][:restaurant]).to have_key(:name)
    expect(trip_info[:attributes][:restaurant][:name]).to be_a(String)
    expect(trip_info[:attributes][:restaurant]).to have_key(:address)
    expect(trip_info[:attributes][:restaurant][:address]).to be_a(String)

    expect(trip_info[:attributes]).to_not have_key(:is_open)
    expect(trip_info[:attributes][:restaurant]).to_not be_an(Array)
  end

  it 'returns an error when params are missing' do
    get api_v1_restaurant_index_path({ start: '', destination: '', food: '' })
    error = JSON.parse(response.body, symbolize_names: true)

    expect(error).to have_key(:error)
    expect(error[:error]).to eq('params must include start, destination, and food')
  end

  xit 'returns an error if destination params are incorrect', :vcr do
    # this sad path testing is incomplete
    get api_v1_restaurant_index_path({ start: 'aslskcnsd', destination: 'a9sdfjk', food: 'pizza' })
    error = JSON.parse(response.body, symbolize_names: true)
    expect(error[:error]).to eq('destination cannot be found')
  end
end
