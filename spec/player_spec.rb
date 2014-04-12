require 'spec_helper'
require 'player'
require 'deck'

describe Player do
  subject(:player) { Player.new("Gerald", 500) }
  let(:deck) { Deck.new }

  describe "#initialize" do
    it "should have initialized values" do
      expect(player.name).to eq("Gerald")
      expect(player.bankroll).to eq(500)
    end
  end

  describe "#draw_cards" do
    it "should take in an valid set of cards" do
      cards = deck.draw(5)
      player.draw_cards(cards)

      expect(player.cards.size).to eq(5)
      expect(player.cards).to eq(cards)
    end
  end

  describe "#place_bet" do
    it "should deduct bet from bankroll" do
      player.place_bet(300)

      expect(player.bankroll).to eq(200)
    end

    it "should return the bet amount" do
      bet = player.place_bet(300)
      expect(bet).to eq(300)
    end

    it "should not allow player to bet more than bankroll" do
      expect {
        player.place_bet(501)
      }.to raise_error "You ain't got enough money."
    end
  end

  describe "#fold" do
    it "should return false" do
      expect(player.fold).to be false
    end
  end

end