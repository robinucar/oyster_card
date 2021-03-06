class JourneyLog
  attr_reader :current_journey, :journeys_list
  def initialize
    @current_journey = {enter: nil, exit: nil}
    @journeys_list = []
  end
  def start(station)
    @current_journey[:enter] = station
  end
  def end(station)
    @current_journey[:exit] = station
    save_journey
    clear_journey
  end

  def save_journey
    @journeys_list << @current_journey.dup
  end
end
def clear_journey
  @current_journey[:enter] = nil
  @current_journey[:exit] = nil
end