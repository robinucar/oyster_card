class Oystercard
  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1
  MINIMUM_FARE = 2
  attr_reader :balance, :entry_station
  def initialize(balance = 5)
    @balance = balance
    @entry_station
  end
  def top_up(amount)
    raise "Error: £#{BALANCE_LIMIT} limit reached" if balance + amount > BALANCE_LIMIT
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end
  def touch_in(station)
    raise 'You haven\'t got enough money' if balance < MINIMUM_LIMIT
    @entry_station = station
  end
  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = false
  end
  def in_journey?
    !!@entry_station
  end
  
end