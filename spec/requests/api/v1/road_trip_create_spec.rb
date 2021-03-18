require 'rails_helper'

describe 'Road Trip API' do
  it 'returns road trip information', :vcr do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    data = {
      "origin": 'Denver,CO',
      "destination": 'Pueblo,CO',
      "api_key": user.api_key
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post api_v1_road_trip_index_path, params: data

    expect(response).to be_successful

    roadtrip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(roadtrip[:id]).to eq(nil)
    expect(roadtrip[:type]).to eq('roadtrip')

    expect(roadtrip[:attributes]).to have_key(:start_city)
    expect(roadtrip[:attributes][:start_city]).to eq(data[:origin])
    expect(roadtrip[:attributes]).to have_key(:end_city)
    expect(roadtrip[:attributes][:end_city]).to eq(data[:destination])
    expect(roadtrip[:attributes]).to have_key(:travel_time)
    expect(roadtrip[:attributes][:travel_time]).to be_a(String)
    expect(roadtrip[:attributes]).to have_key(:weather_at_eta)
    expect(roadtrip[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(roadtrip[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(roadtrip[:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'returns error if API key is invalid', :vcr do
    User.create!(email: 'whatever@example.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')

    data = {
      "origin": 'Denver,CO',
      "destination": 'Pueblo,CO',
      "api_key": 'this is an invalid api key'
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post api_v1_road_trip_index_path, params: data
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(error[:error]).to eq('valid api key is required')
  end

  it 'returns error if API key is missing', :vcr do
    User.create!(email: 'whatever@example.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')

    data = {
      "origin": 'Denver,CO',
      "destination": 'Pueblo,CO',
      "api_key": ''
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post api_v1_road_trip_index_path, params: data
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(error[:error]).to eq('valid api key is required')
  end

  it 'returns a message when travel is impossible by car', :vcr do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    data = {
      "origin": 'Denver,CO',
      "destination": 'Honolulu, HI',
      "api_key": user.api_key
    }
    post api_v1_road_trip_index_path, params: data
    expect(response).to be_successful

    roadtrip = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(roadtrip[:id]).to eq(nil)
    expect(roadtrip[:type]).to eq('roadtrip')

    expect(roadtrip[:attributes]).to have_key(:start_city)
    expect(roadtrip[:attributes][:start_city]).to eq(data[:origin])
    expect(roadtrip[:attributes]).to have_key(:end_city)
    expect(roadtrip[:attributes][:end_city]).to eq(data[:destination])
    expect(roadtrip[:attributes]).to have_key(:travel_time)
    expect(roadtrip[:attributes][:travel_time]).to eq('impossible')
    expect(roadtrip[:attributes]).to have_key(:weather_at_eta)
    expect(roadtrip[:attributes][:weather_at_eta]).to eq(nil)
  end

  it 'returns road trip information over long distances', :vcr do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    data = {
      "origin": 'Los Angeles,CA',
      "destination": 'New York City,NY',
      "api_key": user.api_key
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post api_v1_road_trip_index_path, params: data
    expect(response).to be_successful

    roadtrip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(roadtrip[:id]).to eq(nil)
    expect(roadtrip[:type]).to eq('roadtrip')

    expect(roadtrip[:attributes]).to have_key(:start_city)
    expect(roadtrip[:attributes][:start_city]).to eq(data[:origin])
    expect(roadtrip[:attributes]).to have_key(:end_city)
    expect(roadtrip[:attributes][:end_city]).to eq(data[:destination])
    expect(roadtrip[:attributes]).to have_key(:travel_time)
    expect(roadtrip[:attributes][:travel_time]).to be_a(String)
    expect(roadtrip[:attributes]).to have_key(:weather_at_eta)
    expect(roadtrip[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(roadtrip[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(roadtrip[:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(roadtrip[:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
