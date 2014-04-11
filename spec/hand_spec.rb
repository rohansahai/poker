require 'spec_helper'
require 'hand'

describe Hand do
  let(:deck) { Deck.new }
  let(:hand) { Hand.new(deck) }

  let(:bad_deck) { Deck.new([
    Card.new(:spade, :ten),
    Card.new(:diamond, :deuce),
    Card.new(:heart, :three),
    Card.new(:club, :eight),
    Card.new(:spade, :four)
  ]) }
  let(:bad_hand)   { Hand.new(bad_deck)}

  let(:royal_cards) { Deck.new([
    Card.new(:spade, :ten),
    Card.new(:spade, :jack),
    Card.new(:spade, :queen),
    Card.new(:spade, :king),
    Card.new(:spade, :ace)
  ]) }
  let(:royal_hand) { Hand.new(royal_cards) }

  let(:straight_deck) { Deck.new([
    Card.new(:spade, :ten),
    Card.new(:heart, :jack),
    Card.new(:spade, :queen),
    Card.new(:club, :king),
    Card.new(:spade, :nine)
  ]) }
  let(:straight_hand) { Hand.new(straight_deck) }

  let(:flush_deck) { Deck.new([
    Card.new(:spade, :ace),
    Card.new(:spade, :jack),
    Card.new(:spade, :seven),
    Card.new(:spade, :deuce),
    Card.new(:spade, :nine)
  ]) }
  let(:flush_hand) { Hand.new(flush_deck) }

  let(:straight_flush_deck) { Deck.new([
    Card.new(:spade, :deuce),
    Card.new(:spade, :three),
    Card.new(:spade, :four),
    Card.new(:spade, :five),
    Card.new(:spade, :six)
  ]) }
  let(:straight_flush_hand) { Hand.new(straight_flush_deck) }

  let(:three_deck) { Deck.new([
    Card.new(:heart, :four),
    Card.new(:club, :three),
    Card.new(:diamond, :four),
    Card.new(:spade, :four),
    Card.new(:spade, :six)
  ]) }
  let(:three_hand) { Hand.new(three_deck) }

  let(:four_deck) { Deck.new([
    Card.new(:heart, :four),
    Card.new(:club, :four),
    Card.new(:diamond, :four),
    Card.new(:spade, :four),
    Card.new(:spade, :six)
  ]) }
  let(:four_hand) { Hand.new(four_deck) }

  let(:pair_deck) { Deck.new([
    Card.new(:heart, :four),
    Card.new(:club, :three),
    Card.new(:diamond, :jack),
    Card.new(:spade, :four),
    Card.new(:spade, :six)
  ]) }
  let(:pair_hand) { Hand.new(pair_deck) }

  let(:two_pair_deck) { Deck.new([
    Card.new(:heart, :four),
    Card.new(:club, :three),
    Card.new(:diamond, :six),
    Card.new(:spade, :four),
    Card.new(:spade, :six)
  ]) }
  let(:two_pair_hand) { Hand.new(two_pair_deck) }

  let(:full_house_deck) { Deck.new([
    Card.new(:heart, :six),
    Card.new(:club, :six),
    Card.new(:diamond, :jack),
    Card.new(:spade, :jack),
    Card.new(:spade, :six)
  ]) }
  let(:full_house_hand) { Hand.new(full_house_deck) }

  describe "#initialize" do
    it "should have five cards" do
      expect(hand.count).to eq(5)
    end
  end

  describe "#discard_and_draw" do
    let(:discarded_cards) { [hand.cards[0], hand.cards[1], hand.cards[2]] }
    it "should discard up to three cards" do
      hand.discard_and_draw([0, 1, 2])
      expect(hand.cards).to_not include(discarded_cards)
    end

    it "should still have 5 cards" do
      hand.discard_and_draw([0, 1, 2])
      expect(hand.count).to eq(5)
    end

    it "should not discard more than 3 cards" do
      expect do
        hand.discard_and_draw([0, 1, 2, 3])
      end.to raise_error "Cannot discard more than three cards."
    end
  end

  describe "#royal_flush?" do
    it "should return true if royal flush" do
      expect(royal_hand).to be_royal_flush
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_royal_flush
    end
  end

  describe "#straight?" do
    it "should return true if hand contains straight" do
      expect(straight_hand).to be_straight
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_straight
    end

  end

  describe "#flush?" do
    it "should return true if hand contains flush" do
      expect(flush_hand).to be_flush
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_flush
    end
  end

  describe "#straight_flush?" do
    it "should return true if hand contains straight flush" do
      expect(straight_flush_hand).to be_straight_flush
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_straight_flush
    end
  end

  describe "#three_of_a_kind?" do
    it "should return true if hand contains three of a kind" do
      expect(three_hand).to be_three_of_a_kind
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_three_of_a_kind
    end
  end

  describe "#four_of_a_kind?" do
    it "should return true if hand contains four of a kind" do
      expect(four_hand).to be_four_of_a_kind
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_four_of_a_kind
    end
  end

  describe "#pair?" do
    it "should return true if hand contains pair" do
      expect(pair_hand).to be_pair
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_pair
    end
  end

  describe "#two_pair?" do
    it "should return true if hand contains two_pair" do
      expect(two_pair_hand).to be_two_pair
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_two_pair
    end
  end

  describe "#full_house?" do
    it "should return true if hand contains full_house" do
      expect(full_house_hand).to be_full_house
    end

    it "should not return true if the hand sucks" do
      expect(bad_hand).to_not be_full_house
    end
  end

  describe "#calculate_points" do

  end

end