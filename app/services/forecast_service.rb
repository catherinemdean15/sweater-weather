class ForecastService
  class << self
    def search_forecast(geocode)
      response = conn.get('/data/2.5/onecall?') do |req|
        req.params['appid'] = ENV['openweather_api_key']
        req.params['lat'] = geocode.latitude
        req.params['lon'] = geocode.longitude
        req.params['exclude'] = 'minutely,alerts'
        req.params['units'] = 'imperial'
      end
      parse_data(response)
    end

    private

    def conn
      Faraday.new('https://api.openweathermap.org')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
