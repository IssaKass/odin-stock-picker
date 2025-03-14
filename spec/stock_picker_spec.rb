require 'rspec'
require_relative '../stock_picker'

RSpec.describe '#stock_picker' do
  context 'when given a typical array of prices' do
    it 'returns the correct buy and sell days for maximum profit' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    end
  end

  context 'when prices are strictly increasing' do
    it 'buys on the first day and sells on the last day' do
      expect(stock_picker([1, 2, 3, 4, 5, 6, 7, 8])).to eq([0, 7])
    end
  end

  context 'when prices are strictly decreasing' do
    it 'returns the best of no profit (buy and sell on the same day)' do
      expect(stock_picker([8, 7, 6, 5, 4, 3, 2, 1])).to eq([0, 0])
    end
  end

  context 'when all prices are the same' do
    it 'returns the first day as both buy and sell' do
      expect(stock_picker([5, 5, 5, 5, 5])).to eq([0, 0])
    end
  end

  context 'when there is only one price' do
    it 'returns the same day as buy and sell' do
      expect(stock_picker([10])).to eq([0, 0])
    end
  end

  context 'when the array is empty' do
    it 'returns an empty array' do
      expect(stock_picker([])).to eq([0, 0])
    end
  end
end
