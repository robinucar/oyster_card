
require 'journey'
describe Journey do
  subject(:journey) { described_class.new }
  let(:station) {double :station}
  describe '#complete?' do
    it 'returns false when journey has not completed yet' do
      journey.start(station)
      expect(journey.complete).to eq false
    end
  end
  describe '#start' do
    before(:each) do
      journey.start('Bank')
    end
    it 'store the entry station' do
      expect(journey.stations).to eq({enter: 'Bank', exit: nil})
    end
  end

  describe '#end' do
    before(:each) do
      journey.start('Bank')
      journey.end('Finsburry Park')
    end
    it 'store completed journey' do
      expect(journey.journeys_list).to eq([{enter: 'Bank', exit: 'Finsburry Park'}])
    end
  end
  describe '#clear_journey' do
    it 'should clear enter and exit stations' do
      expect(journey.stations).to eq({enter: nil, exit: nil})
    end
  end
  describe '#fare' do
   it 'should return the fare after touch in and touch out' do
    journey.start('Bank')
    journey.end('Finsburry Park')
    expect(journey.fare).to eq Journey::MINIMUM_FARE
   end
  end
end