
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
    it 'store the exit station' do
      expect(journey.stations).to eq({enter: 'Bank', exit: 'Finsburry Park'})
    end
    it 'store completed journey' do
      expect(journey.store_journey).to eq([{enter: 'Bank', exit: 'Finsburry Park'}])
    end
  end 
end