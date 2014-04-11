require 'spec_helper'
require 'deck'

describe Deck do
  let(:cards) { [
    Card.new(:heart, :ace),
    Card.new(:spade, :deuce),
    Card.new(:diamond, :seven)
    ] }

  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }

    its(:count) { should == 52 }

    it "should return all unique cards" do
      mapped_cards = all_cards.map { |card| [card.suit, card.value] }.uniq
      expect(mapped_cards.count).to eq(52)
    end
  end

  describe "#initialize" do
    it "should by default fill it with a 52 card deck" do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end

    it "should be able to take an array of cards" do
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end

  describe "#draw" do
    let(:deck) { Deck.new }
    let(:new_deck) { Deck.new(cards.dup) }

    it "should remove card from the deck" do
      deck.draw
      expect(deck.count).to eq(51)
    end

    it "should remove from the top of the deck" do
      expect(new_deck.draw).to eq(cards[0..0])
      expect(new_deck.draw(2)).to eq(cards[1..2])
    end

    it "should be able to remove multiple cards" do
      deck.draw(4)
      expect(deck.count).to eq(48)
    end

    it "should not be able to over-draw" do
      expect { deck.draw(53) }.to raise_error "Not enough cards in the deck"
    end
  end
end