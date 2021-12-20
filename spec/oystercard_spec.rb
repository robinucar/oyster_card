require 'oystercard'
require 'journey'

context Oystercard do
  subject(:oystercard) { described_class.new }
  journey = Journey.new
  let(:start_station){double :start_station}
  let(:end_station){double :end_station }
  
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

=begin describe '#deduct' do
 it { is_expected.to respond_to(:deduct).with(1).argument }
    it 'deducts amount from balance' do
      expect { subject.deduct 1 }.to change {subject.balance}.by -1
    end
  end
=end
  describe '#touch_in' do
   it 'should change the status of in_journey to true' do
    subject.touch_in(:start_station)
    expect(subject).to be_in_journey
   end
    it 'should raise error if below minimum limit' do
      subject.balance = Oystercard::MINIMUM_LIMIT - 1
      message = 'You haven\'t got enough money'
      expect {subject.touch_in(:start_station)}.to raise_error message
    end

  end
  describe '#touch_out' do
    it 'should change the status of in_journey to false' do
      subject.touch_in(:start_station)
      subject.touch_out(:end_station)
      expect(subject).to_not be_in_journey
    end
    it 'should deduct fare from balance' do
      expect {subject.touch_out(:end_station)}.to change{subject.balance}.by(-journey.fare)
    end

  end
end