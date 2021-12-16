class Oystercard
  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1
  MINIMUM_FARE = 2
  attr_accessor :balance, :journeys, :journey
  def initialize(balance = 5)
    @balance = balance
    @journeys = []
    @journey = {}
  end
  def top_up(amount)
    raise "Error: £#{BALANCE_LIMIT} limit reached" if balance + amount > BALANCE_LIMIT
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end
  def touch_in(entry_station)
    raise 'You haven\'t got enough money' if balance < MINIMUM_LIMIT
    @journey = {:entry_station => entry_station}
  end
  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journey[:exit_station] = exit_station
    store_journey
    clear_journey
  end
  def store_journey
    @journeys << @journey.dup  # store copy of journey to the journeys array
  end
  def clear_journey
    @journey[:entry_station] = nil
    @journey[:exit_station] = nil
  end
  def in_journey?
    !!@journey[:entry_station]
  end
  private :deduct, :store_journey, :clear_journey
end