class DirectionsFacade
  class << self
    def get_directions(start, destination)
      directions = GeocodeService.search_directions(start, destination)
      # Direction poro currently only holds travel time, but is called direction for scalability
      Direction.new(directions)
    end
  end
end
