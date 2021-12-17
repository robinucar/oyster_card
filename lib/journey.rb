class Journey
  attr_reader :complete, :stations, :journeys_list
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
  end
  def complete?
    @complete
  end
  def store_journey
    @journeys_list << @stations
  end
end