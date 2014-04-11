require 'spec_helper'
require 'card'

describe Card do
  describe "::suits" do
    it "should return an array of suits" do
      expect(Card.suits).to eq([:spade, :club, :diamond, :heart])
    end
  end
end