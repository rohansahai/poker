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

  describe "#calculate_hand" do
    let(:bad_hand)   { Hand.new(bad_deck)}

    describe "#royal_flush?" do
      let(:royal_cards) { Deck.new([
        Card.new(:spade, :ten),
        Card.new(:spade, :jack),
        Card.new(:spade, :queen),
        Card.new(:spade, :king),
        Card.new(:spade, :ace)
      ]) }

      let(:royal_hand) { Hand.new(royal_cards) }

      it "should return true if royal flush" do
        expect(royal_hand).to be_royal_flush
      end

      it "should not return true if the hand sucks" do
        expect(bad_hand).to_not be_royal_flush
      end
    end

    describe "#straight?" do
      let(:straight_deck) {Deck.new([
        Card.new(:spade, :ten),
        Card.new(:heart, :jack),
        Card.new(:spade, :queen),
        Card.new(:club, :king),
        Card.new(:spade, :nine)
      ])}

      let(:straight_hand) { Hand.new(straight_deck)}

      it "should return true if hand contains straight" do
        expect(straight_hand).to be_straight
      end

    end
  end

end