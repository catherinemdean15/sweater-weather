require 'rails_helper'

describe 'Background API' do
  it 'returns backgrounds', :vcr do
    get api_v1_backgrounds_index_path({ location: 'Denver,CO' })
    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)[:data]


    expect(background).to be_a(Hash)
    expect(background[:id]).to eq(nil)
    expect(background[:type]).to eq('image')
    expect(background[:attributes][:image][:url]).to eq('https://images.unsplash.com/photo-1587095711790-a642f7f5540c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxEZW52ZXIsQ08lMjBhZXJpYWx8ZW58MHx8fHwxNjE1MjU2NTA0&ixlib=rb-1.2.1&q=85')
    expect(background[:attributes][:image][:location]).to eq("Denver,CO")
    expect(background[:attributes][:description]).to eq("Skyscraper lit up with giant heart for health care workers and front liners during Covid-19 stay at home policy.")
    expect(background[:attributes][:credit][:source]).to eq("Unsplash API")
    expect(background[:attributes][:credit][:author]).to eq("brende")

  end

end
