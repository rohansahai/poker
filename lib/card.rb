
class Card
  SUIT_STRINGS = {
      :club    => "club",
      :diamond => "diamond",
      :heart  => "heart",
      :spade   => "spade"
    }

    VALUE_STRINGS = {
      :deuce => "2",
      :three => "3",
      :four  => "4",
      :five  => "5",
      :six   => "6",
      :seven => "7",
      :eight => "8",
      :nine  => "9",
      :ten   => "10",
      :jack  => "J",
      :queen => "Q",
      :king  => "K",
      :ace   => "A"
    }

    POKER_VALUE = {
      :deuce => 2,
      :three => 3,
      :four  => 4,
      :five  => 5,
      :six   => 6,
      :seven => 7,
      :eight => 8,
      :nine  => 9,
      :ten   => 10,
      :jack  => 10,
      :queen => 10,
      :king  => 10
    }

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    VALUE_STRINGS.keys
  end
end