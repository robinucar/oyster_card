class Oystercard
  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1
  attr_reader :balance, :in_journey
  def initialize(balance = 5)
    @balance = balance
    @in_journey = false
    
  end
  def top_up(amount)
    raise "Error: £#{BALANCE_LIMIT} limit reached" if balance + amount > BALANCE_LIMIT
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end
  def touch_in
    raise 'You haven\'t got enough money' if balance < MINIMUM_LIMIT
    @in_journey = true
  end
  def touch_out
    @in_journey = false
  end
  def in_journey?
   @in_journey
  end
  
end