require 'station.rb'
describe Station do
  let(:name){ 'Bank' }
  it 'should respond #initialize' do
    station = Station.new(name)
    expect(station).to respond_to {initialize}.with(1).argument
  end
  it 'should respond #set_zone' do
    station = Station.new(name)
    expect(station).to respond_to {set_zone}.with(1).argument
  end
  it 'should check the station' do
    station = Station.new(name)
    expect(station.set_zone(station.name)).to eq 1 
  end
  it 'should return the zone' do
    station = Station.new(name)
    expect(station.zone).to eq 1 
  end
  it 'return an error if station does not on the list' do
    expect{Station.new('not_a_station')}.to raise_error 'Station name does not exist...'
  end
end