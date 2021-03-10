class UnsplashService
  class << self
    def find_image(location, weather)
      response = conn.get('search/photos?') do |req|
        req.params['client_id'] = ENV['unsplash_api_key']
        req.params['query'] = "#{location} aerial #{weather}"
        req.params['per_page'] = 1
      end
      parse_data(response)
    end

    private

    def conn
      Faraday.new('https://api.unsplash.com')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
