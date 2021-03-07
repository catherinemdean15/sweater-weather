class GeocodeService
  class << self
    def search_geocode(location)
      response = conn.get('/geocoding/v1/address?') do |req|
        req.params['key'] = ENV['mapquest_api_key']
        req.params['location'] = location
      end
      parse_data(response)
    end

    private

    def conn
      Faraday.new('http://www.mapquestapi.com')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
