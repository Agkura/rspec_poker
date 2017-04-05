require 'rspec'
require 'tdd'

describe Array do
  describe '#my_uniq' do
    subject(:array) { [5,5,5,5] }
    it 'removes duplicates in an array' do
      expect([1,2,1,3,3].my_uniq).to match_array([1,2,3])
    end
    it 'doesn\'t reorder the array' do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
    it 'does not mutate original array' do
      array.my_uniq
      expect(array).to eq([5,5,5,5])
    end
    it 'returns an empty array if given an empty array' do
      expect([].my_uniq).to eq([])
    end
  end

  describe '#two_sum' do
    subject(:arr) {[-1, 0, 2, -2, 1]}

    it 'will find sums' do
      expect(arr.two_sum).to match_array([[0,4], [2,3]])
    end
    it 'gives each sum sorted "dictionary-wise"' do
      pairs = arr.two_sum
      expect(pairs).to eq(pairs.sort)
    end
    it 'should not give duplicate pairs' do
      expect(arr.two_sum).to eq([[0,4],[2,3]])
    end
  end

  describe '#my_transpose' do
    subject(:matrix) {[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]}
    it 'should not mutate original array' do
      matrix.my_transpose
      expect(matrix).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
    end

    it 'should not call Array#transpose' do
      expect(matrix).to_not receive(:transpose)
      matrix.my_transpose
    end

    it 'should transpose the array' do
      expect(matrix.my_transpose).to eq([[0,3,6], [1,4,7], [2,5,8]])
    end
  end
end

describe "#stock_picker" do
  subject(:stocks) { [6,2,3,4,5,3] }

  it 'it first buys then sells' do
    expect(stock_picker(stocks)).to eq(stock_picker(stocks).sort)
  end
  it 'picks days with highest profit' do
    expect(stock_picker(stocks)).to eq([1,4])
  end
  it 'picks the smallest loss if no profit' do
    expect(stock_picker([5,4,2])).to eq([0,1])
  end
end
