class GeocodeFacade
  class << self
    def get_geocode(location)
      data = GeocodeService.search_geocode(location)[:results].first[:locations].first[:displayLatLng]
      Geocode.new(data)
    end
  end
end
