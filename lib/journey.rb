class Journey
  attr_reader :complete, :stations, :journeys_list
  MINIMUM_FARE = 2
  PENALTY_FARE = 6
  def initialize
    @complete = false #it is false by default
    @stations = {enter: nil, exit: nil}
    @journeys_list = []
  end
  def start(station)
    @stations[:enter] = station
    @complete = false
  end
  def end(station)
    @stations[:exit] = station
    @complete = true
    store_journey
    clear_journey
  end
  def complete?
    @complete
  end
  def store_journey
    @journeys_list << @stations.dup
    
  end
  def fare
    @complete ? MINIMUM_FARE : PENALTY_FARE
  end
  def clear_journey
    @stations[:enter] = nil
    @stations[:exit] = nil
  end
end