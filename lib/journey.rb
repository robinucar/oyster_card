class Journey
  attr_reader :complete, :stations
  def initialize
    @complete = false #it is false by default
    @stations = {enter: nil, exit: nil}
  end
  def start(station)
    @stations[:enter] = station
    @complete = false
  end
end