class Player
  attr_reader :name, :bankroll, :cards, :hand, :thrown_in

  def initialize(name, bankroll, deck = Deck.new)
    @name, @bankroll = name, bankroll
    @hand = Hand.new(deck)
    @thrown_in = 0
  end

  def draw_cards(cards)
    self.cards = cards
  end

  def place_bet(amount)
    raise "You ain't got enough money." if self.bankroll < amount

    self.bankroll -= amount
    @thrown_in += amount
  end
  
  def add_to_bankroll(amount)
    self.bankroll += amount
  end

  def fold
    false
  end


  protected

  attr_writer :cards, :bankroll, :thrown_in
end