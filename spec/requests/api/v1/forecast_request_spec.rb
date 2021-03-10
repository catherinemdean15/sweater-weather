require 'rails_helper'

describe 'Forecast API' do
  it 'returns weather information', :vcr do
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

    expect(forecast[:attributes]).to_not have_key(:minutely_weather)
    expect(forecast[:attributes]).to_not have_key(:alerts)
  end

  it 'returns current weather information', :vcr do
    get api_v1_forecast_index_path({ location: 'Denver,CO' })
    expect(response).to be_successful

    current_weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:current_weather]

    expect(current_weather[:datetime]).to eq('2021-03-07T11:54:26.000-07:00')
    expect(current_weather[:datetime]).to be_a(String)

    expect(current_weather[:sunrise]).to eq('2021-03-07T06:23:38.000-07:00')
    expect(current_weather[:sunrise]).to be_a(String)

    expect(current_weather[:sunset]).to eq('2021-03-07T17:58:24.000-07:00')
    expect(current_weather[:sunset]).to be_a(String)

    expect(current_weather[:temperature]).to eq(64.72)
    expect(current_weather[:temperature]).to be_a(Float)

    expect(current_weather[:feels_like]).to eq(57.76)
    expect(current_weather[:feels_like]).to be_a(Float)

    expect(current_weather[:humidity]).to eq(11)
    expect(current_weather[:humidity]).to be_an(Integer)

    expect(current_weather[:uvi]).to eq(4.53)
    expect(current_weather[:uvi]).to be_a(Float)

    expect(current_weather[:visibility]).to eq(10_000)
    expect(current_weather[:visibility]).to be_an(Integer)

    expect(current_weather[:conditions]).to eq('overcast clouds')
    expect(current_weather[:conditions]).to be_a(String)

    expect(current_weather[:icon]).to eq('04d')
    expect(current_weather[:icon]).to be_a(String)

    expect(current_weather).to_not have_key(:wind_speed)
    expect(current_weather).to_not have_key(:wind_deg)
    expect(current_weather).to_not have_key(:dew_point)
    expect(current_weather).to_not have_key(:clouds)
    expect(current_weather).to_not have_key(:pressure)
  end

  it 'returns the daily weather', :vcr do
    get api_v1_forecast_index_path({ location: 'Denver,CO' })
    expect(response).to be_successful

    weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:daily_weather]

    expect(weather.count).to eq(5)

    daily_weather = weather.first

    expect(daily_weather[:date]).to eq('2021-03-07T12:00:00.000-07:00')
    expect(daily_weather[:date]).to be_a(String)

    expect(daily_weather[:sunrise]).to eq('2021-03-07T06:23:38.000-07:00')
    expect(daily_weather[:sunrise]).to be_a(String)

    expect(daily_weather[:sunset]).to eq('2021-03-07T17:58:24.000-07:00')
    expect(daily_weather[:sunset]).to be_a(String)

    expect(daily_weather[:max_temp]).to eq(64.72)
    expect(daily_weather[:max_temp]).to be_a(Float)

    expect(daily_weather[:min_temp]).to eq(43.23)
    expect(daily_weather[:min_temp]).to be_a(Float)

    expect(daily_weather[:conditions]).to eq('overcast clouds')
    expect(daily_weather[:conditions]).to be_a(String)

    expect(daily_weather[:icon]).to eq('04d')
    expect(daily_weather[:icon]).to be_a(String)

    expect(daily_weather).to_not have_key(:wind_speed)
    expect(daily_weather).to_not have_key(:wind_deg)
    expect(daily_weather).to_not have_key(:dew_point)
    expect(daily_weather).to_not have_key(:clouds)
    expect(daily_weather).to_not have_key(:pressure)
  end

  it 'returns the hourly weather', :vcr do
    get api_v1_forecast_index_path({ location: 'Denver,CO' })
    expect(response).to be_successful

    weather = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:hourly_weather]

    expect(weather.count).to eq(8)

    hourly_weather = weather.first

    expect(hourly_weather[:time]).to eq('11:00:00')
    expect(hourly_weather[:time]).to be_a(String)

    expect(hourly_weather[:temperature]).to eq(64.72)
    expect(hourly_weather[:temperature]).to be_a(Float)

    expect(hourly_weather[:conditions]).to eq('overcast clouds')
    expect(hourly_weather[:conditions]).to be_a(String)

    expect(hourly_weather[:icon]).to eq('04d')
    expect(hourly_weather[:icon]).to be_a(String)

    expect(hourly_weather).to_not have_key(:wind_speed)
    expect(hourly_weather).to_not have_key(:wind_deg)
    expect(hourly_weather).to_not have_key(:dew_point)
    expect(hourly_weather).to_not have_key(:clouds)
    expect(hourly_weather).to_not have_key(:pressure)
  end

  it 'returns an error if params are missing', :vcr do
    get api_v1_forecast_index_path({ location: '' })
    expect(response).to_not be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq('location must be included')
  end
end
