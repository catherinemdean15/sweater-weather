class RestaurantFacade
  class << self
    def get_restaurant(destination, term)
      data = YelpService.search_business(destination, term)
      Restaurant.new(data)
    end
  end
end
