require 'rspec'
require 'hanoi'

describe Hanoi do
  subject(:hanoi) { Hanoi.new }
  describe '#initialize' do
    it 'should make an array of three towers' do
      expect(hanoi.towers.length).to eq(3)
    end

    it 'should set each tower as an array' do
      expect(hanoi.towers[0]).to be_an(Array)
    end

    it 'should have 3 discs in zeroeth index' do
      expect(hanoi.towers[0].length).to eq(3)
    end

    it 'should have the other indices empty' do
      expect(hanoi.towers[1].length).to eq(0)
      expect(hanoi.towers[2].length).to eq(0)
    end
  end

  describe '#valid_move?' do
    before(:each) { hanoi.move([0,1]) }
    it 'returns true when moving disk to empty tower' do
      expect(hanoi.valid_move?([0, 2])).to eq(true)
    end

    it 'doesn\'t take from an empty tower' do
      expect(hanoi.valid_move?([2,0])).to eq(false)
    end
    it 'returns true when moving disk onto a larger disk' do
      expect(hanoi.valid_move?([1, 0])).to eq(true)
    end

    it 'does not place disc onto a smaller disc' do
      expect(hanoi.valid_move?([0, 1])).to eq(false)
    end

    it 'return false if given invalid tower' do
      expect(hanoi.valid_move?([3,2])).to eq(false)
    end
  end

  describe '#move' do
    before(:each) { hanoi.move([0,1]) }

    it 'takes a disc from start tower' do
      expect(hanoi.towers[0].length).to eq(2)
    end

    it 'adds to end tower' do
      expect(hanoi.towers[1].length).to eq(1)
    end
  end


  describe '#won?' do
    let(:win) { Hanoi.new([[],[], [3,2,1]]) }
    let(:win1) { Hanoi.new([[],[3,2,1], []]) }

    it 'does not return true for starting tower' do
      expect(hanoi.won?).to eq(false)
    end

    it 'returns false when discs are on different towers' do
      hanoi.move([0,1])
      hanoi.move([0,2])
      expect(hanoi.won?).to eq(false)
    end
    it 'returns true when third is in win condition' do
      expect(win.won?).to eq(true)
    end
    it 'returns true when second is in win condition' do
      expect(win1.won?).to eq(true)
    end
  end
end
