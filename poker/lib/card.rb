class Card
  attr_reader :suit, :value
  SUITS = [:club, :spade, :heart, :diamond]
  VALUES = (1..13).to_a

  def initialize(value, suit)
    @suit = suit
    @value = value
  end


  def ==(card)
    value == card.value && suit == card.suit
  end

  def <=>(card)
    case value <=> card.value
    when 1
      1
    when -1
      -1
    when 0
      SUITS.index(suit) <=> SUITS.index(card.suit)
    end
  end


end
