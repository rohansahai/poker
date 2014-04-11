require 'spec_helper'
require 'card'

describe Card do
  describe "::suits" do
    it "should return an array of suits" do
      expect(Card.suits).to eq([:club, :diamond, :heart, :spade])
    end
  end

  describe "::values" do
    it "should return an array of card values" do
      expect(Card.values).to eq([
        :deuce, :three, :four, :five, :six, :seven,
        :eight, :nine, :ten, :jack, :queen, :king, :ace
      ])
    end
  end

  describe "#initialize" do
    let(:card) { Card.new(:club, :deuce) }

    it "should have a valid suit" do
      expect(Card.suits).to include(card.suit)
    end

    it "should have a valid value" do
      expect(Card.values).to include(card.value)
    end
  end
end
