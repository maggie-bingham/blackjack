require_relative 'card'
require_relative 'deck'

class Hand

  attr_accessor :dealt

  def initialize
    @dealt = []
  end
  #What to do when player wants to hit
  def hit!(deck)
    @dealt << deck.cards.shift
  end
  #Helps to keep track of score
  def score
    dealt.inject(0){|sum,card| sum + card.value}
  end
  #Rules for how Dealer should play
  def auto_dealer(deck)
    if score < 16
      hit!(deck)
      auto_dealer(deck)
    end
  end

end
