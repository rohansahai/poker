class Player
  attr_reader :name, :bankroll, :cards

  def initialize(name, bankroll)
    @name, @bankroll = name, bankroll
  end

  def draw_cards(cards)
    self.cards = cards
  end

  def place_bet(amount)
    raise "You ain't got enough money." if self.bankroll < amount

    self.bankroll -= amount

    amount
  end

  def fold
    false
  end


  protected

  attr_writer :cards, :bankroll
end