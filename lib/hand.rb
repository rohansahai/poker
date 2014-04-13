require './lib/deck.rb'

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
    indices.reverse.each { |idx| self.cards.delete_at(idx) }
    self.cards += deck.draw(indices.size)
  end

  def beats?(other_hand)
    self.points > other_hand.points
  end

  def points
    case
    when royal_flush?
      900 + high_card.suit_value
    when straight_flush?
      800 + high_card.poker_value * 5 + high_card.suit_value
    when four_of_a_kind?
      high_match = find_matching_high_card(4).first
      700 + high_match.poker_value * 5 + high_match.suit_value
    when full_house?
      high_match = find_matching_high_card(3).first
      600 + high_match.poker_value * 5 + high_match.suit_value
    when flush?
      500 + high_card.poker_value * 5 + high_card.suit_value
    when straight?
      400 + high_card.poker_value * 5 + high_card.suit_value
    when three_of_a_kind?
      high_match = find_matching_high_card(3).first
      300 + high_match.poker_value * 5 + high_match.suit_value
    when two_pair?
      high_match = find_matching_high_card(2).last
      200 + high_match.poker_value * 5 + high_match.suit_value
    when pair?
      high_match = find_matching_high_card(1).last
      100 + high_match.poker_value * 5 + high_match.suit_value
    else
      high_card.poker_value + high_card.suit_value
    end
  end

  def find_matching_high_card(n)
    values = self.cards.map(&:poker_value)

    [].tap do |matching_pairs|
      self.cards.each do |card|
        matching_pairs << card if values.count(card.poker_value) == n
      end
    end.sort_by { |card| card.poker_value }
  end

  def high_card
    self.cards.sort { |card| card.poker_value }.first
  end

  def royal_flush?
    values = self.cards.map(&:value)
    flush? && [:ten, :jack, :queen, :king, :ace].sort == values.sort
  end

  def straight?
    values = self.cards.sort_by { |card| card.poker_value }.map(&:value)
    Card.values.join.include?(values.join)
  end

  def flush?
    suits = self.cards.map(&:suit)
    suits.uniq.size == 1
  end

  def straight_flush?
    straight? && flush?
  end

  def three_of_a_kind?
    values = self.cards.map(&:value)
    values.any? { |value| values.count(value) == 3 }
  end

  def pair?
    values = self.cards.map(&:value)
    values.any? { |value| values.count(value) == 2 }
  end

  def full_house?
    values = self.cards.map(&:value)
    threes, values = values.partition { |i| values.count(i) == 3 }
    !(threes.empty? || values.uniq.size > 1)
  end

  def four_of_a_kind?
    values = self.cards.map(&:value)
    values.any? { |value| values.count(value) == 4 }
  end

  def two_pair?
    card_hash = Hash.new(0)
    values = self.cards.map(&:value)
    values.each { |value| card_hash[value] += 1 }
    card_hash.values.count(2) == 2
  end

  # def calculate_hand
#     case self.cards
#     when straigh
#   end

  protected

  attr_writer :cards

end