class Geocode
  attr_reader :latitude, :longitude

  def initialize(data)
    @latitude = data[:lat]
    @longitude = data[:lng]
  end
end
