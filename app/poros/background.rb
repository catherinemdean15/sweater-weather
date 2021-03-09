class Background
  attr_reader :image, :description, :credit, :id

  def initialize(data, location)
    @id = nil
    @image = {url: data[:results].first[:urls][:full],
              location: location }
    @description = data[:results].first[:description]
    @credit = {source: "Unsplash API",
              author: data[:results].first[:user][:username]}
  end
end
