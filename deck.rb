require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    suits = %w(hearts diamonds spades clubs)
    @cards = []
    suits.each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value, "#{value}")
      end
      @cards << Card.new(suit, 10, "J")
      @cards << Card.new(suit, 10, "Q")
      @cards << Card.new(suit, 10, "K")
      @cards << Card.new(suit, 11, "A")
    end
    shuffle!
  end

  def shuffle!
    self.cards.shuffle!
  end

end
