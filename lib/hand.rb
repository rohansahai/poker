require 'deck'

class Hand
  attr_reader :cards, :deck

  def initialize(deck)
    @cards, @deck = deck.draw(5), deck
  end

  def count
    self.cards.size
  end

  def discard_and_draw(indices)
    raise "Cannot discard more than three cards." if indices.size > 3
    indices.each { |idx| self.cards.delete_at(idx) }
    self.cards += deck.draw(indices.size)
  end

  def royal_flush?
    suits = self.cards.map(&:suit)
    values = self.cards.map(&:value)

    suits.uniq == suits && [:ten, :jack, :queen, :king, :ace].sort == values.sort
  end

  def straight?
    values = self.cards.map(&:value).sort
    Card.values.join.include?(values.join)
  end

  # def calculate_hand
#     case self.cards
#     when straigh
#   end

  protected

  attr_writer :cards

end