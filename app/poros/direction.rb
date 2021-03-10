
class Direction
  attr_reader :travel_time

  def initialize(data)
    # I called this class Direction so we could reasonably expand the information to include directions, not just travel time
    @travel_time = (data[:route][:formattedTime]) || "impossible"
  end

  def formatted_time
    parts = self.travel_time.split(":")
    "#{parts[0]} hours, #{parts[1]} minutes"
  end
end
