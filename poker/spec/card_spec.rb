require "rspec"
require "card"

describe Card do
  subject(:card) { Card.new(8, :spade) }

  describe "#initialize" do
    it "sets value" do
      expect(card.value).to eq(8)
    end
    it "sets suit" do
      expect(card.suit).to eq(:spade)
    end
  end

end
