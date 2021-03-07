require 'rails_helper'

describe 'Forecast API' do
  it 'returns weather information' do
    get api_v1_forecast_index_path({ location: 'Denver,CO' })
    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(forecast[:id]).to eq(nil)
    expect(forecast[:type]).to eq('forecast')

    expect(forecast[:attributes]).to have_key(:current_weather)
    expect(forecast[:attributes][:current_weather]).to be_an(Hash)
    expect(forecast[:attributes]).to have_key(:daily_weather)
    expect(forecast[:attributes][:daily_weather]).to be_a(Array)
    expect(forecast[:attributes]).to have_key(:hourly_weather)
    expect(forecast[:attributes][:hourly_weather]).to be_an(Array)
  end

  xit 'returns current weather information' do
    get api_v1_forecast_path
    expect(response).to be_successful

    current_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:current_weather]

    expect(current_weather.datetime).to eq
    expect(current_weather.datetime).to be_a(String)

    expect(current_weather.sunrise).to eq
    expect(current_weather.sunrise).to be_a(String)

    expect(current_weather.sunset).to eq
    expect(current_weather.sunset).to be_a(String)

    expect(current_weather.temperature).to eq
    expect(current_weather.temperature).to be_a(Float)

    expect(current_weather.feels_like).to eq
    expect(current_weather.feels_like).to be_a(Float)

    expect(current_weather.humidity).to eq
    expect(current_weather.humidity).to be_a(Float)

    expect(current_weather.uvi).to eq
    expect(current_weather.uvi).to be_a(Float)

    expect(current_weather.visibility).to eq
    expect(current_weather.visibility).to be_a(Float)

    expect(current_weather.conditions).to eq
    expect(current_weather.conditions).to be_a(String)

    expect(current_weather.icon).to eq
    expect(current_weather.icon).to be_a(String)
  end

  xit 'returns the daily weather' do
    get api_v1_forecast_path
    expect(response).to be_successful

    daily_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:daily_weather].first

    expect(daily_weather.date).to eq
    expect(daily_weather.date).to be_a(String)

    expect(daily_weather.sunrise).to eq
    expect(daily_weather.sunrise).to be_a(String)

    expect(daily_weather.sunset).to eq
    expect(daily_weather.sunset).to be_a(String)

    expect(daily_weather.max_temp).to eq
    expect(daily_weather.max_temp).to be_a(Float)

    expect(daily_weather.min_temp).to be_a(Float)

    expect(daily_weather.conditions).to eq
    expect(daily_weather.conditions).to be_a(String)

    expect(daily_weather.icon).to eq
    expect(daily_weather.icon).to be_a(String)
  end

  xit 'returns the hourly weather' do
    get api_v1_forecast_path
    expect(response).to be_successful

    hourly_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:hourly_weather].first

    expect(hourly_weather.time).to eq
    expect(hourly_weather.time).to be_a(String)

    expect(hourly_weather.temperature).to eq
    expect(hourly_weather.temperature).to be_a(Float)

    expect(hourly_weather.conditions).to eq
    expect(hourly_weather.conditions).to be_a(String)

    expect(hourly_weather.icon).to eq
    expect(hourly_weather.icon).to be_a(String)
  end
end
