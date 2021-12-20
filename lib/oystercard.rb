require_relative 'journey'
class Oystercard
  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1
  attr_accessor :balance, :journey
  def initialize(balance = 5)
    @balance = balance

    @journey = Journey.new
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
    @journey.entry_station(entry_station)
  end
  def touch_out(exit_station)
    deduct(journey.fare)
    @journey.exit_station(exit_station)
  end
  def in_journey?
    !@journey.complete?
  end
  private :deduct
end