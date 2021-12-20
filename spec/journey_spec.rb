
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
=begin
describe '#end' do
    before(:each) do
      journey.start('Bank')
      journey.end('Finsburry Park')
    end
    it 'store completed journey' do
      expect(journey.journeys_list).to eq([{enter: 'Bank', exit: 'Finsburry Park'}])
    end
  end
=end
=begin
describe '#clear_journey' do
    it 'should clear enter and exit stations' do
      expect(journey.stations).to eq({enter: nil, exit: nil})
    end
  end
=end
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