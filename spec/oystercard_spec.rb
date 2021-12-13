require 'oystercard'

describe Oystercard do
  it 'should respond to #initialize' do
  oystercard = Oystercard.new
  expect(oystercard).to respond_to 'balance'
end
end