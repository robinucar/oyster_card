
require 'journey'
describe Journey do
  subject(:journey) { described_class.new }
  let(:station) {double :station}
  describe 'complete?' do
    it 'returns false when journey has not completed yet' do
      journey.start(station)
      expect(journey.complete).to eq false
    end
  end
end