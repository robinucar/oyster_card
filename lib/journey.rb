require_relative 'journeylog'
class Journey
  attr_reader :complete, :journey_log
  MINIMUM_FARE = 2
  PENALTY_FARE = 6
  def initialize
    @complete = false #it is false by default
    @journey_log = JourneyLog.new
  end
  def entry_station(station)
    @journey_log.start(station)
    @complete = false
  end
  def exit_station(station)
    @journey_log.end(station)
    @complete = true
  end
  def complete?
    @complete
  end
  
  def fare
    @complete ? MINIMUM_FARE : PENALTY_FARE
  end
end