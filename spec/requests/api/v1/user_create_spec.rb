require 'rails_helper'

describe 'User creation API' do
  it 'creates a user', :vcr do
    data = {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
    headers = { "CONTENT_TYPE" => "application/json" }
    post api_v1_users_path, params: data
    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response.status).to eq(201)
    expect(user[:type]).to eq('users')
    expect(user[:attributes]).to be_a(Hash)
    expect(user[:attributes][:email]).to eq(data[:email])
    expect(user[:attributes]).to have_key(:api_key)
    expect(user[:attributes][:api_key]).to be_a(String)
    expect(user[:attributes][:api_key]).to_not be_nil


  end

  it 'returns an error if params are missing', :vcr do
    data = {
          "email": "",
          "password": "password",
          "password_confirmation": "password"
        }
    headers = { "CONTENT_TYPE" => "application/json" }
    post api_v1_users_path, params: data
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(error[:error]).to eq("unable to register new user")
  end

  it 'returns an error if passwords do not match', :vcr do
    data = {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "not the same password"
        }
    headers = { "CONTENT_TYPE" => "application/json" }
    post api_v1_users_path, params: data
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(401)
    expect(error[:error]).to eq('passwords do not match')
  end
end
