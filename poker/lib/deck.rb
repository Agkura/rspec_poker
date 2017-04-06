require_relative "card"

class Deck

  def initialize
    @cards = []
    fill_deck
  end

  def num_cards
    @cards.length
  end

  def draw(count = 1)
    raise "Not enough cards" if count > num_cards
    drawn = []
    count.times {drawn << @cards.pop}
    drawn
  end

  def shuffle
    @cards.shuffle!
  end

  private

  def fill_deck
    Card::SUITS.each do |suit|
      Card::VALUES.each { |value| @cards << Card.new(value, suit) }
    end
  end


end
