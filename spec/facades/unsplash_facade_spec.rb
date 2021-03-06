require 'rails_helper'

describe UnsplashFacade do
  it 'returns a background poro', :vcr do
    location = 'St.Louis,MO'
    weather = 'sunny'
    background = UnsplashFacade.get_background(location, weather)
    expect(background).to be_a(Background)
    expect(background.image).to be_a(Hash)
    expect(background.credit).to be_a(Hash)
  end
end
