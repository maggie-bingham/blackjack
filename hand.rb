require_relative 'card'
require_relative 'deck'

class Hand

  attr_accessor :dealt

  def initialize
    @dealt = []
  end

  def hit!(deck)
    @dealt << deck.cards.shift
  end

  def score
    dealt.inject(0){|sum,card| sum + card.value}
  end

  def auto_dealer(deck)
    if score <= 16
      hit!(deck)
      auto_dealer(deck)
    end
  end

end
