require 'rails_helper'

describe RestaurantFacade do
  it 'returns a restaurant poro', :vcr do
    destination = 'Hollywood,FL'
    term = 'ceviche'
    restaurant = RestaurantFacade.get_restaurant(destination, term)
    expect(restaurant).to be_a Restaurant
    expect(restaurant.name).to eq('Pachamanka Authentic Peruvian Cuisine')
    expect(restaurant.address).to eq('321 Johnson St Hollywood, FL 33019')
  end
end
