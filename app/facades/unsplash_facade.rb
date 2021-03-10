class UnsplashFacade
  class << self
    def get_background(location, weather)
      data = UnsplashService.find_image(location, weather)
      Background.new(data, location)
    end
  end
end
