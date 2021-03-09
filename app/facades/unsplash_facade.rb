class UnsplashFacade
  class << self
    def get_background(location)
      data = UnsplashService.find_image(location)
      Background.new(data, location)
    end
  end
end
