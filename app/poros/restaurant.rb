class Restaurant
  attr_reader :name, :address

  def initialize(data)
    @name = data[:businesses].first[:name]
    @address = data[:businesses].first[:location][:display_address].join(' ')
  end
end
