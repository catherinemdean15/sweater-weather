require 'rails_helper'

describe YelpService do
  it 'returns business information', :vcr do
    location = 'Denver,CO'
    term = 'donut'
    data = YelpService.search_restaurant(location, term)
    expect(data).to have_key(:businesses)
    expect(data[:businesses]).to be_an(Array)
    expect(data[:businesses].count).to eq(1)
    expect(data[:businesses].first).to have_key(:name)
    expect(data[:businesses].first[:name]).to eq('The Doughnut Club - Denver')
    expect(data[:businesses].first).to have_key(:location)
    expect(data[:businesses].first[:location][:address1]).to eq('3040 Blake St')
    expect(data[:businesses].first[:is_closed]).to eq(false)
  end
end
