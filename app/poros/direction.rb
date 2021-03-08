class Direction
  attr_reader :travel_time

  def initialize(data)
    # I called this class Direction so we could reasonably expand the information to include directions, not just travel time
    @travel_time = Time.at(data[:route][:realTime]).utc.strftime('%H hours, %M minutes')
  end
end
