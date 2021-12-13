require 'oystercard'

context Oystercard do
  it 'should respond to #initialize' do
    oystercard = Oystercard.new
    expect(oystercard).to respond_to {'initialize'}
  end
  # top up balance
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'can top up the balance' do
      expect { subject.top_up 1 }.to change {subject.balance}.by 1
    end
    it 'raises error message if limit exceeded' do
      limit = Oystercard::BALANCE_LIMIT
      subject.top_up(limit - subject.balance)
      message = "Error: £#{limit} limit reached"
      expect { subject.top_up 10 }.to raise_error message
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }
    it 'deducts amount from balance' do
      expect { subject.deduct 1 }.to change {subject.balance}.by -1
    end
  end
  describe '#touch_in' do
   it 'should change the status of in_journey to true' do
    subject.touch_in
    expect(subject.in_journey?).to eq true
   end
    it 'should raise error if below minimum limit' do
      balance = subject.balance
      subject.deduct(balance)
      message = 'You haven\'t got enough money'
      expect {subject.touch_in}.to raise_error message
    end
  end
  describe '#touch_out' do
    it 'should change the status of in_journey to false' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
    it 'should deduct fare from balance' do
      fare = Oystercard::MINIMUM_FARE
      expect {subject.touch_out}.to change{subject.balance}.by(-fare)
    end
  end

end