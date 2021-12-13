class Oystercard
  BALANCE_LIMIT = 90
  attr_reader :balance
  def initialize
    @balance = 0
  end
  def top_up(arg)
    raise "Error: £#{BALANCE_LIMIT} limit reached" if balance + arg > BALANCE_LIMIT
    @balance += arg
  end

end