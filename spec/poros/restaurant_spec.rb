require 'rails_helper'

RSpec.describe Restaurant do
  it 'exists' do
    data = { businesses: [{ id: 'jwalZ-ZJDzwv2ukp29DHMg',
                            alias: 'pachamanka-authentic-peruvian-cuisine-hollywood-3',
                            name: 'Pachamanka Authentic Peruvian Cuisine',
                            image_url: 'https://s3-media3.fl.yelpcdn.com/bphoto/WrQF2IoZUVzPYetwbpV7xA/o.jpg',
                            is_closed: false,
                            url: 'https://www.yelp.com/biz/pachamanka-authentic-peruvian-cuisine-hollywood-3?adjust_creative=exsKdI4IsMWYS3_DdjaKlg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=exsKdI4IsMWYS3_DdjaKlg',
                            review_count: 503,
                            categories: [{ alias: 'peruvian', title: 'Peruvian' },
                                         { alias: 'seafood', title: 'Seafood' }],
                            rating: 4.5,
                            coordinates: { latitude: 26.01972,
                                           longitude: -80.1159 },
                            transactions: %w[delivery pickup],
                            price: '$$',
                            location: { address1: '321 Johnson St',
                                        address2: '',
                                        address3: '',
                                        city: 'Hollywood',
                                        zip_code: '33019',
                                        country: 'US',
                                        state: 'FL',
                                        display_address: ['321 Johnson St',
                                                          'Hollywood, FL 33019'] },
                            phone: '+19549261020',
                            display_phone: '(954) 926-1020',
                            distance: 6766.11772060313 }],
             total: 348,
             region: { center: { longitude: -80.1837158203125,
                                 latitude: 26.019729291096752 } } }

    restaurant = Restaurant.new(data)
    expect(restaurant).to be_a(Restaurant)
    expect(restaurant).to have_attributes(name: 'Pachamanka Authentic Peruvian Cuisine',
                                          address: '321 Johnson St Hollywood, FL 33019')
  end
end
