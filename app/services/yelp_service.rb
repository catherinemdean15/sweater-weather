class YelpService
  class << self
    def search_business(destination, term)
      response = conn.get('/v3/businesses/search') do |req|
        req.params['location'] = destination
        req.params['open_now'] = true
        req.params['term'] = term
        req.params['limit'] = 1
      end
      parse_data(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.yelp.com') do |req|
        req.headers['Authorization'] = "Bearer #{ENV['yelp_api_key']}"
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
