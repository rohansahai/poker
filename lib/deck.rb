require 'card'

class Deck
  def self.all_cards
    [].tap do |cards|
      Card.suits.each do |suit|
        Card.values.each do |value|
          cards << Card.new(suit, value)
        end
      end
    end
  end

  attr_reader :cards

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def draw(n = 1)
    raise "Not enough cards in the deck" if n > self.count
    self.cards.shift(n)
  end

  def count
    self.cards.size
  end
end