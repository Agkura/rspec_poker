require "rspec"
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  let(:second) { Deck.new }

  describe '#initialize' do
    it 'assigns 52 cards' do
      expect(deck.num_cards).to eq(52)
    end
    it 'has 52 unique cards' do
      cards = deck.draw(52)
      expect(cards.uniq).to eq(cards)
    end
  end

  describe '#draw' do
    it 'returns a card' do
      cards = deck.draw
      expect(cards.first).to be_a(Card)
    end
    it 'decrements by one by default' do
      deck.draw
      expect(deck.num_cards).to eq(51)
    end

    it 'decrements by argument amount' do
      deck.draw(5)
      expect(deck.num_cards).to eq(47)
    end
    it 'raises an error if not enough cards' do
      expect { deck.draw(53) }.to raise_error('Not enough cards')
    end
  end

  describe '#shuffle' do
    before(:each) { deck.shuffle }
    it 'shuffles the cards' do
      cards = deck.draw(52)
      cards2 = second.draw(52)
      expect(cards).to_not eq(cards2)
    end
  end

end
