require 'oystercard'

context Oystercard do
  let(:start_station){double :start_station}
  let(:end_station){double :end_station }
  let(:journey){ { :entry_station => :start_station, :exit_station => :end_station } }
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
    expect(subject.in_journey?).to eq true
   end
    it 'should raise error if below minimum limit' do
      subject.balance = Oystercard::MINIMUM_LIMIT - 1
      message = 'You haven\'t got enough money'
      expect {subject.touch_in(:start_station)}.to raise_error message
    end
    it 'should store the entry station' do
      subject.touch_in(:start_station)
      expect(subject.journey[:entry_station]).to eq :start_station
    end
  end
  describe '#touch_out' do
    it 'should change the status of in_journey to false' do
      subject.touch_in(:start_station)
      subject.touch_out(:end_station)
      expect(subject.in_journey?).to eq false
    end
    it 'should deduct fare from balance' do
      fare = Oystercard::MINIMUM_FARE
      expect {subject.touch_out(:end_station)}.to change{subject.balance}.by(-fare)
    end
    it 'should store the exit station' do
      subject.touch_in(:start_station)
      subject.touch_out(:end_station)
      expect(subject.journeys[0][:exit_station]).to eq :end_station
    end
  end
  it 'has empty journey history as default' do
    expect(subject.journeys).to be_empty
  end
  it 'stores all journeys' do
    subject.touch_in(:start_station)
    subject.touch_out(:end_station)
    expect(subject.journeys).to include journey
  end
end