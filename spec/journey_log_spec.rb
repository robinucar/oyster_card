require 'journeylog.rb'
describe JourneyLog do
  subject(:journey_log) {described_class.new}
  describe '#start' do
    before(:each) do
      journey_log.start('Bank')
    end
    it 'store the entry station' do
      expect(journey_log.current_journey).to eq({enter: 'Bank', exit: nil})
    end
  end
  describe '#end' do
    before(:each) do
      journey_log.start('Bank')
      journey_log.end('Finsburry Park')
    end
    it 'store completed journey' do
      expect(journey_log.journeys_list).to eq([{enter: 'Bank', exit: 'Finsburry Park'}])
    end
  end
  describe '#clear_journey' do
    it 'should clear enter and exit stations' do
      expect(journey_log.current_journey).to eq({enter: nil, exit: nil})
    end
  end
end