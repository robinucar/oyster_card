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
  end 
  
end