require 'rails_helper'

describe 'Background API' do
  it 'returns backgrounds', :vcr do
    get api_v1_backgrounds_path({ location: 'Denver,CO' })
    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(background).to be_a(Hash)
    expect(background[:id]).to eq(nil)
    expect(background[:type]).to eq('image')
    expect(background[:attributes][:image][:url]).to eq("https://images.unsplash.com/photo-1606619854196-d123ca4cd096?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMTMzNjl8MHwxfHNlYXJjaHwxfHxEZW52ZXIsQ08lMjBhZXJpYWwlMjBvdmVyY2FzdCUyMGNsb3Vkc3xlbnwwfHx8fDE2MTUzNDU1ODA&ixlib=rb-1.2.1&q=85")
    expect(background[:attributes][:image][:location]).to eq("Denver,CO")
    expect(background[:attributes][:description]).to eq("Aerial panoramic view of West High School")
    expect(background[:attributes][:credit][:source]).to eq("Unsplash API")
    expect(background[:attributes][:credit][:author]).to eq("andrewcoop")

  end

  it 'returns an error if params are missing', :vcr do
    get api_v1_backgrounds_path({ location: '' })
    expect(response).to be_successful

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:error]).to eq('location must be included')
  end
end
