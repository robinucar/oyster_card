class Oystercard
  
  attr_reader :balance
  def initialize
    @balance = 0
  end
  def top_up(arg)
   @balance += arg.to_i
  end
end