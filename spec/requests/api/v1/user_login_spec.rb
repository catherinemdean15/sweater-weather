require 'rails_helper'

describe 'User login API' do
  it 'creates a session', :vcr do
    user = User.create!(email: 'whatever@example.com', password: 'password', api_key: 'this#2is7^an99example>?api`key!')

    data = {
          "email": "whatever@example.com",
          "password": "password",
        }
    headers = { "CONTENT_TYPE" => "application/json" }
    post api_v1_sessions_path, params: data
    expect(response).to be_successful

    session = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response.status).to eq(200)
    expect(session[:type]).to eq('users')
    expect(session[:attributes]).to be_a(Hash)
    expect(session[:attributes][:email]).to eq(user.email)
    expect(session[:attributes]).to have_key(:api_key)
    expect(session[:attributes][:api_key]).to be_a(String)
    expect(session[:attributes][:api_key]).to_not be_nil
  end

  it 'returns an error if username or password is missing', :vcr do
    user = User.create!(email: 'whatever@example.com', password: 'password', api_key: 'this#2is7^an99example>?api`key!')

    data = {
          "email": "",
          "password": "password",
        }
    headers = { "CONTENT_TYPE" => "application/json" }
    post api_v1_sessions_path, params: data
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(401)
    expect(error[:error]).to eq("incorrect credentials")
  end

  it 'returns an error if password is incorrect', :vcr do
    user = User.create!(email: 'whatever@example.com', password: 'password', api_key: 'this#2is7^an99example>?api`key!')
    data = {
          "email": "whatever@example.com",
          "password": "not the right password",
        }
    headers = { "CONTENT_TYPE" => "application/json" }
    post api_v1_sessions_path, params: data
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(401)
    expect(error[:error]).to eq('incorrect credentials')
  end

  it 'returns an error if user does not appear in the database', :vcr do
    data = {
          "email": "whatever@example.com",
          "password": "password",
        }
    headers = { "CONTENT_TYPE" => "application/json" }
    post api_v1_sessions_path, params: data
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(401)
    expect(error[:error]).to eq('incorrect credentials')
  end
end
