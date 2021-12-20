
require 'journey'
describe Journey do
  subject(:journey) { described_class.new }
  let(:station) {double :station}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  
  describe '#complete?' do
    it 'returns false when journey has not completed yet' do
      journey.entry_station(station)
      expect(journey.complete).to eq false
    end
  end
  describe '#fare' do
   it 'should return the fare after touch in and touch out' do
    journey.entry_station('Bank')
    journey.exit_station('Finsburry Park')
    expect(journey.fare).to eq Journey::MINIMUM_FARE
   end
   it 'should return the panelty fare if there is not exit station' do
    journey.entry_station('Bank')
    journey.entry_station('Manor House')
    expect(journey.fare).to eq Journey::PENALTY_FARE
   end
  end
end