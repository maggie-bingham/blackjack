require_relative 'card'

class Deck

  attr_accessor :cards
  #Making a deck of cards
  def initialize
    @cards = []
    suits = %w(hearts diamonds spades clubs)
    suits.each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value, value)
      end
      @cards << Card.new(suit, 10, "J")
      @cards << Card.new(suit, 10, "Q")
      @cards << Card.new(suit, 10, "K")
      @cards << Card.new(suit, 11, "A")
    end
    shuffle!
  end
  #Method for shuffling cards
  def shuffle!
    self.cards.shuffle!
  end

end
