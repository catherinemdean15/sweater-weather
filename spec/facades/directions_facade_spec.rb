require 'rails_helper'

describe DirectionsFacade do
  it 'returns a direction poro', :vcr do
    start = 'Miami,FL'
    destination = 'Hollywood,FL'
    directions = DirectionsFacade.get_directions(start, destination)
    expect(directions).to be_a Direction
    expect(directions.travel_time).to be_a String
    expect(directions.travel_time).to eq('00 hours, 28 minutes')
  end
end
