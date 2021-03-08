class CurrentTemperature
  attr_reader :temperature,
              :summary

  def initialize(data)
    @temperature = data[:current][:temp].to_f
    @summary = data[:current][:weather].first[:description]
  end
end
